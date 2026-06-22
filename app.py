import os
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello():
    # Bahar se 'MY_MESSAGE' naam ka variable dhundega
    message = os.environ.get('MY_MESSAGE', 'Default message agar variable nahi mila')
    return message

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)