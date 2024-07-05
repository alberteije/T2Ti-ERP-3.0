from flask import Flask, request, redirect
from flask_sqlalchemy import SQLAlchemy
from dotenv import load_dotenv

# Load environment variables from the .env file
load_dotenv()

# Import the Flask application settings
from src.config import config

# Create the SQLAlchemy instance to interact with the database
db = SQLAlchemy()
   
# Function to create and configure the Flask application
def create_app(config_mode):
    # Create the Flask application instance
    app = Flask(__name__)

    # Configure the Flask application based on the provided configuration mode
    app.config.from_object(config[config_mode])

    # Initialize SQLAlchemy with the Flask application
    db.init_app(app)

    return app