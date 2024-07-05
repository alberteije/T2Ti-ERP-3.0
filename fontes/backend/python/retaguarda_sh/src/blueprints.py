from src.controller.empresa_controller import empresa_bp
from src.controller.pdv_tipo_plano_controller import pdv_tipo_plano_bp
from src.controller.erp_tipo_plano_controller import erp_tipo_plano_bp

# Register the blueprints with the Flask application
def register_blueprints(app):
		app.register_blueprint(empresa_bp)
		app.register_blueprint(pdv_tipo_plano_bp)
		app.register_blueprint(erp_tipo_plano_bp)
