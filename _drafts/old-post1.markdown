
Connection to REST API with Python, Requests, Basic Authentication and Error Handling
Kanan Rahimov	Python	May 8, 2018	1 Minute	

The power of Python is simplicity. All we need to connect to REST API and get data using Basic Authentication is requests library. The whole code looks like:
1
2
3
4
5
6
7
8
9
10
	
import requests
 
u = 'https://example.com/api/v2/search'
r = requests.get(u,
    auth=('<your-api-key>', '<your-api-secret>'),
    params={
        'query': 'monkey',
        'page': 4,
        'per_page': 10
    })

Given code is quite simple. First we import requests library, define a u variable with requested API link and call requests.get with auth and params options. Auth option is used to pass authentication credentials. In our case it is API key and secret. You can gather it from API provider. We pass request parameters using params options which is dictionary object.

The result is requests.models.Response object with status code and content. You can simply read content as a text or, for example, convert it to JSON.
1
2
3
4
	
if r.status_code == 200:
    data = r.json()
else:
    print('Error!')

It is very basic status check. For a detailed error handling you can use following:
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
	
u = 'https://example.com/api/v2/search'
 
try:
    r = requests.get(u,
            auth=('<your-api-key>', '<your-api-secret>'),
            params={
                'query': 'monkey',
                'page': 4,
                'per_page': 10
        }, timeout=3)
    r.raise_for_status()
except requests.exceptions.HTTPError as errh:
    print ("HTTP error:", errh)
except requests.exceptions.ConnectionError as errc:
    print ("Connectoin error:", errc)
except requests.exceptions.Timeout as errt:
    print ("Timeout error:", errt)
except requests.exceptions.RequestException as err:
    print ("Unexpected error", err)

Here we make a request inside of try/catch with advanced exception handling. Most interesting point here is r.raise_for_status(). This method will check status_code and raise exception regarding the status. For example, 400 – bad request, 403 – forbidden, etc.

    For an example of building own REST API using Python/Django you can refer to my open source GitHub project: Django REST Skeleton. Star, fork, contribute if you want to support project.

Thanks for reading. Happy coding!
