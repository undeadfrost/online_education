from django.shortcuts import render
from django.views.generic import View
from django.http import HttpResponse

from .models import CourseOrg, CityDict
from .forms import UserAskForm

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
        # 根据city查询符合条件机构信息
        if city_id:
            org_all = org_all.filter(city_id=int(city_id))
        # 根据category查询符合条件机构信息
        if category:
            org_all = org_all.filter(category=category)
        # 授课机构排名
        hot_org_list = CourseOrg.objects.all().order_by('-click_nums')[:3]
        # 进行排序
        sort = request.GET.get('sort', "")
        if sort:
            if sort == "students":
                org_all = org_all.order_by("-students")
            elif sort == "courses":
                org_all = org_all.order_by("-course_nums")
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
        current_page = "home"
        course_org = CourseOrg.objects.get(id=int(org_id))
        teacher_list = course_org .teacher_set.all()[:2]
        course_list = course_org .course_set.all()[:4]
        return render(request, 'organization/org-detail-homepage.html', {
            'course_list': course_list,
            'teacher_list': teacher_list,
            'course_org': course_org,
            'current_page': current_page,
        })


# 机构课程列表页
class OrgCourseListView(View):
    def get(self, request, org_id):
        # 向前端传值，表明当前页面
        current_page = "course"
        course_org = CourseOrg.objects.get(id=int(org_id))
        all_courses = course_org.course_set.all()
        return render(request, 'organization/org-detail-course.html', {
            'course_org': course_org,
            'org_course_list': all_courses,
            'current_page': current_page,
        })


# 机构讲师列表页
class OrgTeacherListView(View):
    def get(self, request, org_id):
        # 向前端传值，表明当前页面
        current_page = "teacher"
        course_org = CourseOrg.objects.get(id=int(org_id))
        all_teachers = course_org.teacher_set.all()
        return render(request, 'organization/org-detail-teachers.html', {
            'course_org': course_org,
            'all_teachers': all_teachers,
            'current_page': current_page,
        })


# 机构详情页
class OrgDescribeView(View):
    def get(self, request, org_id):
        # 向前端传值，表明当前页面
        current_page = "describe"
        course_org = CourseOrg.objects.get(id=int(org_id))
        return render(request, 'organization/org-detail-desc.html',{
            'course_org': course_org,
            'current_page': current_page,
        })

