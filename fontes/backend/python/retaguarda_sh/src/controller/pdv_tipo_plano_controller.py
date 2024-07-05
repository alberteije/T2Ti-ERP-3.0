from flask import Blueprint, request, jsonify
from src.model.transient.filter import Filter
from src.service.pdv_tipo_plano_service import PdvTipoPlanoService

pdv_tipo_plano_bp = Blueprint('pdv-tipo-plano', __name__)
service = PdvTipoPlanoService()

@pdv_tipo_plano_bp.route('/pdv-tipo-plano', methods=['GET'])
@pdv_tipo_plano_bp.route('/pdv-tipo-plano/', methods=['GET'])
def get_list():
    query_params = request.args
    filter_obj = Filter(query_params)    
    if filter_obj.where:
        result_list = service.get_list_filter(filter_obj)
    else:
        result_list = service.get_list()
    return jsonify([obj.serialize() for obj in result_list])

@pdv_tipo_plano_bp.route('/pdv-tipo-plano/<int:id>', methods=['GET'])
def get_object(id):
    obj = service.get_object(id)
    return jsonify(obj.serialize())

@pdv_tipo_plano_bp.route('/pdv-tipo-plano', methods=['POST'])
def insert():
    data = request.json
    result = service.insert(data)
    return jsonify(result.serialize()), 201

@pdv_tipo_plano_bp.route('/pdv-tipo-plano', methods=['PUT'])
def update():
    data = request.json
    result = service.update(data)
    return jsonify(result.serialize()), 200

@pdv_tipo_plano_bp.route('/pdv-tipo-plano/<int:id>', methods=['DELETE'])
def delete(id):
    service.delete(id)
    return jsonify({'message': 'Deleted successfully'})