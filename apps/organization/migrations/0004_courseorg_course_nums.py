# Generated by Django 2.0.1 on 2018-03-17 23:22

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('organization', '0003_remove_courseorg_course_nums'),
    ]

    operations = [
        migrations.AddField(
            model_name='courseorg',
            name='course_nums',
            field=models.IntegerField(default=0, verbose_name='课程数'),
        ),
    ]
