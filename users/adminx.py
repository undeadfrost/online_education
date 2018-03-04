from django.contrib.auth.models import Permission, Group

import xadmin
from xadmin.models import Log
from xadmin import views

from .models import UserProfile, EmailVerifyRecord, Banner
from course.models import Course, Video, Lesson, CourseResource
from operation.models import CourseComments, UserFavorite, UserMessage, UserCourse, UserAsk
from organization.models import CityDict, Teacher, CourseOrg


class BaseSetting(object):
    enable_themes = True
    use_bootswatch = True


class GlobalSetting(object):
    site_title = u'后台管理'
    site_footer = 'Frost'
    # 菜单样式(收起)
    menu_style = 'accordion'

    def get_site_menu(self):
        return (
            {'title': u'机构管理', 'menus': (
                {'title': u'所在城市', 'url': self.get_model_url(CityDict, 'changelist')},
                {'title': u'机构信息', 'url': self.get_model_url(CourseOrg, 'changelist')},
                {'title': u'机构讲师', 'url': self.get_model_url(Teacher, 'changelist')},
            )},
            {'title': u'课程管理', 'menus': (
                {'title': u'课程信息', 'url': self.get_model_url(Course, 'changelist')},
                {'title': u'章节信息', 'url': self.get_model_url(Lesson, 'changelist')},
                {'title': u'视频信息', 'url': self.get_model_url(Video, 'changelist')},
                {'title': u'课程资源', 'url': self.get_model_url(CourseResource, 'changelist')},
                {'title': u'课程评论', 'url': self.get_model_url(CourseComments, 'changelist')},
            )},

            {'title': u'用户管理', 'menus': (
                {'title': u'用户信息', 'url': self.get_model_url(UserProfile, 'changelist')},
                {'title': u'用户验证', 'url': self.get_model_url(EmailVerifyRecord, 'changelist')},
                {'title': u'用户课程', 'url': self.get_model_url(UserCourse, 'changelist')},
                {'title': u'用户收藏', 'url': self.get_model_url(UserFavorite, 'changelist')},
                {'title': u'用户消息', 'url': self.get_model_url(UserMessage, 'changelist')},
            )},

            {'title': u'系统管理', 'menus': (
                {'title': u'用户咨询', 'url': self.get_model_url(UserAsk, 'changelist')},
                {'title': u'首页轮播', 'url': self.get_model_url(Banner, 'changelist')},
                {'title': u'用户分组', 'url': self.get_model_url(Group, 'changelist')},
                {'title': u'用户权限', 'url': self.get_model_url(Permission, 'changelist')},
                {'title': u'日志记录', 'url': self.get_model_url(Log, 'changelist')},
            )},
        )


class EmailVerifyRecordAdmin(object):
    list_display = ['code', 'email', 'send_type', 'send_time']
    search_fields = ['code', 'email', 'send_type']
    list_filter = ['code', 'email', 'send_type', 'send_time']


class BannerAdmin(object):
    list_display = ['title', 'image', 'url', 'index', 'add_time']
    search_fields = ['title', 'image', 'url', 'index']
    list_filter = ['title', 'image', 'url', 'index', 'add_time']


xadmin.site.register(views.BaseAdminView, BaseSetting)
xadmin.site.register(views.CommAdminView, GlobalSetting)
xadmin.site.register(EmailVerifyRecord, EmailVerifyRecordAdmin)
xadmin.site.register(Banner, BannerAdmin)
