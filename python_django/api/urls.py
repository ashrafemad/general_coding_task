from django.conf import settings
from django.urls import path
from drf_yasg import openapi
from drf_yasg.views import get_schema_view
from rest_framework import routers

from api.views import FileUploaderAPI

schema_view = get_schema_view(
    openapi.Info(
        title="File Uploader API Docs",
        default_version="v1",
    ),
    public=settings.DEBUG,
)


router = routers.SimpleRouter()
router.register(r"file-uploads", FileUploaderAPI, basename="file-uploads")
urlpatterns = router.urls
urlpatterns += (
    path("", schema_view.with_ui("swagger", cache_timeout=0), name="schema-swagger-ui"),
)
