from django.urls import path

from .views import OrgListView, AddUserAskView, OrgHomeView, \
    OrgCourseListView, OrgTeacherListView, OrgDescribeView, AddFavView, \
    TeacherListView, TeacherDetailView

app_name = "organization"

urlpatterns = [
    path('list/', OrgListView.as_view(), name='org_list'),
    path('add_ask/', AddUserAskView.as_view(), name='add_ask'),
    path('home/<int:org_id>/', OrgHomeView.as_view(), name='org_home'),
    path('course/<int:org_id>/', OrgCourseListView.as_view(), name='course_list'),
    path('org_teacher/<int:org_id>/', OrgTeacherListView.as_view(), name='org_teacher'),
    path('describe/<int:org_id>/', OrgDescribeView.as_view(), name='describe'),
    path('add_fav/', AddFavView.as_view(), name='add_fav'),
    path('teacher/list/', TeacherListView.as_view(), name='teacher_list'),
    path('teacher/detail/<int:teacher_id>/', TeacherDetailView.as_view(), name='teacher_detail'),
]
