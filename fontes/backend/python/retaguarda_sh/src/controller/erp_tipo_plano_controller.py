from flask import Blueprint, request, jsonify
from src.model.transient.filter import Filter
from src.service.erp_tipo_plano_service import ErpTipoPlanoService

erp_tipo_plano_bp = Blueprint('erp-tipo-plano', __name__)
service = ErpTipoPlanoService()

@erp_tipo_plano_bp.route('/erp-tipo-plano', methods=['GET'])
@erp_tipo_plano_bp.route('/erp-tipo-plano/', methods=['GET'])
def get_list():
    query_params = request.args
    filter_obj = Filter(query_params)    
    if filter_obj.where:
        result_list = service.get_list_filter(filter_obj)
    else:
        result_list = service.get_list()
    return jsonify([obj.serialize() for obj in result_list])

@erp_tipo_plano_bp.route('/erp-tipo-plano/<int:id>', methods=['GET'])
def get_object(id):
    obj = service.get_object(id)
    return jsonify(obj.serialize())

@erp_tipo_plano_bp.route('/erp-tipo-plano', methods=['POST'])
def insert():
    data = request.json
    result = service.insert(data)
    return jsonify(result.serialize()), 201

@erp_tipo_plano_bp.route('/erp-tipo-plano', methods=['PUT'])
def update():
    data = request.json
    result = service.update(data)
    return jsonify(result.serialize()), 200

@erp_tipo_plano_bp.route('/erp-tipo-plano/<int:id>', methods=['DELETE'])
def delete(id):
    service.delete(id)
    return jsonify({'message': 'Deleted successfully'})