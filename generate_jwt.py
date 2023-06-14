import json
import jwt
import datetime

# Read the contents of the iana.json file
with open('./service_account.json') as json_file:
    iana_app_settings = json.load(json_file)

# Set the expiration time for the token (e.g., 1 hour from now)
expiration_time = datetime.datetime.utcnow() + datetime.timedelta(hours=1)

# Define the JWT payload
payload = {
    'iss': iana_app_settings['client_email'],
    'scope': 'https://www.googleapis.com/auth/gmail.modify',
    'aud': iana_app_settings['token_uri'],
    'exp': expiration_time,
    'iat': datetime.datetime.utcnow()
}

private_key = iana_app_settings['private_key']

encoded_jwt = jwt.encode(payload, private_key, algorithm='RS256')

with open('encoded_jwt.txt', 'w') as jwt_file:
    jwt_file.write(encoded_jwt)

print('JWT written to encoded_jwt.txt')
