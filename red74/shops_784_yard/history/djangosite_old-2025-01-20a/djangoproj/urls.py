"""XXX_PROJECT_NAME_XXX URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from django.views.generic import TemplateView
from django.contrib.auth import views as auth_views

from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView,
)

from surveyapp.views import index, profile

# second admin site
# from blogapp.admin import admin2

urlpatterns = [

    path('', TemplateView.as_view(template_name='index.html'), name='index'),
    # for jwt
    path('api/token/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('api/token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),

    # for html login
    path('accounts/', include('django.contrib.auth.urls')),

    # path('blogapp/', include('blogapp.urls')),
    # path('menuapp/', include('menuapp.urls')),
    # path('menu94app/', include('menu94app.urls')),
    # path('blogappm2m/', include('blogappm2m.urls')),

    path('survey/', include('surveyapp.urls')),
    path('accounts/', include('django.contrib.auth.urls')),
    path('accounts/profile/', profile, name='profile'),

    # admin panel forgot password. Put before admin urls..
    path('admin/password_reset/', auth_views.PasswordResetView.as_view(), name='admin_password_reset', ),
    path('admin/password_reset/done/',auth_views.PasswordResetDoneView.as_view(),name='password_reset_done',),
    path('reset/<uidb64>/<token>/',auth_views.PasswordResetConfirmView.as_view(),name='password_reset_confirm',),
    path('reset/done/',auth_views.PasswordResetCompleteView.as_view(),name='password_reset_complete',),

    path('admin/', admin.site.urls),
    
    # for second admin site
    # path('admin2/', admin2.urls),


]


