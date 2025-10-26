
{
    "refresh": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMDkzODcyNSwianRpIjoiYTkxNjZjMWE3NDA2NGYwNGExNDQ3ZTMwODgyYWVjNzciLCJ1c2VyX2lkIjo0fQ.W-4ifOt69dPb7MKnJRcpviE2ipwHyMxGWr9AKAe2lSQ",
    "access": 
	
	token="eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjEwODU1OTI1LCJqdGkiOiJiYWQ0NTdjNTMyNTE0MDZiYmY1ZWY2OTVkNWMxZTliYyIsInVzZXJfaWQiOjR9.4ifayPlZaDBZdn7luTkkkRwtd4OUzquOgwu9SPW6QC0"
	
	}

http http://192.168.88.60:6461/blogapp/api/v1/Post/ "Authorization: Bearer $token"


http http://192.168.88.60:6461/blogapp/api/v1/Post/3/ "Authorization: Bearer $token"


http put http://192.168.88.60:6461/blogapp/api/v1/Post/update/3/ "Authorization: Bearer $token" title=" Nuxt.js App ammezie c" 


curl -H "Authorization: JWT YourToken" -d "field=value&field=value" 'http://127.0.0.1:8000/protected_url'

curl -H "Authorization: $token" -d "title=Nuxt.js App ammezie c&body=value" 'http://192.168.88.60:6461/blogapp/api/v1/Post/'

_____________

echo $token
curl -i -H "Content-Type: application/json" -H "Authorization: Bearer $token" -X post  -d '{"title":"cc","body":"aa"}' 'http://192.168.88.60:6461/blogapp/api/v1/Post/'




albe@vamp398:~$ curl -i -H "Content-Type: application/json" -H "Authorization: Bearer $token" -X post  -d '{"title":"cc","body":"aa"}' 'http://192.168.88.60:6461/blogapp/api/v1/Post/'
HTTP/1.1 201 Created
Date: Sat, 16 Jan 2021 03:32:03 GMT
Server: WSGIServer/0.2 CPython/3.7.9
Content-Type: application/json
Vary: Accept, Origin
Allow: GET, POST, HEAD, OPTIONS
X-Frame-Options: SAMEORIGIN
Content-Length: 119

{"id":19,"created":"2021-01-16T03:32:03.712152Z","last_updated":"2021-01-16T03:32:03.712198Z","title":"cc","body":"aa"}albe@vamp398:~$
albe@vamp398:~$

_____________


http post http://192.168.88.60:6461/api/token/ username=rr password=David1212@gmail.com


{
    "access": 
	token="eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjEwODU4MDA5LCJqdGkiOiI4YmUxNTRlYWVkMTM0ZmFmOWIzZDY0ZGMzYmM2YzY2ZiIsInVzZXJfaWQiOjR9.k5KLO5xtnnfd01mtjVEsmAHDQhVtOo86pHRDxY9XHGQ"
	,
    "refresh": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTYxMDk0MDgwOSwianRpIjoiODgyNmY0ODRiYzhjNDU1ZGFhMjBhNTY2MzY5Y2ZlMTUiLCJ1c2VyX2lkIjo0fQ.ebsWgG_poY9UnAaUXxG9jgokfW2gXtGyYjY2_ZCZ3pM"
}


https://devhints.io/httpie



#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@  
#@  works...  after I changed it. now respects permissions.
#@  
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   2021-01-15[Jan-Fri]22-43PM 

was

    permission_classes = [permissions.IsAuthenticated,]

now

    permission_classes = [permissions.IsAuthenticated, permissions.DjangoModelPermissions]


albe@vamp398:~$ curl -i -H "Content-Type: application/json" -H "Authorization: Bearer $token" -X post  -d '{"title":"cc2","body":"aa2"}' 'http://192.168.88.60:6461/blogapp/api/v1/Post/'
HTTP/1.1 403 Forbidden
Date: Sat, 16 Jan 2021 03:43:10 GMT
Server: WSGIServer/0.2 CPython/3.7.9
Content-Type: application/json
Vary: Accept, Origin
Allow: GET, POST, HEAD, OPTIONS
X-Frame-Options: SAMEORIGIN
Content-Length: 63

{"detail":"You do not have permission to perform this action."}albe@vamp398:~$


=================================================


albe@vamp398:/srv/dkr/532dkrcollection/_533-django-example-yard_role$ git d

diff --git a/_533-django-example-yard_role/533-dkrs-djangoexample/mangosite/blogapp/api.py b/_533-django-example-yard_role/533-dkrs-djangoexample/mangosite/blogapp/api.py

-    permission_classes = [permissions.IsAuthenticated]
+    permission_classes = [permissions.IsAuthenticated, permissions.DjangoModelPermissions]


--- a/_533-django-example-yard_role/533-dkrs-djangoexample/mangosite/mangoproj/settings.py
+++ b/_533-django-example-yard_role/533-dkrs-djangoexample/mangosite/mangoproj/settings.py


 REST_FRAMEWORK = {
+    'DEFAULT_PERMISSION_CLASSES': [
+        'rest_framework.permissions.IsAuthenticated',
+        "rest_framework.permissions.DjangoModelPermissions",
+    ],
     'DEFAULT_AUTHENTICATION_CLASSES': [
         'rest_framework_simplejwt.authentication.JWTAuthentication',
         'rest_framework.authentication.SessionAuthentication',
     ],
 }


albe@vamp398:/srv/dkr/532dkrcollection/_533-django-example-yard_role$

=================================================



#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@  
#@  
#@  
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   2021-01-15[Jan-Fri]23-10PM 


search


?search=Samsung

http http://192.168.88.60:6461/blogapp/api/v1/Post/ "Authorization: Bearer $token"

http http://192.168.88.60:6461/blogapp/api/v1/Post/?search=c "Authorization: Bearer $token"

http http://192.168.88.60:6461/blogapp/api/v1/Post/?search='ca 21' "Authorization: Bearer $token"


---

works multiple terms..


albe@vamp398:/srv/dkr/532dkrcollection/_533-django-example-yard_role$ http http://192.168.88.60:6461/blogapp/api/v1/Post/?search='ca 21' "Authorization: Bearer $token"
HTTP/1.1 200 OK
Allow: GET, POST, HEAD, OPTIONS
Content-Length: 167
Content-Type: application/json
Date: Sat, 16 Jan 2021 04:14:11 GMT
Server: WSGIServer/0.2 CPython/3.7.9
Vary: Accept, Origin
X-Frame-Options: SAMEORIGIN

[
    {
        "body": "2021-01-15",
        "created": "2020-12-13T17:18:12.369173Z",
        "id": 3,
        "last_updated": "2021-01-16T03:15:46.356642Z",
        "title": "Authentication in a Nuxt.js App ammezie c"
    }
]

albe@vamp398:/srv/dkr/532dkrcollection/_533-django-example-yard_role$


=================================================


pagination:

works.

albe@vamp398:/srv/dkr/532dkrcollection/_533-django-example-yard_role$ http http://192.168.88.60:6461/blogapp/api/v1/Post/ "Authorization: Bearer $token"
HTTP/1.1 200 OK
Allow: GET, POST, HEAD, OPTIONS
Content-Length: 426
Content-Type: application/json
Date: Sat, 16 Jan 2021 04:24:02 GMT
Server: WSGIServer/0.2 CPython/3.7.9
Vary: Accept, Origin
X-Frame-Options: SAMEORIGIN

{
    "count": 6,
    "next": "http://192.168.88.60:6461/blogapp/api/v1/Post/?limit=2&offset=2",
    "previous": null,
    "results": [
        {
            "body": "2021-01-15",
            "created": "2020-12-13T17:18:12.369173Z",
            "id": 3,
            "last_updated": "2021-01-16T03:15:46.356642Z",
            "title": "Authentication in a Nuxt.js App ammezie c"
        },
        {
            "body": "wewe 4 110",
            "created": "2021-01-09T02:05:47.385963Z",
            "id": 9,
            "last_updated": "2021-01-10T23:29:23.783718Z",
            "title": "sleep.promise.only 110b"
        }
    ]
}

albe@vamp398:/srv/dkr/532dkrcollection/_533-django-example-yard_role$


_____________


token="eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjEwODYxMzY5LCJqdGkiOiI3ZGY4ZmY5NDM0YjU0NjFkOTY4M2VmMjU5MjZmNmNhNCIsInVzZXJfaWQiOjR9.irlD7Jr9K7KF96JBU7zXja3TtfU3TDQDgd3a25Wp9i4"

works.

http  http://192.168.88.60:6461/blogapp/api/v1/Post/?offset=2  "Authorization: Bearer $token"


works.

http http://192.168.88.60:6461/blogapp/api/v1/Post/?'limit=3&offset=2'  "Authorization: Bearer $token"


=================================================

