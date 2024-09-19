import socket
from flask import Blueprint

index_router = Blueprint('index', __name__, url_prefix='/')

@index_router.route('/')
def index():
    hostname = socket.gethostname()
    ip_address = socket.gethostbyname(hostname)
    return f'Hostname: {hostname.upper()}<br>IP Address: {ip_address}'