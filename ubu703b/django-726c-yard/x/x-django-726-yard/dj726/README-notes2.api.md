
# one

  docker-compose run --rm djdev  python manage.py admin_generator blog



# Notes for _533-django-example-yard

2020-12-30

todo:

roles..

https://github.com/dfunckt/django-rules/tree/master/tests/testapp

https://stackoverflow.com/questions/19365358/django-equivalent-of-rails-cancan-and-devise

https://github.com/django-guardian/django-guardian


https://github.com/dfunckt/django-rules
https://github.com/dfunckt/django-rules/issues/56

https://djangopackages.org/grids/g/authorization/




filter..



pagination..




=================================================


http://192.168.88.60:6461/ front views work.

http://192.168.88.60:6461/admin/ works. can login. 

http://192.168.88.60:6461/blogapp/api/v1/ works.
http://10.4.71.231:37461/blogapp/api/v1/Post works.
http://10.4.71.231:37461/menuapp/api/v1/Menu0/
before jwt.

http://192.168.88.60:6461/blogapp/api/v1/Post/ shows post list. when logged into session.


2020-12-13_Sun_09.36-AM works.


=================================================

2020-12-13_Sun_10.08-am 

https://simpleisbetterthancomplex.com/tutorial/2018/12/19/how-to-use-jwt-authentication-with-django-rest-framework.html


http post http://10.4.71.231:37461/api/token/ username=admin password=bb

curl  -i -H "Content-Type: application/json"  \
      -X POST -D ./curldump -i\
      -d '{"username":"cc","password":"aa"}' \
      http://192.168.88.60:6461/api/token/ 


works..
http http://192.168.88.60:6461/blogapp/hello/ "Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjA3ODc0MjY0LCJqdGkiOiJjZWJjZjVkMDhjOTA0Mjg5OTI5NjFlZDhkODVjNDIyNyIsInVzZXJfaWQiOjN9.ug_taLCeqow_-Z8oIvNeaN3sOtmRfYM4k5A8bNOnN-E"


_____________


web ui for api.

http://192.168.88.60:6461/blogapp/api/v1/Post/ 




works.

http http://192.168.88.60:6461/blogapp/api/v1/Post/ "Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjA3ODc5MjU3LCJqdGkiOiIwMTc5MGRjMTBmZGU0ZTdlYTU2ZTY1MmFlNWVmOTJlNCIsInVzZXJfaWQiOjN9.d31ALRmsgIDCBc0RYzTnJGE6eXonSU45Jpsz3QfKK2o"


albe@vamp398:/srv/dkr/532dkrcollection/_533-django-example-yard/533-dkrs-djangoexample$ http http://192.168.88.60:6461/blogapp/api/v1/Post/ "Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjA3ODc5MjU3LCJqdGkiOiIwMTc5MGRjMTBmZGU0ZTdlYTU2ZTY1MmFlNWVmOTJlNCIsInVzZXJfaWQiOjN9.d31ALRmsgIDCBc0RYzTnJGE6eXonSU45Jpsz3QfKK2o"
HTTP/1.1 200 OK
Allow: GET, POST, HEAD, OPTIONS
Content-Length: 241
Content-Type: application/json
Date: Sun, 13 Dec 2020 17:04:17 GMT
Server: WSGIServer/0.2 CPython/3.7.9
Vary: Accept
X-Frame-Options: SAMEORIGIN

[
    {
        "body": "wewe",
        "created": "2020-12-13T14:29:21.014671Z",
        "last_updated": "2020-12-13T14:29:21.014774Z",
        "title": "sleep.promise.only"
    },
    {
        "body": "q",
        "created": "2020-12-13T16:53:54.292137Z",
        "last_updated": "2020-12-13T16:53:54.292227Z",
        "title": "q"
    }
]


=================================================

put works with id in json.


2021-01-10_Sun_18.30-PM

Api Root Post List Post Instance
Post Instance
ViewSet for the Post class

PUT /blogapp/api/v1/Post/3/
HTTP 200 OK
Allow: GET, PUT, PATCH, DELETE, HEAD, OPTIONS
Content-Type: application/json
Vary: Accept
{
    "id": 3,
    "created": "2020-12-13T17:18:12.369173Z",
    "last_updated": "2021-01-10T23:29:00.577141Z",
    "title": "Authentication in a Nuxt.js App ammezie c",
    "body": "wewe2 b"
}


=================================================

https://developer.mozilla.org/en-US/docs/Learn/Server-side/Django/Authentication

https://github.com/mdn/django-locallibrary-tutorial


