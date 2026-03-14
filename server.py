import os
from http.server import HTTPServer, SimpleHTTPRequestHandler

BUILD_DIR = os.path.join(os.path.dirname(__file__), "build", "web")

class SPAHandler(SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory=BUILD_DIR, **kwargs)

    def do_GET(self):
        full_path = os.path.join(BUILD_DIR, self.path.lstrip("/"))
        if not os.path.exists(full_path) or os.path.isdir(full_path):
            self.path = "/index.html"
        super().do_GET()

    def log_message(self, format, *args):
        pass

if __name__ == "__main__":
    server = HTTPServer(("0.0.0.0", 5000), SPAHandler)
    print("Serving Flutter web app on http://0.0.0.0:5000")
    server.serve_forever()
