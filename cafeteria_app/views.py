from django.shortcuts import render
from .models import Product

def product_list(request):
    products = Product.objects.filter(available=True)
    return render(request, 'product_list.html', {'products': products})

def home(request): 
    return render (request, 'base.html')

def student_list(request): 

    
    return render (request, 'product_list.html')

def student_add(request): 
    return render (request, 'student_form.html')

def student_edit(request, pk): 
    return render (request, 'student_form.html')

def student_delete(request): 
    return render (request, 'student_form.html')