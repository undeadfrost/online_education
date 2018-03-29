from django.shortcuts import render
from django.urls import reverse
from django.contrib.auth import login, authenticate, logout
from django.contrib.auth.backends import ModelBackend
from django.contrib.auth.hashers import make_password
from django.views.generic.base import View
from django.http import HttpResponseRedirect, HttpResponse
from django.contrib.auth.mixins import LoginRequiredMixin
from .models import UserProfile, EmailVerifyRecord, Banner
from .forms import LoginForm, RegisterForm, ForgetPasswordForm, ModifyPasswordForm, \
    UploadImageForm, UserInfoForm
from operation.models import UserCourse, UserFavorite, UserMessage
from organization.models import CourseOrg, Teacher
from courses.models import Course
from utils import email_send

from django.db.models import Q
from pure_pagination import Paginator, PageNotAnInteger
import json
# Create your views here.


# 登录
class LoginView(View):
    @staticmethod
    def get(request):
        redirect_url = request.GET.get('next', '')
        return render(request, 'users/login.html', {'redirect_url': redirect_url})

    @staticmethod
    def post(request):
        login_form = LoginForm(request.POST)

        if login_form.is_valid():
            username = request.POST.get('username', '')
            password = request.POST.get('password', '')

            user = authenticate(username=username, password=password)

            if user:
                if user.is_active:
                    login(request, user)
                    redirect_url = request.POST.get('next', '')
                    if redirect_url:
                        return HttpResponseRedirect(redirect_url)
                    return HttpResponseRedirect(reverse('index'))
                else:
                    return render(request, 'users/login.html', {'msg': '用户尚未激活'})
            else:
                return render(request, 'users/login.html', {'msg': '用户名或密码错误！'})
        else:
            return render(request, 'users/login.html', {'login_form': login_form})


# 登出
class LogoutView(View):
    def get(self, request):
        logout(request)
        # 重定向首页
        return HttpResponseRedirect(reverse('index'))


# 实现用户名邮箱均可登录
class CustomBackend(ModelBackend):
    def authenticate(self, request, username=None, password=None, **kwargs):
        try:
            user = UserProfile.objects.get(Q(username=username) | Q(email=username))
            if user.check_password(password):
                return user
        except Exception as e:
            return None


# 注册
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
                return render(request, 'users/register.html', {'msg': '该邮箱已注册', 'register_form': register_form})

            user_profile = UserProfile()
            user_profile.username = email
            user_profile.email = email
            user_profile.is_active = False

            user_profile.password = make_password(password)
            user_profile.save()

            # 注册发送欢迎消息
            user_message = UserMessage()
            user_message.user = user_profile.id
            user_message.message = '欢迎注册!'
            user_message.save()

            email_send.send_register_email(email, 'register')
            return render(request, 'users/login.html', {'msg': '请及时在邮箱中查看账号激活邮件'})
        else:
            return render(request, 'users/register.html', {'register_form': register_form})


# 激活
class ActiveUserView(View):
    def get(self, request, active_code):
        record_list = EmailVerifyRecord.objects.filter(code=active_code)
        register_form = RegisterForm()
        if record_list:
            for record in record_list:
                email = record.email
                user_profile = UserProfile.objects.get(email=email)
                user_profile.is_active = True
                user_profile.save()
                return render(request, 'users/login.html', {'msg': '激活成功请登陆'})
        else:
            return render(request, 'users/register.html', {'register_form': register_form, 'msg': '激活链接无效'})


# 忘记密码
class ForgetPasswordView(View):
    def get(self, request):
        forget_form = ForgetPasswordForm()
        return render(request, 'users/forgetpwd.html', {'forget_form': forget_form})

    def post(self, request):
        forget_form = ForgetPasswordForm(request.POST)
        if forget_form.is_valid():
            email = request.POST.get('email', '')
            if UserProfile.objects.filter(email=email):
                email_send.send_register_email(email, 'forget')
                return render(request, 'users/login.html', {'msg': '重置密码邮件已发送'})
            else:
                return render(request, 'users/forgetpwd.html', {'msg': '该邮箱未注册'})
        else:
            return render(request, 'users/forgetpwd.html', {'forget_form': forget_form})


# 重置密码
class ResetPasswordView(View):
    def get(self, request, active_code):
        record_list = EmailVerifyRecord.objects.filter(code=active_code)
        if record_list:
            return render(request, 'users/reset_password.html', {'code': active_code})
        else:
            return render(request, 'users/forgetpwd.html', {'msg': '重置密码链接失效'})


# 修改密码
class ModifyPasswordView(View):
    def post(self, request):
        modify_password_form = ModifyPasswordForm(request.POST)
        code = request.POST.get('code', '')
        email = EmailVerifyRecord.objects.filter(code=code)[0].email
        if modify_password_form.is_valid() and email:
            password1 = request.POST.get('password1', '')
            password2 = request.POST.get('password2', '')
            if password1 == password2:
                user_profile = UserProfile.objects.get(email=email)
                user_profile.password = make_password(password2)
                user_profile.save()
                return render(request, 'users/login.html', {'msg': '密码重置成功，请登陆'})
            else:
                return render(request, 'users/reset_password.html', {'code': code, 'msg': '密码不一致'})
        else:
            return render(request, 'users/reset_password.html', {'code': code, 'modify_password_form': modify_password_form})


# 用户个人资料
class UserInfoView(LoginRequiredMixin, View):
    login_url = '/login/'
    redirect_field_name = 'next'

    def get(self, request):
        current_page = 'info'
        return render(request, 'users/usercenter-info.html', {
            'current_page': current_page,
        })

    def post(self, request):
        user_info_form = UserInfoForm(request.POST, instance=request.user)
        if user_info_form.is_valid():
            user_info_form.save()
            return HttpResponse('{"status": "success"}', content_type='application/json')
        else:
            return HttpResponse(json.dumps(user_info_form.errors), content_type='application/json')


# 用户中心上传头像
class UploadImageView(LoginRequiredMixin, View):
    login_url = '/login/'
    redirect_field_name = 'next'

    def post(self, request):
        image_form = UploadImageForm(request.POST, request.FILES, instance=request.user)
        if image_form.is_valid():
            image_form.save()
            return HttpResponse('{"status": "success"}', content_type='application/json')
        else:
            return HttpResponse('{"status": "success"}', content_type='application/json')


# 用户中心修改密码
class UpdatePasswordView(LoginRequiredMixin, View):
    login_url = '/login/'
    redirect_field_name = 'next'

    def post(self, request):
        modify_password_form = ModifyPasswordForm(request.POST)
        if modify_password_form.is_valid():
            password1 = request.POST.get('password1', '')
            password2 = request.POST.get('password2', '')
            if password1 != password2:
                return HttpResponse('{"status": "fail", "msg": "两次输入密码不一致"}',
                                    content_type='application/json')
            else:
                user = request.user
                user.password = make_password(password2)
                user.save()
                return HttpResponse('{"status": "success", "msg": "密码修改成功过"}',
                                    content_type='application/json')
        else:
            return HttpResponse('{"status": "fail", "msg": "密码格式有误"}',
                                content_type='application/json')


# 发送修改邮箱验证码
class SendMailCodeView(LoginRequiredMixin, View):
    login_url = '/login/'
    redirect_field_name = 'next'

    def get(self, request):
        email = request.GET.get('email', '')

        if UserProfile.objects.filter(email=email):
            return HttpResponse('{"email": "邮箱已被注册"}', content_type='application/json')
        else:
            email_send.send_register_email(email, 'update_email')
            return HttpResponse('{"status": "success"}', content_type='application/json')


# 用户中心修改邮箱
class UpdateEmailView(LoginRequiredMixin, View):
    login_url = '/login/'
    redirect_field_name = 'next'

    def post(self, request):
        email = request.POST.get('email', '')
        code = request.POST.get('code', '')

        if EmailVerifyRecord.objects.filter(email=email, code=code, send_type='update_email'):
            user = request.user
            user.email = email
            user.save()
            return HttpResponse('{"status", "success"}', content_type='application/json')
        else:
            return HttpResponse('{"email": "验证码无效"}', content_type='application/json')


# 用户中心我的课程
class MyCourseView(LoginRequiredMixin, View):
    login_url = '/login/'
    redirect_field_name = 'next'

    def get(self, request):
        current_page = 'courses'
        user_courses = UserCourse.objects.filter(user=request.user)
        courses = [user_course.course for user_course in user_courses]
        return render(request, 'users/usercenter-mycourse.html', {
            'courses': courses,
            'current_page': current_page,
        })


# 我的收藏
class MyFavView(LoginRequiredMixin, View):
    login_url = '/login/'
    redirect_field_name = 'next'

    def get(self, request, fav_type):
        current_page = 'fav'
        if fav_type == 1:
            fav_courses = self.fav_course(request)
            return render(request, 'users/usercenter-fav-course.html', {
                'fav_courses': fav_courses,
                'current_page': current_page,
            })
        if fav_type == 2:
            fav_orgs = self.fav_org(request)
            return render(request, 'users/usercenter-fav-org.html', {
                'fav_orgs': fav_orgs,
                'current_page': current_page,
            })
        if fav_type == 3:
            fav_teachers = self.fav_teacher(request)
            return render(request, 'users/usercenter-fav-teacher.html', {
                'fav_teachers': fav_teachers,
                'current_page': current_page,
            })

    # 获取课程收藏列表
    def fav_course(self, request):
        user_favorites = UserFavorite.objects.filter(user=request.user, fav_type=1)
        course_ids = [user_favorite.fav_id for user_favorite in user_favorites]
        fav_courses = Course.objects.filter(id__in=course_ids)
        return fav_courses

    # 获取机构收藏列表
    def fav_org(self, request):
        user_favorites = UserFavorite.objects.filter(user=request.user, fav_type=2)
        org_ids = [user_favorite.fav_id for user_favorite in user_favorites]
        fav_orgs = CourseOrg.objects.filter(id__in=org_ids)
        return fav_orgs

    # 获取教师收藏列表
    def fav_teacher(self, request):
        user_favorites = UserFavorite.objects.filter(user=request.user, fav_type=3)
        teacher_ids = [user_favorite.fav_id for user_favorite in user_favorites]
        fav_teachers = Teacher.objects.filter(id__in=teacher_ids)
        return fav_teachers


# 我的消息
class MyMessageView(LoginRequiredMixin, View):
    login_url = '/login/'
    redirect_field_name = 'next'

    def get(self, request):
        current_page = 'message'
        all_messages = UserMessage.objects.filter(user=request.user.id)
        # 进入消息页面，清空未读消息
        unread_messages = UserMessage.objects.filter(user=request.user.id, has_read=False)
        for unread_message in unread_messages:
            unread_message.has_read = True
            unread_message.save()
        # 分页，每页10条数据
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        p = Paginator(all_messages, per_page=10, request=request)
        page_messages = p.page(page)
        return render(request, 'users/usercenter-message.html', {
            'page_messages': page_messages,
            'current_page': current_page,
        })


# 首页
class IndexView(View):
    def get(self, request):
        # 大轮播图
        all_banners = Banner.objects.all().order_by('index')[:5]
        # 课程轮播图
        banner_courses = Course.objects.filter(is_banner=True).order_by('-add_time')[:3]
        # 课程列表
        course_list = Course.objects.filter(is_banner=False)[:6]
        # 课程机构
        course_org_list = CourseOrg.objects.all()[:15]
        return render(request, 'index.html', {
            'all_banners': all_banners,
            'banner_courses': banner_courses,
            'course_list': course_list,
            'course_org_list': course_org_list,
        })


# 404页面
def page_not_found(request):
    from django.shortcuts import render_to_response
    response = render_to_response('404.html', {})
    response.status_code = 404
    return response


# 500页面
def page_error(request):
    from django.shortcuts import render_to_response
    response = render_to_response('500.html', {})
    response.status_code = 500
    return response


# 403页面
def permission_denied(request):
    from django.shortcuts import render_to_response
    response = render_to_response('403.html', {})
    response.status_code = 403
    return response


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
