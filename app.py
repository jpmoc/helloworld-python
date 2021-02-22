import os

from flask import Flask

app = Flask(__name__)

@app.route('/')
def get_root():
    target = os.environ.get('TARGET', 'World')
    return 'Hello {}!\n'.format(target)

@app.route('/delay')
def get_delay():
    target = os.environ.get('TARGET', 'Address')
    return 'Delay {}!\n'.format(target)

@app.route('/headers')
def get_headers():
    target = os.environ.get('TARGET', 'Footer')
    return 'Headers {}!\n'.format(target)

@app.route('/ip')
def get_ip():
    target = os.environ.get('TARGET', 'Address')
    return 'IP {}!\n'.format(target)

@app.route('/status')
def get_status():
    target = os.environ.get('TARGET', 'Address')
    return 'Status {}!\n'.format(target)

if __name__ == "__main__":
    # Default port is 5000
    # app.run(host='0.0.0.0')
    app.run(debug=True,host='0.0.0.0',port=int(os.environ.get('PORT', 8080)))
