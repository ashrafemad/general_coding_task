from django.core.files.uploadedfile import SimpleUploadedFile
from rest_framework.test import APITestCase

from core.models import FileUpload


class FileUploaderAPITest(APITestCase):

    def setUp(self):
        self.base_url = "/api/file-uploads/"
        self.pdf_content = "%PDF-1.4\n%âãÏÓ\n1 0 obj\n<</Type /Catalog /Pages 2 0 R>>\nendobj\n".encode(
            "utf-8"
        )
        self.image_content = (
            b"\x47\x49\x46\x38\x39\x61\x01\x00\x01\x00\x00\x00\x00\x21\xf9\x04"
            b"\x01\x0a\x00\x01\x00\x2c\x00\x00\x00\x00\x01\x00\x01\x00\x00\x02"
            b"\x02\x4c\x01\x00\x3b"
        )

    def test_get_file_uploads_request_success(self):
        response = self.client.get(self.base_url)
        self.assertEqual(response.status_code, 200)

    def test_delete_method_not_allowed(self):
        response = self.client.delete(self.base_url)
        self.assertEqual(response.status_code, 405)

    def test_put_method_not_allowed(self):
        response = self.client.put(self.base_url)
        self.assertEqual(response.status_code, 405)

    def test_patch_method_not_allowed(self):
        response = self.client.patch(self.base_url)
        self.assertEqual(response.status_code, 405)

    def test_list_file_uploads_returns_correct_data(self):
        file_1 = SimpleUploadedFile("file1.pdf", self.pdf_content)
        FileUpload.objects.create(file=file_1)
        file_2 = SimpleUploadedFile("file2.gif", self.image_content)
        FileUpload.objects.create(file=file_2)
        response = self.client.get(self.base_url)
        data = response.json()
        self.assertEqual(len(data), 2)
        # check ordering is correct
        self.assertIn("file2", data[0]["file"])
        self.assertIn("file1", data[1]["file"])
        # test categories set correctly
        self.assertEqual(data[0]["category"], "Image")
        self.assertEqual(data[1]["category"], "Document")

    def test_create_file_upload_mimetype_validation(self):
        file = SimpleUploadedFile("file2.txt", self.image_content)
        response = self.client.post(self.base_url, data={"file": file})
        self.assertEqual(response.status_code, 400)
        error = response.json()["file"]["error"]
        self.assertEqual(
            error,
            "Invalid file content, file extension is txt while file content is image/gif",
        )

    def test_create_file_upload_successfully(self):
        file = SimpleUploadedFile("file1.pdf", self.pdf_content)
        response = self.client.post(self.base_url, data={"file": file})
        self.assertEqual(response.status_code, 201)
        data = response.json()
        self.assertEqual(data["category"], "Document")

    def test_retreive_file_upload(self):
        file = SimpleUploadedFile("file1.pdf", self.pdf_content)
        obj = FileUpload.objects.create(file=file)
        response = self.client.get(f"{self.base_url}{obj.id}/")
        print()
        self.assertEqual(response.status_code, 200)
        data = response.json()
        self.assertEqual(data["id"], obj.id)
        self.assertEqual(data["category"], "Document")
        self.assertIn(obj.file.name, data["file"])

    def test_file_uploads_filter_by_type(self):
        file_1 = SimpleUploadedFile("file1.pdf", self.pdf_content)
        pdf = FileUpload.objects.create(file=file_1)
        file_2 = SimpleUploadedFile("file2.gif", self.image_content)
        image = FileUpload.objects.create(file=file_2)
        response = self.client.get(f"{self.base_url}?category=Image")
        data = response.json()
        self.assertEqual(len(data), 1)
        self.assertEqual(data[0]["id"], image.id)
        self.assertEqual(data[0]["category"], "Image")
        self.assertIn(image.file.name, data[0]["file"])

        response = self.client.get(f"{self.base_url}?category=Document")
        data = response.json()
        self.assertEqual(len(data), 1)
        self.assertEqual(data[0]["id"], pdf.id)
        self.assertEqual(data[0]["category"], "Document")
        self.assertIn(pdf.file.name, data[0]["file"])
