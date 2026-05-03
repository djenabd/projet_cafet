from django.shortcuts import render
from .models import Product
from rest_framework import viewsets
from .models import Student
from .serializer import StudentSerializer


def product_list(request):
    products = Product.objects.filter(available=True)
    return render(request, 'product_list.html', {'products': products})

def home(request): 
    return render (request, 'base.html')

def student_list(request): 
    products = Product.objects.all()
    return render(request, 'student_form.html', {'products': products})

def student_add(request): 
    return render (request, 'student_form.html')

def student_edit(request, pk): 
    return render (request, 'student_form.html')

def student_delete(request): 
    return render (request, 'student_form.html')

class StudentViewSet(viewsets.ModelViewSet):
    queryset = Student.objects.all()
    serializer_class = StudentSerializer