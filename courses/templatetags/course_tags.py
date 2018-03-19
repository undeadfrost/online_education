from django import template
from ..models import Course

register = template.Library()


@register.simple_tag
def get_course_banners(count=3):
    banners = Course.objects.filter(is_banner=True)[:count]
    return banners
