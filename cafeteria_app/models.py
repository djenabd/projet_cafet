from django.db import models

class Student(models.Model):
    name = models.CharField(max_length=100)
    email = models.EmailField()
    credit = models.FloatField(default=0.0)

class Product (models.Model):
    name = models.CharField(max_length=100)
    price = models.FloatField()
    available = models.BooleanField()

class Transaction(models.Model):
    student = models.ForeignKey(Student, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    date = models.DateTimeField(auto_now_add=True)
