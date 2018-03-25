from django import template
from ..models import Course

register = template.Library()


# 注册、登录页面轮播图
@register.simple_tag
def get_course_banners(count=3):
    banners = Course.objects.filter(is_banner=True)[:count]
    return banners


# 公开课-热门课程推荐
@register.simple_tag
def get_hot_courses(count=3):
    hot_courses = Course.objects.all().order_by('-students')[:count]
    return hot_courses


