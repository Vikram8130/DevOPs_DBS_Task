from flask import Flask, render_template_string, url_for
import requests

# set flask application
app = Flask(__name__)

# Create an index route so that when we create our application, we do not create 404 error
@app.route("/")
def check_google():
    try:
        response = requests.get("https://www.google.com", timeout=5)
        if response.status_code == 200:
            status = "Google is Up"
        else:
            status = "Google is Down"
    except requests.RequestException:
        status = "Google is Down"
    
    return render_template_string("<h1>{{ status }}</h1>", status=status)

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True) 