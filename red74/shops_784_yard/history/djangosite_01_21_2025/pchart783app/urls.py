from django.urls import path
from .views import survey_list_pchart, survey_success, display_survey

app_name = 'pchart783app'

urlpatterns = [
    path('<int:survey_id>/', display_survey, name='pchart_display_survey'),
    path('success/', survey_success, name='pchart_survey_success'),
    path('', survey_list_pchart, name='pchart_survey_list'),

]