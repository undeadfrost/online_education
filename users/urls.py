from django.urls import path

from .views import UserInfoView, UploadImageView, UpdatePasswordView

app_name = 'users'

urlpatterns = [
    path('info/', UserInfoView.as_view(), name='user_info'),
    path('image/upload/', UploadImageView.as_view(), name='image_upload'),
    path('update/password/', UpdatePasswordView.as_view(), name='update_password')
]
