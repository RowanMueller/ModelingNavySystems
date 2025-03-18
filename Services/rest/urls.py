from django.urls import path
from . import views

urlpatterns = [
    path('devices/', views.DeviceListCreate.as_view(), name='device-list-create'),
    path('upload/', views.FileUploadView.as_view(), name='upload_file'),
]