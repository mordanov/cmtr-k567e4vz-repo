from flask import Flask, jsonify

app = Flask(__name__)

@app.route("/")
def index():
    return "Hello from the environment k567e4vz! (v2 disrupted)\n", 200

@app.route("/health")
def health():
    return jsonify(status="unhealthy"), 500

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000)
