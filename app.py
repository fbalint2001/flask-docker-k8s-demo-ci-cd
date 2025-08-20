from flask import Flask, Response
app = Flask(__name__)

@app.route("/")
def hello():
    html_content = '''
    <html>
      <head><title>Hello Kubernetes</title></head>
      <body style="background-color:black; color:white; display:flex; justify-content:center; align-items:center; height:100vh; margin:0;">
        <h1>Hello, Kubernetes!</h1>
      </body>
    </html>
    '''
    return Response(html_content, mimetype='text/html')

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
