# Generated by Django 2.0.1 on 2018-03-05 23:38

from django.db import migrations, models
import django.db.models.deletion
import utils.storage


class Migration(migrations.Migration):

    dependencies = [
        ('organization', '0001_initial'),
        ('courses', '0002_course_tag'),
    ]

    operations = [
        migrations.AddField(
            model_name='course',
            name='teacher',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='organization.Teacher', verbose_name='授课讲师'),
        ),
        migrations.AddField(
            model_name='course',
            name='teacher_cell',
            field=models.CharField(default='老师是好人', max_length=300, verbose_name='老师告诉你'),
        ),
        migrations.AddField(
            model_name='course',
            name='you_need_now',
            field=models.CharField(default='好好学习，天天向上', max_length=300, verbose_name='课程须知'),
        ),
        migrations.AlterField(
            model_name='course',
            name='image',
            field=models.ImageField(storage=utils.storage.ImageStorage(), upload_to='courses/%Y/%m', verbose_name='封面图'),
        ),
    ]
