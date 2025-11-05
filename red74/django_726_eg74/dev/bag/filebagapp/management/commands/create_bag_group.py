from django.core.management.base import BaseCommand
from django.contrib.auth.models import Group

class Command(BaseCommand):
    help = "Creates the 'bag' user group"

    def handle(self, *args, **options):
        group, created = Group.objects.get_or_create(name='bag')
        if created:
            self.stdout.write(self.style.SUCCESS("Successfully created 'bag' group"))
        else:
            self.stdout.write("Group 'bag' already exists")
