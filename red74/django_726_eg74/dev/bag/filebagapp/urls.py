from django.urls import path
from . import views

app_name = 'filebagapp'

urlpatterns = [
    path('', views.FileBagListView.as_view(), name='list'),
    path('new/', views.FileBagCreateView.as_view(), name='create'),
    path('edit/<int:pk>/', views.FileBagEditView.as_view(), name='edit'),
]
