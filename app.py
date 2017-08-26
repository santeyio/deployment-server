import subprocess

from flask import Flask
app = Flask(__name__)

@app.route("/")
def index():
    return "Nothing to see here."

@app.route("/spotifyvisual", methods=["GET", "POST"])
def spotifyvisual():

    if request.method == "GET":
        return "success";

    if request.method == "POST":
        res = request.get_json()
        if res.get('action') == 'push':
            subprocess.call('./scripts/test.sh')
            return json.dumps({'status': 'success'})
