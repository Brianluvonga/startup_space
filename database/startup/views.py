# from django.shortcuts import render, get_object_or_404


from rest_framework import viewsets
from .models import CreateStartup
from .serializers import CreateStartupSerializer



# Create your views here.
class RegisterStartupViewSet(viewsets.ModelViewSet):
    queryset = CreateStartup.objects.all()
    serializer_class = CreateStartupSerializer



