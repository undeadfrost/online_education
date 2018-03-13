from django.urls import path

from .views import UserInfoView, UploadImageView, UpdatePasswordView, \
    SendMailCodeView, UpdateEmailView, MyCourseView, MyFavView

app_name = 'users'

urlpatterns = [
    path('info/', UserInfoView.as_view(), name='user_info'),
    path('image/upload/', UploadImageView.as_view(), name='image_upload'),
    path('update/password/', UpdatePasswordView.as_view(), name='update_password'),
    path('send_email_code/', SendMailCodeView.as_view(), name='send_email_code'),
    path('update/email/', UpdateEmailView.as_view(), name='update_email'),
    path('courses/', MyCourseView.as_view(), name='user_courses'),
    path('fav/<int:fav_type>/', MyFavView.as_view(), name='user_fav'),
]
