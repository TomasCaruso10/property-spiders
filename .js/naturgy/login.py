import requests
import json

url = "https://utilitygo.widergy.com/api/v1/users/sessions"

payload = json.dumps({
  "email": "daniloiacono19@hotmail.com",
  "password": "45677097Dd!"
})
headers = {
  'accept': 'application/json',
  'accept-language': 'en-US,en;q=0.9,es;q=0.8',
  'channel': 'web',
  'content-type': 'application/json',
  'origin': 'https://ov.naturgy.com.ar',
  'priority': 'u=1, i',
  'referer': 'https://ov.naturgy.com.ar/',
  'sec-ch-ua': '"Not;A=Brand";v="99", "Google Chrome";v="139", "Chromium";v="139"',
  'sec-ch-ua-mobile': '?0',
  'sec-ch-ua-platform': '"Windows"',
  'sec-fetch-dest': 'empty',
  'sec-fetch-mode': 'cors',
  'sec-fetch-site': 'cross-site',
  'user-agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/139.0.0.0 Safari/537.36',
  'utility-id': '8'
}

response = requests.request("POST", url, headers=headers, data=payload)

print(response.text)
