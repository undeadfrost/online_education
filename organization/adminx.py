import xadmin

from .models import CityDict, CourseOrg, Teacher


class CityDictAdmin(object):
    list_display = ['name', 'describe', 'add_time']
    search_fields = ['name', 'describe']
    list_filter = ['name', 'describe', 'add_time']


class CourseOrgAdmin(object):
    list_display = ['name', 'describe', 'category', 'click_nums', 'fav_nums', 'add_time']
    search_fields = ['name', 'describe', 'category', 'click_nums', 'fav_nums']
    list_filter = ['name', 'describe', 'category', 'click_nums', 'fav_nums', 'city__name', 'address', 'add_time']
    # 富文本
    style_fields = {'describe': 'ueditor'}
    # 只读字段
    readonly_fields = ['students', 'click_nums', 'fav_nums']


class TeacherAdmin(object):
    list_display = ['name', 'org', 'work_years', 'work_company', 'add_time']
    search_fields = ['org', 'name', 'work_years', 'work_company']
    list_filter = ['name', 'org__name', 'work_years', 'work_company', 'click_nums', 'fav_nums', 'add_time']
    # 只读字段
    readonly_fields = ['click_nums', 'fav_nums']


xadmin.site.register(CityDict, CityDictAdmin)
xadmin.site.register(CourseOrg, CourseOrgAdmin)
xadmin.site.register(Teacher, TeacherAdmin)
