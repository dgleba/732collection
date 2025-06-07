
# https://stackoverflow.com/questions/6791911/execute-code-when-django-starts-once-only

from django.apps import AppConfig
from datetime import datetime

from apscheduler.schedulers.background import BackgroundScheduler

class SchedulerappConfig(AppConfig):
    name = 'schedulerapp'
    # verbose_name = "Periodic-Schedule-App"

    print("starting schedulerapp apps.py appconfig")

    def ready(self):
        
        def myjob01():
            print(datetime.now(),' hello v17 from schedulerapp')
            f = open("/data/schedulerapp-output01.txt", "a")
            f.write(str(datetime.now()) + " myjob01 v17 has run!\n")
            f.close()

        # startup code here

        # =================================================
        # apscheduler

        # https://stackoverflow.com/questions/11654353/how-to-setup-apscheduler-in-a-django-project/15929907
        # https://dev.to/brightside/scheduling-tasks-using-apscheduler-in-django-2dbl
        # https://stackoverflow.com/questions/6791911/execute-code-when-django-starts-once-only
        # https://apscheduler.readthedocs.io/en/stable/userguide.html
        #
        # to avoid running apscheduler twice.. --noreload - https://stackoverflow.com/questions/33814615/how-to-avoid-appconfig-ready-method-running-twice-in-django
        # command: python manage.py runserver 0.0.0.0:8000 --noreload
        #

        import logging

        logging.basicConfig()
        logging.getLogger('apscheduler').setLevel(logging.DEBUG)

        scheduler = BackgroundScheduler(job_defaults={'misfire_grace_time': 1}, )
        # scheduler.shutdown(wait=False)  

        #
        # comment this out so it will not start. 2021-02-25_Thu_12.07-PM
        #
        scheduler.start()


        scheduler.print_jobs()

        s1 = scheduler.add_job(myjob01, 'interval', minutes=30, id='myjob01_id', replace_existing=True )

        # =================================================





