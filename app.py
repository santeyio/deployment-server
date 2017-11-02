import json
import subprocess

from flask import Flask, request
app = Flask(__name__)

@app.route("/")
def index():
    return "Nothing to see here."

@app.route("/spotifyvisual", methods=["GET", "POST"])
def spotifyvisual():
    if request.method == "GET":
        return "success";
    if request.method == "POST":
        # res = request.get_json()
        # if res.get('action') == 'push':
        subprocess.call('./scripts/spotifyvisual.sh')
        return json.dumps({'status': 'success'})

@app.route("/calebhayashida", methods=["GET", "POST"])
def calebhayashida():
    if request.method == "GET":
        return "success";
    if request.method == "POST":
        # res = request.get_json()
        # if res.get('action') == 'push':
        subprocess.call('./scripts/calebhayashida.sh')
        return json.dumps({'status': 'success'})

@app.route("/donation-tracking", methods=["GET", "POST"])
def donationtracking():
    if request.method == "GET":
        return "success";
    if request.method == "POST":
        # res = request.get_json()
        # if res.get('action') == 'push':
        subprocess.call('./scripts/donation-tracking.sh')
        return json.dumps({'status': 'success'})

@app.route("/vim", methods=["GET", "POST"])
def vim():
    if request.method == "POST":

