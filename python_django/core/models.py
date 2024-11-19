from django.db import models

from core.utils import get_file_category


class FileUpload(models.Model):
    CATEGORY_CHOICES = (
        ("Image", "Image"),
        ("Video", "Video"),
        ("Audio", "Audio"),
        ("Document", "Document"),
        ("Application", "Application"),
        ("Archive", "Archive"),
        ("Font", "Font"),
        ("Other", "Other"),
    )

    file = models.FileField(upload_to="file_uploads")
    category = models.CharField(max_length=50, choices=CATEGORY_CHOICES)
    uploaded_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.file.name

    def save(self, *args, **kwargs):
        self.category = get_file_category(self.file)
        super().save(*args, **kwargs)
