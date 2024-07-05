from flask import Blueprint, request, jsonify
from src.model.transient.filter import Filter
from src.service.empresa_service import EmpresaService
from src.util.util import Util

empresa_bp = Blueprint('empresa', __name__)
service = EmpresaService()

@empresa_bp.route('/empresa', methods=['GET'])
@empresa_bp.route('/empresa/', methods=['GET'])
def get_list():
    query_params = request.args
    filter_obj = Filter(query_params)    
    if filter_obj.where:
        result_list = service.get_list_filter(filter_obj)
    else:
        result_list = service.get_list()
    return jsonify([obj.serialize() for obj in result_list])

@empresa_bp.route('/empresa/<int:id>', methods=['GET'])
def get_object(id):
    obj = service.get_object(id)
    return jsonify(obj.serialize())

@empresa_bp.route('/empresa/cnpj/<string:cnpj>', methods=['GET'])
def get_object_cnpj(cnpj):
    obj = service.get_object_cnpj(cnpj)
    return jsonify(obj.serialize())

@empresa_bp.route('/empresa', methods=['POST'])
def insert():
    data = request.json
    result = service.insert(data)
    return jsonify(result.serialize()), 201

@empresa_bp.route('/empresa', methods=['PUT'])
def update():
    data = request.json
    result = service.update(data)
    return jsonify(result.serialize()), 200

@empresa_bp.route('/empresa/<int:id>', methods=['DELETE'])
def delete(id):
    service.delete(id)
    return jsonify({'message': 'Deleted successfully'})

@empresa_bp.route('/empresa/registra-empresa-erp', methods=['POST'])
def registrar_empresa_erp():
    data = Util.decrypt(request.json)
    result = service.registrar_empresa_erp(data)
    retorno = Util.crypt(jsonify(result))
    return jsonify(retorno)