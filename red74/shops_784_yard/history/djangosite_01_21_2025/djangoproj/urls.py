from django.contrib import admin
from django.urls import path, include
from django.views.generic import TemplateView
from django.contrib.auth import views as auth_views

# from rest_framework_simplejwt.views import (
#     TokenObtainPairView,
#     TokenRefreshView,
# )

from pchart783app.views import profile
# from surveyapp.views import profile as surveyprofile

# second admin site
# for second admin site


urlpatterns = [

    path('', TemplateView.as_view(template_name='index.html'), name='index'),
    # for html login
    path('accounts/', include('django.contrib.auth.urls')),
    path('tpm/', include('tpm777app.urls')),  # Use /tpm/ prefix for surveyapp
    path('pchart/', include('pchart783app.urls')),  # Use /pchart/ prefix for pchart783app
    path('accounts/', include('django.contrib.auth.urls')),
    path('accounts/profile/', profile, name='profile'),

    # admin panel forgot password. Put before admin urls..
    path('admin/password_reset/', auth_views.PasswordResetView.as_view(), name='admin_password_reset', ),
    path('admin/password_reset/done/',auth_views.PasswordResetDoneView.as_view(),name='password_reset_done',),
    path('reset/<uidb64>/<token>/',auth_views.PasswordResetConfirmView.as_view(),name='password_reset_confirm',),
    path('reset/done/',auth_views.PasswordResetCompleteView.as_view(),name='password_reset_complete',),

    path('admin/', admin.site.urls),
]
