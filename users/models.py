from django.db import models
from django.contrib.auth.models import AbstractUser
# Create your models here.


class UserProfile(AbstractUser):

    # 性别选择
    GENDER_CHOICES = (('male', u'男'), ('female', u'女'))
    # 昵称
    nickname = models.CharField(max_length=50, verbose_name=u'昵称', default='')
    # 生日
    birthday = models.DateField(verbose_name=u'生日', null=True, blank=True)
    # 性别
    gender = models.CharField(max_length=5, verbose_name=u'性别', choices=GENDER_CHOICES, default='male')
    # 地址
    address = models.CharField(max_length=100, verbose_name=u'地址', default='')
    # 电话
    mobile = models.CharField(max_length=11, verbose_name=u'电话', null=True, blank=True)
    # 头像
    image = models.ImageField(upload_to='image/%Y/%m', default='image/default.png', max_length=100)

    class Meta(AbstractUser.Meta):
        verbose_name = "用户信息"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.nickname

