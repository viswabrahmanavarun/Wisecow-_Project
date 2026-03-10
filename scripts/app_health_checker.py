import requests

url = "http://localhost:3000"

try:
    response = requests.get(url, timeout=5)

    if response.status_code == 200:
        print("Application is UP")
    else:
        print("Application is DOWN")

except:
    print("Application is not reachable")