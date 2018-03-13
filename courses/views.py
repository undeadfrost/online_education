from django.shortcuts import render
from django.views import View
from django.contrib.auth.mixins import LoginRequiredMixin
from django.http import HttpResponse
from django.db.models import Q
from .models import Course, Video
from operation.models import UserFavorite, CourseComments, UserCourse

from pure_pagination import Paginator, EmptyPage, PageNotAnInteger
# Create your views here.


# 课程列表
class CourseListView(View):
    def get(self, request):
        all_course = Course.objects.all()
        # 搜索
        search_keywords = request.GET.get('keywords', '')
        if search_keywords:
            all_course = all_course.filter(Q(name__icontains=search_keywords) |
                                           Q(describe__icontains=search_keywords) |
                                           Q(detail__icontains=search_keywords))
        # 进行排序
        sort = request.GET.get('sort', '')
        if sort:
            if sort == "students":
                all_course = all_course.order_by('-students')
            elif sort == "hot":
                all_course = all_course.order_by('-click_nums')
        else:
            all_course = all_course.order_by('-add_time')
        hot_courses = all_course.order_by("-students")[:3]
        # 分页，每页12条数据
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        p = Paginator(all_course, per_page=12, request=request)
        page_courses = p.page(page)
        return render(request, 'courses/course-list.html', {
            'page_courses': page_courses,
            'sort': sort,
            'hot_courses': hot_courses,
            'search_keywords': search_keywords,
        })


# 课程详情
class CourseDetailView(View):
    def get(self, request, course_id):
        course = Course.objects.get(id=int(course_id))
        course.click_nums += 1
        course.save()
        if course.tag:
            relate_courses = Course.objects.filter(tag=course.tag)[1:2]
        else:
            relate_courses = []
        hav_fav_course = False
        hav_fav_org = False
        # 仅判断用户登录是否收藏
        if request.user.is_authenticated:
            # 用户是否收藏课程
            if UserFavorite.objects.filter(user=request.user, fav_id=course.id, fav_type=1):
                hav_fav_course = True
            if UserFavorite.objects.filter(user=request.user, fav_id=course.course_org.id, fav_type=2):
                hav_fav_org = True
        return render(request, 'courses/course-detail.html', {
            'course': course,
            'relate_courses': relate_courses,
            'hav_fav_course': hav_fav_course,
            'hav_fav_org': hav_fav_org,
        })


# 课程章节信息
class CourseInfoView(LoginRequiredMixin, View):
    login_url = '/login/'
    redirect_field_name = 'next'

    def get(self, request, course_id):
        course = Course.objects.get(id=int(course_id))

        # 判断用户是否开始学习该课程，若未学习则添加进用户课程表
        if not UserCourse.objects.filter(course=course, user=request.user):
            user_course = UserCourse(course=course, user=request.user)
            user_course.save()
            # 该课程学习人数加一
            course.students += 1
            course.save()

        # 获取学习该课程其他用户还参与哪些课程学习
        user_courses = UserCourse.objects.filter(course=course)
        user_ids = [user_course.user_id for user_course in user_courses]
        all_user_courses = UserCourse.objects.filter(user_id__in=user_ids)
        course_ids = [user_course.course.id for user_course in all_user_courses]
        relate_courses = Course.objects.filter(id__in=course_ids).order_by('-click_nums')[:5]

        return render(request, 'courses/course-video.html', {
            'course': course,
            'relate_courses': relate_courses,
        })


# 课程评论信息
class CommentsView(LoginRequiredMixin, View):
    login_url = '/login/'
    redirect_field_name = 'next'

    def get(self, request, course_id):
        course = Course.objects.get(id=int(course_id))

        # 获取学习该课程其他用户还参与哪些课程学习
        user_courses = UserCourse.objects.filter(course=course)
        user_ids = [user_course.user_id for user_course in user_courses]
        all_user_courses = UserCourse.objects.filter(user_id__in=user_ids)
        course_ids = [user_course.course.id for user_course in all_user_courses]
        relate_courses = Course.objects.filter(id__in=course_ids).order_by('-click_nums').exclude(id=course_id)[:5]

        all_comments = course.coursecomments_set.all()
        return render(request, 'courses/course-comment.html', {
            'course': course,
            'all_comments': all_comments,
            'relate_courses': relate_courses,
        })


# 添加课程评论
class AddCommentsView(View):
    def post(self, request):
        if not request.user.is_authenticated:
            return HttpResponse('{"status": "fail", "msg": "用户未登录"}',
                                content_type='application/json')
        course_id = request.POST.get('course_id', '')
        comments = request.POST.get('comments', '')
        if course_id and comments:
            course_comments = CourseComments()
            course_comments.course = Course.objects.get(id=int(course_id))
            course_comments.user = request.user
            course_comments.comments = comments
            course_comments.save()
            return HttpResponse('{"status": "success", "msg": "评论成功"}',
                                content_type='application/json')
        else:
            return HttpResponse('{"status": "success}, "msg": "评论失败"}',
                                content_type='application/json')


# 视频播放页面
class VideoPlayView(LoginRequiredMixin, View):
    login_url = '/login/'
    redirect_field_name = 'next'

    def get(self, request, video_id):
        # 获取视频资源
        video = Video.objects.get(id=int(video_id))
        # 获取视频对应课程
        course = video.lesson.course
        # 判断用户是否学习过该课程
        user_courses = UserCourse.objects.filter(user=request.user, course=course)
        # 用户未学习该课程，将课程添加到该用户课程表中
        if not user_courses:
            user_course = UserCourse()
            user_course.user = request.user
            user_course.course = course
            user_course.save()

        # 获取学习该课程其他用户还参与哪些课程学习
        user_courses = UserCourse.objects.filter(course=course)
        user_ids = [user_course.user_id for user_course in user_courses]
        all_user_courses = UserCourse.objects.filter(user_id__in=user_ids)
        course_ids = [user_course.course.id for user_course in all_user_courses]
        relate_courses = Course.objects.filter(id__in=course_ids).order_by('-click_nums')[:5]

        return render(request, 'courses/course-play.html', {
            'video': video,
            'course': course,
            'relate_courses': relate_courses,
        })



