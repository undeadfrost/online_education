from django.db import models
from datetime import datetime
from organization.models import CourseOrg

# Create your models here.


# 课程基本信息
class Course(models.Model):
    DEGREE_CHOICES = (
        ('cj', u'初级'),
        ('zj', u'中级'),
        ('gj', u'高级')
    )
    course_org = models.ForeignKey(CourseOrg, on_delete=models.CASCADE, verbose_name=u'所属机构', null=True, blank=True)
    name = models.CharField(max_length=50, verbose_name=u'课程名称')
    describe = models.CharField(max_length=300, verbose_name=u'课程描述')
    detail = models.TextField(verbose_name=u'课程详情')
    degree = models.CharField(max_length=2, choices=DEGREE_CHOICES, verbose_name=u'课程难度')
    learn_time = models.IntegerField(default=0, verbose_name=u'学习时长(分钟)')
    students = models.IntegerField(default=0, verbose_name=u'学习人数')
    fav_nums = models.IntegerField(default=0, verbose_name=u'收藏人数')
    image = models.ImageField(
        upload_to='courses/%Y/%m',
        verbose_name=u'封面图',
        max_length=100
    )
    click_nums = models.IntegerField(default=0, verbose_name=u'点击量')
    category = models.CharField(max_length=20, default=u"", verbose_name=u"课程类别")
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u'添加时间')

    class Meta:
        verbose_name = u'课程'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


# 章节信息
class Lesson(models.Model):
    course = models.ForeignKey(Course, on_delete=models.CASCADE, verbose_name=u'课程名称')
    name = models.CharField(max_length=100, verbose_name=u'章节名称')
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u'添加时间')

    class Meta:
        verbose_name = u'章节'
        verbose_name_plural = verbose_name

    def __str__(self):
        return '《{0}》课程的章节 >> {1}'.format(self.course, self.name)


# 每章视频
class Video(models.Model):
    lesson = models.ForeignKey(Lesson, on_delete=models.CASCADE, verbose_name=u'章节名称')
    name = models.CharField(max_length=100, verbose_name=u'视频名称')
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u'添加时间')

    class Meta:
        verbose_name = u'视频'
        verbose_name_plural = verbose_name

    def __str__(self):
        return '{0}章节的视频 >> {1}'.format(self.lesson, self.name)


# 课程资源
class CourseResource(models.Model):
    course = models.ForeignKey(Course, on_delete=models.CASCADE, verbose_name=u'课程名称')
    name = models.CharField(max_length=100, verbose_name=u'资源名称')
    download = models.FileField(
        upload_to='courses/resource/%Y/%m',
        verbose_name=u'资源文件',
        max_length=100
    )
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u'添加时间')

    class Meta:
        verbose_name = u'课程资源'
        verbose_name_plural = verbose_name

    def __str__(self):
        return '《{0}》课程的资源: {1}'.format(self.course, self.name)

