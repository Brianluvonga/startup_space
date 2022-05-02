from rest_framework import serializers

from .models import CreateStartup



class CreateStartupSerializer(serializers.ModelSerializer):
    # is_active = serializers.BooleanField(read_only=True)

    class Meta:
        model = CreateStartup
        fields = ('id','name','email', 'createdAt','password')