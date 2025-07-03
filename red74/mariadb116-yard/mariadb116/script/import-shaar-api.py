#!/usr/bin/env python3

"""
Shaarli REST API import client



usage:

albe@racknerd-4f4016:/ap/dkr/dkrcollection617a/bmark616h-yard/php605m$    python3 script/import-shaar-api.py

python C:\data\0\shaarli-api.test.py


install:

pip3 install pymysql
pip3 install requests_jwt



ref:

https://stackoverflow.com/questions/66343958/importing-data-from-an-api-and-exporting-it-into-mysql-database-using-python

https://medium.com/@himanshu_88759/how-to-import-data-from-csv-file-and-from-apis-into-mysql-database-using-python-763fb8957acc




"""



import calendar
import json
import time, os
import pymysql

# import * from requests
# from requests import JWTAuth
# import JWTAuth
import requests 
from requests_jwt import JWTAuth


print(os.environ['HOME'])


def validate_string(val):
    if val != None:
        # if int just return it
        if type(val) is int:
            # return str(val).encode('utf-8')
            return val
        # if its a list then make it a string.. this is the case for tags field..
        if type(val) is list:
            return str(val)
            # return val
        else:
            return val


def main():
    """Main entrypoint"""
    uri = 'https://shar.d.jgleba.com/api/v1/links?offset=0&limit=1456000'
    uri = 'https://shar.d.jgleba.com/api/v1/links?offset=0&limit=3345600'

    # get newer ones
    uri = 'https://shar.d.jgleba.com/api/v1/links?offset=0&limit=122'

    # get history
    uri = 'https://shar.d.jgleba.com/api/v1/history?since=2022-01-19T00:00:00%2B05:00'


    uri = 'https://shar.d.jgleba.com/api/v1/links?offset=0&limit=10'


    secret = os.environ['Shaarli_dg_secretkey']

    auth = JWTAuth(secret, alg='HS512', header_format='Bearer %s')
    auth.add_field('iat', lambda req: calendar.timegm(time.gmtime()))

    response = requests.get(uri, auth=auth)

    print(response.request.headers)
    print(response.json())
    print(json.dumps(response.json(), sort_keys=True, indent=2))
    print (auth)


    resp2=response.json()


    #  
    #  
    # see .env for....   export MYSQL_PASSWORD=some.password
    #
    #
    #
    con = pymysql.connect(host = '127.0.0.1', port = 6612, user = 'muser', passwd = os.environ['MYSQL_PASSWORD'], db = 'dkrdb')
    cursor = con.cursor()
    print(cursor)

    for i in resp2:
        # start off your query string
        # print(i)
        query = 'Insert ignore into imp_shaar_api ('
        t1=[]
        first_item = True
        for x in i:
            xx=validate_string(i.get(x, None))
            # append the value to the value list
            t1.append(xx)
            if not first_item:
                # add a comma and space to the query if it's not the first item
                query += ', '
            # add the field name to the query
            query += x
            # mark that it's no longer the first item
            first_item = False

        # finish off the query string
        query += ') VALUES {};'
        # print(query)
        print ("----- start")
        print(query.format(tuple(t1)))
        print ("----- end")
        # and send the query
        # cursor.execute('show databases;')
        # out=cursor.execute('select * from imp_shaar_api limit 2;')
        cursor.execute(query.format(tuple(t1)))
        con.commit()

if __name__ == '__main__':
    main()

