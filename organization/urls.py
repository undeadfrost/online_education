from django.urls import path

from .views import OrgListView

urlpatterns = [
    path('org_list/', OrgListView.as_view(), name='org_list')
]