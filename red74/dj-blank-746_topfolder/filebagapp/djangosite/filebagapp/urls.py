from django.urls import path
from . import views

urlpatterns = [
    path('', views.file_list, name='filebag-list'),
    path('upload/', views.file_upload, name='filebag-upload'),
    path('edit/<int:pk>/', views.file_edit, name='filebag-edit'),
    path('local-edit/<int:pk>/', views.file_local_edit, name='filebag-local-edit'),
]
