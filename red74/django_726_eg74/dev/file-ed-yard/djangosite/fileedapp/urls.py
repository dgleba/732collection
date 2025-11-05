from django.urls import path
from . import views

urlpatterns = [
    # Home/List View
    path('', views.FileListView.as_view(), name='file_list'),
    
    # Upload/Create View
    path('upload/', views.FileUpdateCreateView.as_view(), name='file_upload'),
    
    # Edit/Update Views (Internal Codemirror Editor)
    path('edit/<int:pk>/', views.FileEditView.as_view(), name='file_edit'),
    path('edit/save/<int:pk>/', views.FileSaveBodyView.as_view(), name='file_save_body'),
    
    # External Edit Workflow (Download and Re-upload)
    path('download/<int:pk>/', views.FileDownloadView.as_view(), name='file_download'),
    path('reupload/<int:pk>/', views.FileReuploadView.as_view(), name='file_reupload'),
]
