from django.shortcuts import render
from django.views.generic import View
from .models import CourseOrg, CityDict
# Create your views here.


class OrgListView(View):
    def get(self, request):
        org_list = CourseOrg.objects.all()
        city_list = CityDict.objects.all()
        return render(request, 'organization/org-list.html', {'org_list': org_list, 'city_list': city_list})
