import requests

url = "https://utilitygo.widergy.com/api/v1/accounts/3434276/async"

payload = {}
headers = {
  'accept': 'application/json',
  'accept-language': 'en-US,en;q=0.9,es;q=0.8',
  'authorization': 'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo0NzYwMzEyLCJ2ZXJpZmljYXRpb25fY29kZSI6IjFNb0t5TGV0REhSZU5DcllFUWJTYWQ3b0E2WWhORnpQc0Y3WnZ6Y2FncjFtSlNaWURCckp0czM0cFYya3lqWHoiLCJyZW5ld19pZCI6InNqTVk0V3hMa3k5cFRhOUhrYWpqdDhCQXp5c2JSVlBZIiwibWF4aW11bV91c2VmdWxfZGF0ZSI6MTc5MDk1OTgwNCwiZXhwaXJhdGlvbl9kYXRlIjoxNzg3OTM1ODA0LCJ3YXJuaW5nX2V4cGlyYXRpb25fZGF0ZSI6MTc1NjQ4NjIwNCwiYXVkIjoidXRpbGl0eWdvLWFwaSIsInV0aWxpdHlfY29kZSI6OCwiaWF0IjoxNzU2Mzk5ODA0LCJleHAiOjE3ODc5MzU4MDQsImlzcyI6Imh0dHBzOi8vdXRpbGl0eWdvLWFwaS0zLndpZGVyZ3kuY29tIn0.s0Ef7AhblwHNRc4rZPS2X7DAr75vb_1KsCPcgNEh94w',
  'channel': 'web',
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

response = requests.request("GET", url, headers=headers, data=payload)

print(response.text)
