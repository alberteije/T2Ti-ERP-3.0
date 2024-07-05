import { Entity, Column, PrimaryGeneratedColumn, OneToMany } from 'typeorm';
import { AdmModuloModel } from '../../entities-export';

@Entity({ name: 'empresa' })
export class EmpresaModel { 

  @PrimaryGeneratedColumn() 
  id: number; 

  @Column({ name: 'razao_social' }) 
  razaoSocial: string; 

  @Column({ name: 'nome_fantasia' }) 
  nomeFantasia: string; 

  @Column({ name: 'cnpj' }) 
  cnpj: string; 

  @Column({ name: 'inscricao_estadual' }) 
  inscricaoEstadual: string; 

  @Column({ name: 'inscricao_municipal' }) 
  inscricaoMunicipal: string; 

  @Column({ name: 'tipo_regime' }) 
  tipoRegime: string; 

  @Column({ name: 'crt' }) 
  crt: string; 

  @Column({ name: 'data_constituicao' }) 
  dataConstituicao: Date; 

  @Column({ name: 'tipo' }) 
  tipo: string; 

  @Column({ name: 'email' }) 
  email: string; 

  @Column({ name: 'logradouro' }) 
  logradouro: string; 

  @Column({ name: 'numero' }) 
  numero: string; 

  @Column({ name: 'complemento' }) 
  complemento: string; 

  @Column({ name: 'cep' }) 
  cep: string; 

  @Column({ name: 'bairro' }) 
  bairro: string; 

  @Column({ name: 'cidade' }) 
  cidade: string; 

  @Column({ name: 'uf' }) 
  uf: string; 

  @Column({ name: 'fone' }) 
  fone: string; 

  @Column({ name: 'contato' }) 
  contato: string; 

  @Column({ name: 'codigo_ibge_cidade' }) 
  codigoIbgeCidade: number; 

  @Column({ name: 'codigo_ibge_uf' }) 
  codigoIbgeUf: number; 

  @Column({ name: 'logotipo' }) 
  logotipo: string; 

  @Column({ name: 'registrado' }) 
  registrado: string; 

  @Column({ name: 'natureza_juridica' }) 
  naturezaJuridica: string; 

  @Column({ name: 'simei' }) 
  simei: string; 

  @Column({ name: 'email_pagamento' }) 
  emailPagamento: string; 

  @Column({ name: 'data_registro' }) 
  dataRegistro: Date; 

  @Column({ name: 'hora_registro' }) 
  horaRegistro: string; 

  @Column({ name: 'id_plataforma_pagamento' }) 
  idPlataformaPagamento: string; 

  /**
   * Relations
   */
  @OneToMany(() => AdmModuloModel, admModuloModel => admModuloModel.empresaModel, { cascade: true })
  admModuloModelList: AdmModuloModel[];

  /**
   * Constructor
   */
  constructor(jsonObj: any) {
    if (jsonObj) {
      this.id = jsonObj.id || undefined;
      this.razaoSocial = jsonObj.razaoSocial || '';
      this.nomeFantasia = jsonObj.nomeFantasia || '';
      this.cnpj = jsonObj.cnpj || '';
      this.inscricaoEstadual = jsonObj.inscricaoEstadual || '';
      this.inscricaoMunicipal = jsonObj.inscricaoMunicipal || '';
      this.tipoRegime = jsonObj.tipoRegime || '';
      this.crt = jsonObj.crt || '';
      this.dataConstituicao = jsonObj.dataConstituicao || null;
      this.tipo = jsonObj.tipo || '';
      this.email = jsonObj.email || '';
      this.logradouro = jsonObj.logradouro || '';
      this.numero = jsonObj.numero || '';
      this.complemento = jsonObj.complemento || '';
      this.cep = jsonObj.cep || '';
      this.bairro = jsonObj.bairro || '';
      this.cidade = jsonObj.cidade || '';
      this.uf = jsonObj.uf || '';
      this.fone = jsonObj.fone || '';
      this.contato = jsonObj.contato || '';
      this.codigoIbgeCidade = jsonObj.codigoIbgeCidade || 0;
      this.codigoIbgeUf = jsonObj.codigoIbgeUf || 0;
      this.logotipo = jsonObj.logotipo || '';
      this.registrado = jsonObj.registrado || '';
      this.naturezaJuridica = jsonObj.naturezaJuridica || '';
      this.simei = jsonObj.simei || '';
      this.emailPagamento = jsonObj.emailPagamento || '';
      this.dataRegistro = jsonObj.dataRegistro || null;
      this.horaRegistro = jsonObj.horaRegistro || '';
      this.idPlataformaPagamento = jsonObj.idPlataformaPagamento || '';

      this.admModuloModelList = [];
      if (jsonObj.admModuloModelList) {
        this.admModuloModelList = jsonObj.admModuloModelList.map((item: any) => new AdmModuloModel(item));
      }
    }
  }
}
