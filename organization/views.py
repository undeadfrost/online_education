from django.shortcuts import render
from django.views.generic import View
from django.http import HttpResponse
from django.db.models import Q

from .models import CourseOrg, CityDict, Teacher
from .forms import UserAskForm
from operation.models import UserFavorite
from courses.models import Course

from pure_pagination import Paginator, EmptyPage, PageNotAnInteger
# Create your views here.


# 机构列表
class OrgListView(View):
    def get(self, request):
        # 获取全部机构信息
        org_all = CourseOrg.objects.all()
        # 获取全部城市信息
        city_all = CityDict.objects.all()
        # 获取url中city参数
        city_id = request.GET.get('city', '')
        # 获取url中category参数
        category = request.GET.get('category', '')
        # 搜索
        search_keywords = request.GET.get('keywords', '')
        if search_keywords:
            org_all = org_all.filter(Q(name__icontains=search_keywords) |
                                     Q(describe__icontains=search_keywords))
        # 根据city查询符合条件机构信息
        if city_id:
            org_all = org_all.filter(city_id=int(city_id))
        # 根据category查询符合条件机构信息
        if category:
            org_all = org_all.filter(category=category)
        # 授课机构排名
        hot_org_list = CourseOrg.objects.all().order_by('-click_nums')[:3]
        # 进行排序
        sort = request.GET.get('sort', '')
        if sort:
            if sort == 'students':
                org_all = org_all.order_by('-students')
            elif sort == 'courses':
                org_all = org_all.order_by('-course_nums')
        # 获取符合条件的机构总数
        org_nums = org_all.count()
        # 分页，每页5条数据
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        p = Paginator(org_all, per_page=5, request=request)
        org_list = p.page(page)
        return render(request, 'organization/org-list.html', {
            'org_list': org_list, 'city_list': city_all,
            'org_nums': org_nums, 'city_id': city_id,
            'category': category, 'hot_org_list': hot_org_list,
            'sort': sort,
            'search_keywords': search_keywords,
        })


# 我要学习提交
class AddUserAskView(View):
    def post(self, request):
        user_ask_form = UserAskForm(request.POST)
        # 判断表单是否有效
        if user_ask_form.is_valid():
            # 保存表单内数据到数据库
            user_ask_form.save(commit=True)
            return HttpResponse('{"status": "success"}', content_type='application/json')
        else:
            return HttpResponse('{"status": "fail", "msg": {0}}'.format(user_ask_form.errors),
                                content_type='application/json')


# 机构详情首页
class OrgHomeView(View):
    def get(self, request, org_id):
        # 向前端传值，表明当前页面
        current_page = 'home'
        course_org = CourseOrg.objects.get(id=int(org_id))
        # 机构页面点击增加
        course_org.click_nums += 1
        course_org.save()
        teacher_list = course_org .teacher_set.all()[:2]
        course_list = course_org .course_set.all()[:4]
        # 必须是用户已登录我们才需要判断。
        has_fav = False
        if request.user.is_authenticated:
            if UserFavorite.objects.filter(user=request.user, fav_id=course_org.id, fav_type=2):
                has_fav = True
        return render(request, 'organization/org-detail-homepage.html', {
            'course_list': course_list,
            'teacher_list': teacher_list,
            'course_org': course_org,
            'current_page': current_page,
            'has_fav': has_fav,
        })


# 机构课程列表页
class OrgCourseListView(View):
    def get(self, request, org_id):
        # 向前端传值，表明当前页面
        current_page = 'course'
        course_org = CourseOrg.objects.get(id=int(org_id))
        all_courses = course_org.course_set.all()
        # 分页，每页20条数据
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        p = Paginator(all_courses, per_page=20, request=request)
        page_courses = p.page(page)
        # 必须是用户已登录我们才需要判断。
        has_fav = False
        if request.user.is_authenticated:
            if UserFavorite.objects.filter(user=request.user, fav_id=course_org.id, fav_type=2):
                has_fav = True
        return render(request, 'organization/org-detail-course.html', {
            'course_org': course_org,
            'page_courses': page_courses,
            'current_page': current_page,
            'has_fav': has_fav,
        })


# 机构讲师列表页
class OrgTeacherListView(View):
    def get(self, request, org_id):
        # 向前端传值，表明当前页面
        current_page = 'teacher'
        course_org = CourseOrg.objects.get(id=int(org_id))
        all_teachers = course_org.teacher_set.all()
        # 分页，每页5条数据
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        p = Paginator(all_teachers, per_page=1, request=request)
        page_teachers = p.page(page)
        # 必须是用户已登录我们才需要判断。
        has_fav = False
        if request.user.is_authenticated:
            if UserFavorite.objects.filter(user=request.user, fav_id=course_org.id, fav_type=2):
                has_fav = True
        return render(request, 'organization/org-detail-teachers.html', {
            'course_org': course_org,
            'page_teachers': page_teachers,
            'current_page': current_page,
            'has_fav': has_fav,
        })


# 机构详情页
class OrgDescribeView(View):
    def get(self, request, org_id):
        # 向前端传值，表明当前页面
        current_page = 'describe'
        course_org = CourseOrg.objects.get(id=int(org_id))
        # 必须是用户已登录我们才需要判断。
        has_fav = False
        if request.user.is_authenticated:
            if UserFavorite.objects.filter(user=request.user, fav_id=course_org.id, fav_type=2):
                has_fav = True
        return render(request, 'organization/org-detail-desc.html', {
            'course_org': course_org,
            'current_page': current_page,
            'has_fav': has_fav,
        })


# 收藏与取消收藏
class AddFavView(View):
    def post(self, request):
        fav_id = request.POST.get('fav_id', 0)
        fav_type = request.POST.get('fav_type', 0)
        if not request.user.is_authenticated:
            return HttpResponse('{"status": "fail", "msg": "用户未登录"}',
                                content_type='application/json')
        exist_records = UserFavorite.objects.filter(
            user=request.user, fav_id=int(fav_id), fav_type=int(fav_type))
        # 取消收藏
        if exist_records:
            exist_records.delete()
            self.delete_fav(fav_id, fav_type)
            return HttpResponse('{"status": "success", "msg": "已取消收藏"}',
                                content_type='application/json')
        # 收藏
        elif fav_id and fav_type:
            user_favorite = UserFavorite()
            user_favorite.user = request.user
            user_favorite.fav_id = fav_id
            user_favorite.fav_type = fav_type
            user_favorite.save()
            self.insert_fav(fav_id, fav_type)
            return HttpResponse('{"status": "success", "msg": "已收藏"}',
                                content_type='application/json')
        else:
            return HttpResponse('{"status": "fail", "msg": "收藏错误"}',
                                content_type='application/json')

    # 收藏数统计(取消收藏-1)
    def delete_fav(self, fav_id, fav_type):
        if int(fav_type) == 1:
            course = Course.objects.get(id=int(fav_id))
            course.fav_nums -= 1
            if course.fav_nums < 0:
                course.fav_nums = 0
            course.save()
        if int(fav_type) == 2:
            org = CourseOrg.objects.get(id=int(fav_id))
            org.fav_nums -= 1
            if org.fav_nums < 0:
                org.fav_nums = 0
            org.save()
        if int(fav_type) == 3:
            teacher = Teacher.objects.get(id=int(fav_id))
            teacher.fav_nums -= 1
            if teacher.fav_nums < 0:
                teacher.fav_nums = 0
            teacher.save()

    # 收藏数统计(点击收藏+1)
    def insert_fav(self, fav_id, fav_type):
        if int(fav_type) == 1:
            course = Course.objects.get(id=int(fav_id))
            course.fav_nums += 1
            course.save()
        if int(fav_type) == 2:
            org = CourseOrg.objects.get(id=int(fav_id))
            org.fav_nums += 1
            org.save()
        if int(fav_type) == 3:
            teacher = Teacher.objects.get(id=int(fav_id))
            teacher.fav_nums += 1
            teacher.save()


# 讲师列表
class TeacherListView(View):
    def get(self, request):
        all_teachers = Teacher.objects.all()
        # 搜索
        search_keywords = request.GET.get('keywords', '')
        if search_keywords:
            all_teachers = all_teachers.filter(Q(name__icontains=search_keywords) |
                                               Q(work_company__icontains=search_keywords) |
                                               Q(work_position__icontains=search_keywords) |
                                               Q(points__icontains=search_keywords))
        # 进行排序
        sort = request.GET.get('sort', '')
        if sort == 'hot':
            all_teachers = all_teachers.order_by('-click_nums')
        # 获取讲师数量
        teacher_nums = all_teachers.count()
        # 分页，每页5条数据
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        p = Paginator(all_teachers, per_page=5, request=request)
        page_teachers = p.page(page)
        # 排行榜讲师
        rank_teachers = Teacher.objects.all().order_by('-fav_nums')[:5]
        return render(request, 'organization/teacher-list.html', {
            'page_teachers': page_teachers,
            'teacher_nums': teacher_nums,
            'sort': sort,
            'rank_teachers': rank_teachers,
            'search_keywords': search_keywords,
        })


# 讲师详情页
class TeacherDetailView(View):
    def get(self, request, teacher_id):
        teacher = Teacher.objects.get(id=teacher_id)
        # 教师页面点击增加
        teacher.click_nums += 1
        teacher.save()
        teacher_courses = teacher.course_set.all()
        org = teacher.org
        # 讲师排行
        rank_teachers = Teacher.objects.all().order_by('-fav_nums')[:5]
        # 讲师收藏。
        has_fav_teacher = False
        has_fav_org = False
        if request.user.is_authenticated:
            if UserFavorite.objects.filter(user=request.user, fav_id=teacher.id, fav_type=3):
                has_fav_teacher = True
            if UserFavorite.objects.filter(user=request.user, fav_id=org.id, fav_type=2):
                has_fav_org = True
        return render(request, 'organization/teacher-detail.html', {
            'teacher': teacher,
            'teacher_courses': teacher_courses,
            'org': org,
            'rank_teachers': rank_teachers,
            'has_fav_teacher': has_fav_teacher,
            'has_fav_org': has_fav_org,
        })
