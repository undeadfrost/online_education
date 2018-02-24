from django.shortcuts import render
from django.contrib.auth import login, authenticate
from django.contrib.auth.backends import ModelBackend
from django.views.generic.base import View
from .models import UserProfile
from .forms import LoginForm

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
        return render(request, 'users/register.html')


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
