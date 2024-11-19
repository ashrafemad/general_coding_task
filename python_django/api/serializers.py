import os

import filetype
from rest_framework import serializers
from rest_framework.exceptions import ValidationError

from core.constants import MAX_FILE_SIZE, MIMETYPE_EXTENSIONS_MAP
from core.models import FileUpload


class FileUploadSerializer(serializers.ModelSerializer):

    class Meta:
        model = FileUpload
        fields = ("id", "file", "category", "uploaded_at")
        read_only_fields = ("category",)

    def validate_file(self, file):
        # Validate file size
        if file.size > MAX_FILE_SIZE:
            raise ValidationError(
                {
                    "error": f"File is too large, file size is {file.size} bytes while file max file size is {MAX_FILE_SIZE}"
                }
            )

        # Validate file type based on Mime-type + Extension to avoid malicious uploaded files
        file_type = filetype.guess(file)
        if not file_type:
            raise ValidationError(
                {"error": "Invalid file type, could not determine file type"}
            )
        mime_type = file_type.mime

        # get uploaded file extension to check against it's correct mimetype
        extension = os.path.splitext(file.name)[-1].lower()[1:]
        if extension not in MIMETYPE_EXTENSIONS_MAP.get(mime_type, []):
            raise ValidationError(
                {
                    "error": f"Invalid file content, file extension is {extension} while file content is {mime_type}"
                }
            )
        return file
