
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
#@  
#@  
#@  
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@   2023-06-20[Jun-Tue]10-14AM 

------------

works.


this written with chatgpt

model view templates url


https://chat.openai.com/share/db8f0cc6-6e0d-4e8a-a86c-643ffed924e0



admin like search.
https://docs.djangoproject.com/en/4.2/ref/contrib/admin/#django.contrib.admin.ModelAdmin.search_fields

When somebody does a search in the admin search box, Django splits the search query into words and returns all objects that contain each of the words, case-insensitive (using the icontains lookup), where each word must be in at least one of search_fields. For example, if search_fields is set to ['first_name', 'last_name'] and a user searches for john lennon, Django will do the equivalent of this SQL WHERE clause:
WHERE (first_name ILIKE '%john%' OR last_name ILIKE '%john%')
AND (first_name ILIKE '%lennon%' OR last_name ILIKE '%lennon%')

------------

