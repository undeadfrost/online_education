from django.shortcuts import render
from django.views.generic import View
from .models import CourseOrg, CityDict

from pure_pagination import Paginator, EmptyPage, PageNotAnInteger
# Create your views here.


class OrgListView(View):
    def get(self, request):
        org_all = CourseOrg.objects.all()
        city_all = CityDict.objects.all()
        org_nums = org_all.count()
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1
        p = Paginator(org_all, per_page=1, request=request)
        org_list = p.page(page)
        return render(request, 'organization/org-list.html', {
            'org_list': org_list, 'city_list': city_all,
            'org_nums': org_nums,
        })
