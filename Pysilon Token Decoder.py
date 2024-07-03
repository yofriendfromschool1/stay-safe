import base64

def reverse_and_base64_decode(token):
    reversed_token = token[::-1]
    try:
        decoded_token = base64.b64decode(reversed_token).decode('utf-8')
        return decoded_token
    except Exception as e:
        return str(e)

token = input('Please enter the encoded token: ')

if token:
    decoded_token = reverse_and_base64_decode(token)
    print('The decoded token is:', decoded_token)
else:
    print('No token was entered or it is wrong :skull:')
