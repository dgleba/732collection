
I change the project name from mangoproj to djangoproj.



    cd /srv/dkr/532dkrcollection/_533e-django-example-yard/533f-dkrs-djangoexample

    grep -rin mangoproj 


    mv mangosite djangosite
    mv dgangosite/mangoproj djangosite/djangoproj

    find djangosite -type f -name '*.py' -exec sed -i 's/mangoproj/djangoproj/g' {} +

    sed -i 's/mangosite/djangosite/g' docker-compose.yml

