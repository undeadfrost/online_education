import xadmin

from .models import Course, Lesson, Video, CourseResource


class CourseAdmin(object):
    list_display = ['name', 'describe', 'detail', 'degree', 'learn_time', 'students']
    search_fields = ['name', 'describe', 'detail', 'degree', 'students']
    list_filter = ['name', 'describe', 'detail', 'degree', 'learn_time', 'students']


class LessonAdmin(object):
    list_display = ['courses', 'name', 'add_time']
    search_fields = ['courses', 'name']
    list_filter = ['course__name', 'name', 'add_time']


class VideoAdmin(object):
    list_display = ['lesson', 'name', 'add_time']
    search_fields = ['lesson', 'name']
    list_filter = ['lesson', 'name', 'add_time']


class CourseResourceAdmin(object):
    list_display = ['courses', 'name', 'download', 'add_time']
    search_fields = ['courses', 'name', 'download']
    list_filter = ['course__name', 'name', 'download', 'add_time']


xadmin.site.register(Course, CourseAdmin)
xadmin.site.register(Lesson, LessonAdmin)
xadmin.site.register(Video, VideoAdmin)
xadmin.site.register(CourseResource, CourseResourceAdmin)
