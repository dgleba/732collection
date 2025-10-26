from django.urls import path, include
from rest_framework import routers

from . import api
from . import views
from . import htmx


router = routers.DefaultRouter()
router.register("PostedFromTbl", api.PostedFromTblViewSet)
router.register("PostTbl", api.PostTblViewSet)
router.register("TagTbl", api.TagTblViewSet)

urlpatterns = (
    path("api/v1/", include(router.urls)),
    path("blogappm2m/PostedFromTbl/", views.PostedFromTblListView.as_view(), name="blogappm2m_PostedFromTbl_list"),
    path("blogappm2m/PostedFromTbl/create/", views.PostedFromTblCreateView.as_view(), name="blogappm2m_PostedFromTbl_create"),
    path("blogappm2m/PostedFromTbl/detail/<int:pk>/", views.PostedFromTblDetailView.as_view(), name="blogappm2m_PostedFromTbl_detail"),
    path("blogappm2m/PostedFromTbl/update/<int:pk>/", views.PostedFromTblUpdateView.as_view(), name="blogappm2m_PostedFromTbl_update"),
    path("blogappm2m/PostedFromTbl/delete/<int:pk>/", views.PostedFromTblDeleteView.as_view(), name="blogappm2m_PostedFromTbl_delete"),
    path("blogappm2m/PostTbl/", views.PostTblListView.as_view(), name="blogappm2m_PostTbl_list"),
    path("blogappm2m/PostTbl/create/", views.PostTblCreateView.as_view(), name="blogappm2m_PostTbl_create"),
    path("blogappm2m/PostTbl/detail/<int:pk>/", views.PostTblDetailView.as_view(), name="blogappm2m_PostTbl_detail"),
    path("blogappm2m/PostTbl/update/<int:pk>/", views.PostTblUpdateView.as_view(), name="blogappm2m_PostTbl_update"),
    path("blogappm2m/PostTbl/delete/<int:pk>/", views.PostTblDeleteView.as_view(), name="blogappm2m_PostTbl_delete"),
    path("blogappm2m/TagTbl/", views.TagTblListView.as_view(), name="blogappm2m_TagTbl_list"),
    path("blogappm2m/TagTbl/create/", views.TagTblCreateView.as_view(), name="blogappm2m_TagTbl_create"),
    path("blogappm2m/TagTbl/detail/<int:pk>/", views.TagTblDetailView.as_view(), name="blogappm2m_TagTbl_detail"),
    path("blogappm2m/TagTbl/update/<int:pk>/", views.TagTblUpdateView.as_view(), name="blogappm2m_TagTbl_update"),
    path("blogappm2m/TagTbl/delete/<int:pk>/", views.TagTblDeleteView.as_view(), name="blogappm2m_TagTbl_delete"),

    path("blogappm2m/htmx/PostedFromTbl/", htmx.HTMXPostedFromTblListView.as_view(), name="blogappm2m_PostedFromTbl_htmx_list"),
    path("blogappm2m/htmx/PostedFromTbl/create/", htmx.HTMXPostedFromTblCreateView.as_view(), name="blogappm2m_PostedFromTbl_htmx_create"),
    path("blogappm2m/htmx/PostedFromTbl/delete/<int:pk>/", htmx.HTMXPostedFromTblDeleteView.as_view(), name="blogappm2m_PostedFromTbl_htmx_delete"),
    path("blogappm2m/htmx/PostTbl/", htmx.HTMXPostTblListView.as_view(), name="blogappm2m_PostTbl_htmx_list"),
    path("blogappm2m/htmx/PostTbl/create/", htmx.HTMXPostTblCreateView.as_view(), name="blogappm2m_PostTbl_htmx_create"),
    path("blogappm2m/htmx/PostTbl/delete/<int:pk>/", htmx.HTMXPostTblDeleteView.as_view(), name="blogappm2m_PostTbl_htmx_delete"),
    path("blogappm2m/htmx/TagTbl/", htmx.HTMXTagTblListView.as_view(), name="blogappm2m_TagTbl_htmx_list"),
    path("blogappm2m/htmx/TagTbl/create/", htmx.HTMXTagTblCreateView.as_view(), name="blogappm2m_TagTbl_htmx_create"),
    path("blogappm2m/htmx/TagTbl/delete/<int:pk>/", htmx.HTMXTagTblDeleteView.as_view(), name="blogappm2m_TagTbl_htmx_delete"),
)
