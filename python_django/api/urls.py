from rest_framework import routers

from api.views import FileUploaderAPI

router = routers.DefaultRouter()
router.register(r"file-uploads", FileUploaderAPI, basename="file-uploads")
urlpatterns = router.urls
