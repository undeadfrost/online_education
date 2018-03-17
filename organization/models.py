from datetime import datetime, date
from django.db import models

from utils.storage import ImageStorage
from DjangoUeditor.models import UEditorField

# Create your models here.


# 城市信息
class CityDict(models.Model):
    name = models.CharField(max_length=20, verbose_name=u'城市名称')
    describe = models.CharField(max_length=200, verbose_name=u'城市描述')
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u'添加时间')

    class Meta:
        verbose_name = u'城市'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


# 课程机构
class CourseOrg(models.Model):
    ORG_CHOICES = (
        ('train', u'培训机构'),
        ('colleges', u'高校'),
        ('personal', u'个人')
    )
    name = models.CharField(max_length=50, verbose_name=u'机构名称')
    describe = UEditorField(
        verbose_name=u'机构描述',
        width='100%',
        toolbars='mini',
        imagePath='org/ueditor/%(rnd)s_%(datetime)s.%(extname)s',
        filePath='org/ueditor/%(rnd)s_%(datetime)s.%(extname)s',
        default=''
    )
    click_nums = models.IntegerField(default=0, verbose_name=u'点击数')
    fav_nums = models.IntegerField(default=0, verbose_name=u'收藏数')
    image = models.ImageField(
        upload_to='org/%Y/%m',
        verbose_name=u'封面图',
        max_length=100,
        storage=ImageStorage()
    )
    address = models.CharField(max_length=150, verbose_name=u'机构地址')
    city = models.ForeignKey(CityDict, on_delete=models.CASCADE, verbose_name=u'所在城市')
    category = models.CharField(choices=ORG_CHOICES, default='train', max_length=20, verbose_name=u'机构类别')
    students = models.IntegerField(default=0, verbose_name=u'学习人数')
    course_nums = models.IntegerField(default=0, verbose_name=u'课程数')
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u'添加时间')

    class Meta:
        verbose_name = u'课程机构'
        verbose_name_plural = verbose_name

    def __str__(self):
        return "{0}".format(self.name)


# 讲师信息
class Teacher(models.Model):
    org = models.ForeignKey(CourseOrg, on_delete=models.CASCADE, verbose_name=u'所属机构')
    name = models.CharField(max_length=20, verbose_name=u'教师名称')
    work_years = models.IntegerField(default=0, verbose_name=u'工作年限')
    birthday = models.DateField(verbose_name=u'生日', null=True, blank=True)
    work_company = models.CharField(max_length=50, verbose_name=u'就职公司')
    work_position = models.CharField(max_length=50, verbose_name=u'公司职位')
    points = models.CharField(max_length=100, verbose_name=u'教学特点')
    click_nums = models.IntegerField(default=0, verbose_name=u'点击数')
    fav_nums = models.IntegerField(default=0, verbose_name=u'收藏数')
    image = models.ImageField(
        default='',
        upload_to='teacher/%Y/%m',
        verbose_name=u'头像',
        max_length=100,
        storage=ImageStorage()
    )
    add_time = models.DateTimeField(default=datetime.now, verbose_name=u'添加时间')

    class Meta:
        verbose_name = u'教师'
        verbose_name_plural = verbose_name

    def get_age(self):
        today = date.today()
        age = today.year - self.birthday.year
        if today.month < self.birthday.month:
            age -= 1
        elif today.month == self.birthday.month:
            if today.day < self.birthday.day:
                age -= 1
        if age < 0:
            age = 0
        return age

    def __str__(self):
        return "[{0}]的教师: {1}".format(self.org, self.name)
