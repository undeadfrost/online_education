"""online_education URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from django.views.generic import TemplateView
from django.views.static import serve
import xadmin

from .settings import MEDIA_ROOT
from users.views import LoginView, RegisterView, ActiveUserView, ForgetPasswordView, \
    ResetPasswordView, ModifyPasswordView

urlpatterns = [
    path('admin/', admin.site.urls),
    path('xadmin/', xadmin.site.urls),
    path('', TemplateView.as_view(template_name='index.html'), name='index'),
    path('media/<path:path>/', serve, {'document_root': MEDIA_ROOT}),
    path('login/', LoginView.as_view(), name='login'),
    path('register/', RegisterView.as_view(), name='register'),
    path('captcha/', include('captcha.urls')),
    path('active/<str:active_code>/', ActiveUserView.as_view(), name='user_active'),
    path('forget/', ForgetPasswordView.as_view(), name='forget_password'),
    path('reset/<str:active_code>/', ResetPasswordView.as_view(), name='reset_password'),
    path('modify_password/', ModifyPasswordView.as_view(), name='modify_password'),
    path('organization/', include('organization.urls')),
]
