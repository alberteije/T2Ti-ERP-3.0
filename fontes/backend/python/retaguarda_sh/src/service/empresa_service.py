from src import db
from sqlalchemy import text
from src.model.empresa_model import EmpresaModel
from src.model.nfe_configuracao_model import NfeConfiguracaoModel
from src.model.pdv_plano_pagamento_model import PdvPlanoPagamentoModel
from src.model.acbr_monitor_porta_model import AcbrMonitorPortaModel
from src.model.empresa_plano_model import EmpresaPlanoModel
from src.model.adm_modulo_model import AdmModuloModel

class EmpresaService:
    def get_list(self):
        return EmpresaModel.query.all()

    def get_list_filter(self, filter_obj):
        return EmpresaModel.query.filter(text(filter_obj.where)).all()

    def get_object(self, id):
        return EmpresaModel.query.get_or_404(id)

    def get_object_cnpj(self, cnpj):
        obj = EmpresaModel.query.filter_by(cnpj=cnpj).first()
        return obj

    def insert(self, data):
        obj = EmpresaModel()
        obj.mapping(data)
        with db.session.begin_nested():
            db.session.add(obj) 
            self.insert_children(data, obj)
        db.session.commit()  
        return obj

    def update(self, data):
        id = data.get('id')
        obj = EmpresaModel.query.get_or_404(id)
        obj.mapping(data)
        with db.session.begin_nested():
            self.delete_children(obj)
            self.insert_children(data, obj)
        db.session.commit()
        return obj
    
    def delete(self, id):
        obj = EmpresaModel.query.get_or_404(id)
        with db.session.begin_nested():
            self.delete_children(obj)
            db.session.delete(obj)
        db.session.commit()

    def insert_children(self, data, parent):
        # nfeConfiguracaoModel
        children_data = data.get('nfeConfiguracaoModelList', []) 
        for child_data in children_data:
            child = NfeConfiguracaoModel()
            child.mapping(child_data)
            parent.nfe_configuracao_model_list.append(child)
            db.session.add(child)

        # pdvPlanoPagamentoModel
        children_data = data.get('pdvPlanoPagamentoModelList', []) 
        for child_data in children_data:
            child = PdvPlanoPagamentoModel()
            child.mapping(child_data)
            parent.pdv_plano_pagamento_model_list.append(child)
            db.session.add(child)

        # acbrMonitorPortaModel
        children_data = data.get('acbrMonitorPortaModelList', []) 
        for child_data in children_data:
            child = AcbrMonitorPortaModel()
            child.mapping(child_data)
            parent.acbr_monitor_porta_model_list.append(child)
            db.session.add(child)

        # empresaPlanoModel
        children_data = data.get('empresaPlanoModelList', []) 
        for child_data in children_data:
            child = EmpresaPlanoModel()
            child.mapping(child_data)
            parent.empresa_plano_model_list.append(child)
            db.session.add(child)

        # admModuloModel
        children_data = data.get('admModuloModelList', []) 
        for child_data in children_data:
            child = AdmModuloModel()
            child.mapping(child_data)
            parent.adm_modulo_model_list.append(child)
            db.session.add(child)


    def delete_children(self, parent):
        # nfeConfiguracaoModel
        for child in parent.nfe_configuracao_model_list: 
            db.session.delete(child)

        # pdvPlanoPagamentoModel
        for child in parent.pdv_plano_pagamento_model_list: 
            db.session.delete(child)

        # acbrMonitorPortaModel
        for child in parent.acbr_monitor_porta_model_list: 
            db.session.delete(child)

        # empresaPlanoModel
        for child in parent.empresa_plano_model_list: 
            db.session.delete(child)

        # admModuloModel
        for child in parent.adm_modulo_model_list: 
            db.session.delete(child)


    def registrar_empresa_erp(self, objeto):
        cnpj = objeto.get('cnpj')
        filter_query = f'CNPJ = "{cnpj}"'
        obj_banco = self.get_object_filter(filter_query)

        if not obj_banco:
            obj_banco = EmpresaModel()
            obj_banco.mapping(objeto)
            obj_banco.logotipo = ''
            obj_banco.registrado = 'S'
            db.session.add(obj_banco)
            db.session.commit()
            self.gerar_banco_de_dados(cnpj)
            return obj_banco
        else:
            return obj_banco

    def gerar_banco_de_dados(self, cnpj):
        try:
            # Cria o banco de dados
            db.engine.execute(f"CREATE DATABASE IF NOT EXISTS `{cnpj}`;")

            # Utiliza o banco de dados criado
            db.engine.execute(f"USE `{cnpj}`;")

            # Lê o conteúdo do arquivo de script SQL
            with open('dump-t2ti-erp3.sql', 'r') as script_file:
                script = script_file.read()

            # Executa cada consulta SQL do script
            for query in script.split(';'):
                if query.strip():
                    db.engine.execute(query)
        
        except Exception as e:
            print(e)
