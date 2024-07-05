import os
from src import create_app 
app = create_app(os.getenv("CONFIG_MODE"))

from src.blueprints import register_blueprints
register_blueprints(app)

from src.error_handler import handle_global_error
app.register_error_handler(Exception, handle_global_error)

# Rota Padrão
@app.route('/')
def root():
    return "Vycanis Python app running!"

if __name__ == "__main__":
    app.run()