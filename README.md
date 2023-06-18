# Iana
Project to automize the send of quick emails with some attachments

## Google configuration
Will be necessary to create an account service credential. ref: [Create Credentials](https://developers.google.com/workspace/guides/create-credentials?hl=en-us)

After creating, generate a key for the account service and export it as `JSON` (will be downloaded) then you just need to create a JWT and store it in `encoded_jwt.txt`. ref: [Create the JWT to authorize the request](https://developers.google.com/identity/protocols/oauth2/service-account?hl=en-us#authorizingrequests)

### Python script
This repo holds the script `generate_jwt.py` that basically read the file `service_account.json`(This is the key exported as `JSON`, I've just renamed) and generate the encoded JWT to `encoded_jwt.txt`.

#### With Nix
```bash
# Start the shell with the dependencies
nix-shell shell.nix

# Run the script
python generate_jwt.py
```

#### Without Nix
just install the dependencies with pip and run the script with your python bin.

deps:
- pyjwt
- cryptography
