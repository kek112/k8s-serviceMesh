from flask import Flask, request, abort
import os
import json
import requests
import random

app = Flask(__name__)

@app.route('/', methods=['GET'])
def returnText():
    # fail 20% of the requests
    if random.randint(0,100) < 20:
        abort(404)
    # if text env is not set return phrase
    if 'TEXT' not in os.environ:
        return 'Please specify env TEXT'
    else:
        # check if next url is given for multi dependency
        if 'NEXT' not in os.environ:
            return os.environ['TEXT']
        else:
            # send request to next url
            r = requests.get(os.environ['NEXT'])
            return os.environ['TEXT'] + ' ' + r.text

@app.route('/health', methods=['GET'])
def health():
    return json.dumps({'status': 'ok'})

@app.route('/ready', methods=['GET'])
def ready():
    return json.dumps({'status': 'ok'})

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=5000)