from django.urls import path
from . import views

app_name = 'tpm777app'

urlpatterns = [
    path('tpm/<int:survey_id>/', views.display_survey, name='display_survey'),
    path('tpm/success/', views.survey_success, name='survey_success'),
    path('', views.survey_list, name='tpm_survey_list'),
]