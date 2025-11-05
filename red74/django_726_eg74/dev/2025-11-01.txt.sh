
no. use common one,
# python -m venv ../../sysdata/venv0
# . ../../sysdata/venv0/bin/activate

once:

# a django dev project env. can be used for many projects.
python -m venv ~/pipenvs/venv0
source ~/pipenvs/venv0/bin/activate
sudo apt update
sudo apt install default-libmysqlclient-dev build-essential pkg-config
sudo apt install libmariadb-dev


pip install -r requirements.txt

cd /ap/dkr/732collection/red74/django_726_eg74/dj726eg74/djangosite
source ~/pipenvs/venv0/bin/activate
#python manage.py runserver
python manage.py runserver 0.0.0.0:8000


http://10.33.44.81:8000

------------

