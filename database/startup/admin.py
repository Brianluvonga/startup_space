from django.contrib import admin
from .models import CreateStartup

from .models import StartupPost
from .models import PitchStartupToInvestors


# Register your models here.

admin.site.register(CreateStartup)
admin.site.register(StartupPost)
admin.site.register(PitchStartupToInvestors)

