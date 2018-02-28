from django.urls import path

from .views import OrgListView, AddUserAskView

app_name = "organization"

urlpatterns = [
    path('list/', OrgListView.as_view(), name='org_list'),
    path('add_ask/', AddUserAskView.as_view(), name='add_ask'),
]
