from django.contrib import admin
from django.urls import path
from django.contrib.auth import views as auth_views
from cafeteria_app import views
from django_cas_ng import views as cas_views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.home, name='home'),
    path('products/', views.product_list, name='products'),
    path('students/', views.student_list, name='students'),
    path('students/add/', views.student_add, name='student_add'),
    path('students/<int:pk>/edit/', views.student_edit, name='student_edit'),
    path('students/<int:pk>/delete/', views.student_delete, name='student_delete'),
    path('accounts/login/', cas_views.LoginView.as_view(), name='cas_ng_login'),
    path('accounts/logout/', cas_views.LogoutView.as_view(), name='cas_ng_logout'),
]
    # Ajoutez pour products et transactions

