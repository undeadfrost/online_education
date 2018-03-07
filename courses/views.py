from django.shortcuts import render
from django.views import View
from .models import Course
from operation.models import UserFavorite

from pure_pagination import Paginator, EmptyPage, PageNotAnInteger
# Create your views here.


# 课程列表
class CourseListView(View):
    def get(self, request):
        all_course = Course.objects.all()
        # 进行排序
        sort = request.GET.get('sort', '')
        if sort:
            if sort == "students":
                all_course = all_course.order_by('-students')
            elif sort == "hot":
                all_course = all_course.order_by('-click_nums')
        else:
            all_course = all_course.order_by('-add_time')
        hot_courses = all_course.order_by("-students")[:3]
        # 分页，每页12条数据
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        p = Paginator(all_course, per_page=12, request=request)
        page_courses = p.page(page)
        return render(request, 'courses/course-list.html', {
            'page_courses': page_courses,
            'sort': sort,
            'hot_courses': hot_courses,
        })


# 课程详情
class CourseDetailView(View):
    def get(self, request, course_id):
        course = Course.objects.get(id=int(course_id))
        course.click_nums += 1
        course.save()
        if course.tag:
            relate_courses = Course.objects.filter(tag=course.tag)[1:2]
        else:
            relate_courses = []
        hav_fav_course = False
        hav_fav_org = False
        # 仅判断用户登录是否收藏
        if request.user.is_authenticated:
            # 用户是否收藏课程
            if UserFavorite.objects.filter(user=request.user, fav_id=course.id, fav_type=1):
                hav_fav_course = True
            if UserFavorite.objects.filter(user=request.user, fav_id=course.course_org.id, fav_type=2):
                hav_fav_org = True
        return render(request, 'courses/course-detail.html', {
            'course': course,
            'relate_courses': relate_courses,
            'hav_fav_course': hav_fav_course,
            'hav_fav_org': hav_fav_org,
        })


# 课程章节信息
class CourseInfoView(View):
    def get(self, request, course_id):
        course = Course.objects.get(id=int(course_id))
        return render(request, 'courses/course-video.html', {
            'course': course,
        })
