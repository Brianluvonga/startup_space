from django.db import models

# Create your models here.


# ========================= STARTUP MODEL SECTION ================================ #
#register startup
class CreateStartup(models.Model):   
    name = models.CharField(max_length=50)
    email = models.CharField(max_length=20)
    password = models.CharField(max_length=30)
    createdAt = models.DateField(auto_now_add=True)



# model to display posts made by startups
class StartupPost(models.Model):
    postID = models.IntegerField(default=None)
    postedAt = models.DateTimeField()
    startupID = models.IntegerField(CreateStartup(id))
    postText = models.TextField(blank=True,null=True)
    # postImage = models.ImageField()
    is_active = models.BooleanField(default=True)
    



#model for startups to pitch their ideas to potential and future investors
class PitchStartupToInvestors(models.Model):
    # image = models.ImageField(blank=True,null=True)
    about = models.TextField(blank=True,null=True)
    pitchedAt = models.DateTimeField(auto_now_add=True)


# ============================= END OF STARTUP MODEL SECTION ============================== #