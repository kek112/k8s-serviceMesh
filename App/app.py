from flask import Flask, request
import os
import json
import requests

app = Flask(__name__)

@app.route('/', methods=['GET'])
def returnText():
    if 'HOME' not in os.environ:
        return 'Please specify env TEXT'
    else:
        if 'NEXT' not in os.environ:
            return os.environ['TEXT']
        else:
            r = requests.get(os.environ['NEXT'])
            return os.environ['NEXT'] + r

@app.route('/health', methods=['GET'])
def health():
    return json.dumps({'status': 'ok'})

@app.route('/ready', methods=['GET'])
def ready():
    return json.dumps({'status': 'ok'})

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)