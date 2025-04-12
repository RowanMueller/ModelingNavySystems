from django.urls import path
from . import views
from . import auth
from rest_framework_simplejwt.views import TokenRefreshView, TokenVerifyView

urlpatterns = [
    path('devices/', views.DeviceListCreate.as_view(), name='device-list-create'),
    path('upload/', views.FileUploadView.as_view(), name='upload_file'),
    path('get-devices/', views.GetAllDevices.as_view(), name='get_devices'),
    path('register/', auth.RegisterView.as_view(), name='register'),
    path('login/', auth.LoginView.as_view(), name='login'),
    path('auth/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    path('auth/verify/', TokenVerifyView.as_view(), name='token_verify'),
    path('get-systems/', views.GetAllSystems.as_view(), name='get-systems'),
    path('create-system/', views.CreateSystemView.as_view(), name='create-system'),
    path('<int:systemId>/delete-system/', views.DeleteSystemView.as_view(), name='delete-system'),
    path('<int:systemId>/get-devices/', views.GetDevicesView.as_view(), name='get-devices-system'),
    path('<int:systemId>/get-connections/', views.GetConnectionsView.as_view(), name='get-connections-system'),
]