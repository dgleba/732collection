"""
Django settings for djangoproj project.

For more information on this file, see
https://docs.djangoproject.com/

"""

from pathlib import Path, os

# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/4.1/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = '^l)7d*%h&db4uft@dk%h-#pu%)a!d)c7jwgoixo5_hm0$'

# SECURITY WARNING: don't run with debug turned on in production!
# DEBUG = False
DEBUG = True

ALLOWED_HOSTS = ['*']

CSRF_TRUSTED_ORIGINS = [
    "https://webfilesearch.daveg.win",
]


# Application definition
INSTALLED_APPS = [
    "whitenoise.runserver_nostatic",
    'jazzmin',
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'rest_framework',
    'channels',
    'django_htmx',
    'blogappm2m',
    'wfsearchapp',
]


# https://whitenoise.readthedocs.io/en/latest/django.html#using-whitenoise-in-development

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    "whitenoise.middleware.WhiteNoiseMiddleware",
    
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
    'django_htmx.middleware.HtmxMiddleware',
]

ROOT_URLCONF = 'djangoproj.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': ['templates'],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'djangoproj.wsgi.application'


# Database
# https://docs.djangoproject.com/en/4.1/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'sqlitedb/wfsearch-files.db'),  # Legacy DB becomes default
    }
}


# Password validation
# https://docs.djangoproject.com/en/4.1/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/4.1/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/4.1/howto/static-files/

#whitenoise docs say..
STATIC_ROOT = BASE_DIR / "static"

STATIC_URL = '/static/'

MEDIA_URL = '/upload/'
MEDIA_ROOT = os.path.join(BASE_DIR, 'upload')




# Default primary key field type
# https://docs.djangoproject.com/en/4.1/ref/settings/#default-auto-field

DEFAULT_AUTO_FIELD = 'django.db.models.AutoField'

# Django Channels
ASGI_APPLICATION = "djangoproj.routing.application"
CHANNEL_LAYERS = {
    "default": {
        "BACKEND": "channels.layers.InMemoryChannelLayer"
        # Use a redis instance
        # "BACKEND": "channels_redis.core.RedisChannelLayer",
        # "CONFIG": {"hosts": [("127.0.0.1", 6379)],},
    },
}



# --- Optional JAZZMIN_SETTINGS (Highly Recommended) ---

JAZZMIN_SETTINGS = {
    # Title of the window (Will default to current_admin_site.site_title if absent or None)
    "site_title": "Blog Admin",

    # Title on the brand (19 chars max)
    "site_header": "My Blog",

    # Welcome sign on the login page
    "welcome_sign": "Welcome to the Blog Administration",

    # Custom icons for the side menu (optional)
    "icons": {
        "auth.user": "fas fa-user",
        "auth.Group": "fas fa-users",
        "blogapp.article": "fas fa-newspaper", # Use your app name and model name in lowercase
    },
    
    # Links to put in the top menu
    "topmenu_links": [

        # Url that opens in a new window/tab (optional)
        {"name": "Support", "url": "https://github.com/farridav/django-jazzmin/issues", "new_window": True},
        
        # model admin to link to (optional non-hierarchical link)
        {"model": "blogapp.Article"},
    ],

    # The UI elements to control the look and feel which are enabled by default
    "changeform_format": "horizontal_tabs", # e.g. "horizontal_tabs", "vertical_tabs", "collapsible", "single"
}

JAZZMIN_UI_TWEAKS = {
    "navbar_small": False,
    "body_small": False,
    "brand_small": False,
    "brand_colour": False,
    "accent": "accent-primary",
    "navbar": "navbar-dark",
    "no_navbar_border": False,
    "navbar_fixed": False,
    "layout_boxed": False,
    "footer_fixed": False,
    "sidebar_fixed": False,
    "sidebar": "sidebar-dark-info",
    "sidebar_nav_small": False,
    "sidebar_disable_expand": False,
    "sidebar_nav_child_indent": False,
    "sidebar_nav_compact_style": False,
    "sidebar_nav_legacy_style": False,
    "sidebar_nav_flat_style": False,
    "theme": "united", # You can choose from many themes like 'solar', 'cerulean', 'darkly', etc.
    "dark_mode_vars": {
        "success": "#00bc8c",
    },
    "button_classes": {
        "primary": "btn-outline-primary",
        "secondary": "btn-outline-secondary",
        "info": "btn-info",
        "warning": "btn-warning",
        "danger": "btn-danger"
    }
}