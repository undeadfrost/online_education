from django.shortcuts import render
from django.contrib.auth import login, authenticate
from django.contrib.auth.backends import ModelBackend
from django.contrib.auth.hashers import make_password
from django.views.generic.base import View
from .models import UserProfile, EmailVerifyRecord
from .forms import LoginForm, RegisterForm
from utils import email_send

from django.db.models import Q
# Create your views here.


class LoginView(View):
    @staticmethod
    def get(request):
        return render(request, 'users/login.html')

    @staticmethod
    def post(request):
        login_form = LoginForm(request.POST)

        if login_form.is_valid():
            username = request.POST.get('username', '')
            password = request.POST.get('password', '')
            user = authenticate(username=username, password=password)
            if user is not None:
                login(request, user)
                return render(request, 'index.html')
            else:
                return render(request, 'users/login.html', {'msg': '用户名或密码错误！'})
        else:
            return render(request, 'users/login.html', {'login_form': login_form})


class CustomBackend(ModelBackend):
    def authenticate(self, request, username=None, password=None, **kwargs):
        try:
            user = UserProfile.objects.get(Q(username=username) | Q(email=username))
            if user.check_password(password):
                return user
        except Exception as e:
            return None


class RegisterView(View):
    def get(self, request):
        register_form = RegisterForm()
        return render(request, 'users/register.html', {'register_form': register_form})

    def post(self, request):
        register_form = RegisterForm(request.POST)
        if register_form.is_valid():
            email = request.POST.get('email', '')
            password = request.POST.get('password', '')

            if UserProfile.objects.filter(email=email):
                return render(request, 'users/register.html', {'msg': '该邮箱已注册'})

            user_profile = UserProfile()
            user_profile.username = email
            user_profile.email = email
            user_profile.is_active = False

            user_profile.password = make_password(password)
            user_profile.save()

            email_send.send_register_email(email, 'register')
            return render(request, 'users/login.html')
        else:
            render(request, 'users/register.html', {'register_form': register_form})


class ActiveUserView(View):
    def get(self, request, active_code):
        records = EmailVerifyRecord.objects.filter(code=active_code)
        register_form = RegisterForm()
        if records:
            for record in records:
                email = record.email
                user_profile = UserProfile.objects.get(email=email)
                user_profile.is_active = True
                user_profile.save()
                return render(request, 'users/login.html')
        else:
            return render(request, 'users/register.html', {'register_form': register_form, 'msg': '激活链接无效'})


def user_login(request):
    if request.method == 'POST':
        username = request.POST.get('username', '')
        password = request.POST.get('password', '')
        user = authenticate(username=username, password=password)

        if user is not None:
            login(request, user)
            return render(request, 'index.html')
        else:
            return render(request, 'users/login.html', {'msg': '用户名或密码错误！'})

    elif request.method == 'GET':
        return render(request, 'users/login.html')
