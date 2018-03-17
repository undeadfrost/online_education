# Generated by Django 2.0.1 on 2018-03-14 11:59

from django.db import migrations, models
import utils.storage


class Migration(migrations.Migration):

    dependencies = [
        ('courses', '0005_video_learn_times'),
    ]

    operations = [
        migrations.AddField(
            model_name='course',
            name='is_banner',
            field=models.BooleanField(default=False, verbose_name='是否轮播'),
        ),
        migrations.AlterField(
            model_name='courseresource',
            name='download',
            field=models.FileField(storage=utils.storage.ImageStorage(), upload_to='courses/resource/%Y/%m', verbose_name='资源文件'),
        ),
    ]