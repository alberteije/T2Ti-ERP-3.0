from src import db
from sqlalchemy import text
from src.model.pdv_tipo_plano_model import PdvTipoPlanoModel
from src.model.pdv_plano_pagamento_model import PdvPlanoPagamentoModel

class PdvTipoPlanoService:
    def get_list(self):
        return PdvTipoPlanoModel.query.all()

    def get_list_filter(self, filter_obj):
        return PdvTipoPlanoModel.query.filter(text(filter_obj.where)).all()

    def get_object(self, id):
        return PdvTipoPlanoModel.query.get_or_404(id)
    
    def insert(self, data):
        obj = PdvTipoPlanoModel()
        obj.mapping(data)
        with db.session.begin_nested():
            db.session.add(obj) 
            self.insert_children(data, obj)
        db.session.commit()  
        return obj

    def update(self, data):
        id = data.get('id')
        obj = PdvTipoPlanoModel.query.get_or_404(id)
        obj.mapping(data)
        with db.session.begin_nested():
            self.delete_children(obj)
            self.insert_children(data, obj)
        db.session.commit()
        return obj
    
    def delete(self, id):
        obj = PdvTipoPlanoModel.query.get_or_404(id)
        with db.session.begin_nested():
            self.delete_children(obj)
            db.session.delete(obj)
        db.session.commit()

    def insert_children(self, data, parent):
        # pdvPlanoPagamentoModel
        children_data = data.get('pdvPlanoPagamentoModelList', []) 
        for child_data in children_data:
            child = PdvPlanoPagamentoModel()
            child.mapping(child_data)
            parent.pdv_plano_pagamento_model_list.append(child)
            db.session.add(child)


    def delete_children(self, parent):
        # pdvPlanoPagamentoModel
        for child in parent.pdv_plano_pagamento_model_list: 
            db.session.delete(child)

