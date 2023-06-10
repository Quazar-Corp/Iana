import jwt
import datetime

# Set the expiration time for the token (e.g., 1 hour from now)
expiration_time = datetime.datetime.utcnow() + datetime.timedelta(hours=1)

# Define the JWT payload
payload = {
    'iss': 'iana-email-sender@iana-389322.iam.gserviceaccount.com',
    'scope': 'https://www.googleapis.com/auth/gmail.modify',
    'aud': 'https://oauth2.googleapis.com/token',
    'exp': expiration_time,
    'iat': datetime.datetime.utcnow()
}

private_key = ''
encoded_jwt = jwt.encode(payload, private_key, algorithm='RS256')
print(encoded_jwt)

