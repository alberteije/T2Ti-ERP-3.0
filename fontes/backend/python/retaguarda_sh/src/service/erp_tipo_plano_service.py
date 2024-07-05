from src import db
from sqlalchemy import text
from src.model.erp_tipo_plano_model import ErpTipoPlanoModel

class ErpTipoPlanoService:
    def get_list(self):
        return ErpTipoPlanoModel.query.all()

    def get_list_filter(self, filter_obj):
        return ErpTipoPlanoModel.query.filter(text(filter_obj.where)).all()

    def get_object(self, id):
        return ErpTipoPlanoModel.query.get_or_404(id)
    
    def insert(self, data):
        obj = ErpTipoPlanoModel()
        obj.mapping(data)
        db.session.add(obj)
        db.session.commit()
        return obj

    def update(self, data):
        id = data.get('id')
        obj = ErpTipoPlanoModel.query.get_or_404(id)
        obj.mapping(data)
        db.session.commit()
        return obj
    
    def delete(self, id):
        obj = ErpTipoPlanoModel.query.get_or_404(id)
        db.session.delete(obj)
        db.session.commit()