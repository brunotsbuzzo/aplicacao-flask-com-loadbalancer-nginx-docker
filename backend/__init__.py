from flask import Flask


def create_app():
    app = Flask(__name__)

    from backend.views.home import index_router
    app.register_blueprint(index_router)

    return app
