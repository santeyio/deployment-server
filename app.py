import json
import subprocess

from flask import Flask, request, jsonify, send_from_directory
app = Flask(__name__, static_url_path='')

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
        return jsonify({'status': 'success'})

@app.route("/calebhayashida", methods=["GET", "POST"])
def calebhayashida():
    if request.method == "GET":
        return "success";
    if request.method == "POST":
        # res = request.get_json()
        # if res.get('action') == 'push':
        subprocess.call('./scripts/calebhayashida.sh')
        return jsonify({'status': 'success'})

@app.route("/donation-tracking", methods=["GET", "POST"])
def donationtracking():
    if request.method == "GET":
        return "success";
    if request.method == "POST":
        # res = request.get_json()
        # if res.get('action') == 'push':
        subprocess.call('./scripts/donation-tracking.sh')
        return jsonify({'status': 'success'})

@app.route("/mmb-deploy", methods=["GET", "POST"])
def mmbdeploy():
    if request.method == "GET":
        return "success";
    if request.method == "POST":
        # res = request.get_json()
        # if res.get('action') == 'push':
        subprocess.call('./scripts/mmb-deploy.sh')
        return jsonify({'status': 'success'})

@app.route("/vim", methods=["POST"])
@app.route("/vim/<opt>", methods=["GET"])
def vim(opt=None):
    if request.method == "POST":
        data = request.get_json()
        with open('./data/vim-repos.data', 'w') as f:
            for repo in data['repos']:
                f.write(repo + "\n")
        with open('./data/vimrc.data', 'w') as f:
            f.write(data['vimrc'])
        return jsonify({'status': 'success'})
    if request.method == "GET":
        if opt == 'repos':
            with open('./data/vim-repos.data', 'r') as f:
                repos = f.read()
            print repos
            return repos
        if opt == 'vimrc':
            with open('./data/vimrc.data', 'r') as f:
                vimrc = f.read()
            print vimrc
            return vimrc

@app.route("/vinstall", methods=["GET"])
def vinstall():
    return send_from_directory('scripts', 'vinstall')
