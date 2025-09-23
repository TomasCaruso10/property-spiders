import requests

url = "https://utilitygo-api-3.widergy.com/async_request/jobs?id=6aedbee0-f627-497b-9fd2-4218a7868a91"

payload = {}
headers = {}

response = requests.request("GET", url, headers=headers, data=payload)

print(response.text)
