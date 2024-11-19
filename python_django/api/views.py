from django_filters.rest_framework import DjangoFilterBackend
from rest_framework.viewsets import ModelViewSet

from api.serializers import FileUploadSerializer
from core.models import FileUpload


class FileUploaderAPI(ModelViewSet):
    queryset = FileUpload.objects.order_by("-uploaded_at")
    serializer_class = FileUploadSerializer
    filter_backends = [DjangoFilterBackend]
    filterset_fields = [
        "category",
    ]
    http_method_names = ("get", "post")
