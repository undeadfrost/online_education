from django.shortcuts import render
from django.views import View
from .models import Course

from pure_pagination import Paginator, EmptyPage, PageNotAnInteger
# Create your views here.


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
