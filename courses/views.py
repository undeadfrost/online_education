from django.shortcuts import render
from django.views import View
from .models import Course
# Create your views here.


class CourseListView(View):
    def get(self, request):
        course_list = Course.objects.all()
        return render(request, 'courses/course-list.html', {'course_list': course_list})
