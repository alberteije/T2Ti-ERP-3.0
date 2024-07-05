from flask import jsonify
from werkzeug.exceptions import HTTPException
import traceback

def handle_global_error(error):
    """Handle global errors"""
    if isinstance(error, HTTPException):
        code = error.code
        message = error.description
        name = error.name
    else:
        code = 500
        message = "Internal Server Error"
        name = "Internal Server Error"
    
    trace = traceback.format_exc() 

    response = jsonify({
        "status": code,
        "message": message,
        "error": name,
        "trace": trace  
    })
    response.status_code = code
    return response
