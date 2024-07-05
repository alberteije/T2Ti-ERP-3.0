/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model relacionado à tabela [NFE_TRANSPORTE_VOLUME] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2020 T2Ti.COM                                          
                                                                                
Permission is hereby granted, free of charge, to any person                     
obtaining a copy of this software and associated documentation                  
files (the "Software"), to deal in the Software without                         
restriction, including without limitation the rights to use,                    
copy, modify, merge, publish, distribute, sublicense, and/or sell               
copies of the Software, and to permit persons to whom the                       
Software is furnished to do so, subject to the following                        
conditions:                                                                     
                                                                                
The above copyright notice and this permission notice shall be                  
included in all copies or substantial portions of the Software.                 
                                                                                
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,                 
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES                 
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND                        
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT                     
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,                    
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING                    
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR                   
OTHER DEALINGS IN THE SOFTWARE.                                                 
                                                                                
       The author may be contacted at:                                          
           t2ti.com@gmail.com                                                   
                                                                                
@author Albert Eije (alberteije@gmail.com)                    
@version 1.0.0
*******************************************************************************/
import { Entity, Column, PrimaryGeneratedColumn, OneToMany, ManyToOne, JoinColumn } from 'typeorm';
import { NfeTransporteVolumeLacre } from '../../entities-export';
import { NfeTransporte } from '../../entities-export';

@Entity({ name: 'NFE_TRANSPORTE_VOLUME' })
export class NfeTransporteVolume { 

	@PrimaryGeneratedColumn()
	id: number;

	@Column({ name: 'QUANTIDADE' })
	quantidade: number;

	@Column({ name: 'ESPECIE' })
	especie: string;

	@Column({ name: 'MARCA' })
	marca: string;

	@Column({ name: 'NUMERACAO' })
	numeracao: string;

	@Column({ name: 'PESO_LIQUIDO' })
	pesoLiquido: number;

	@Column({ name: 'PESO_BRUTO' })
	pesoBruto: number;


	/**
	* Relations
	*/
    @OneToMany(() => NfeTransporteVolumeLacre, nfeTransporteVolumeLacre => nfeTransporteVolumeLacre.nfeTransporteVolume, { cascade: true })
    listaNfeTransporteVolumeLacre: NfeTransporteVolumeLacre[];

    @ManyToOne(() => NfeTransporte, nfeTransporte => nfeTransporte.listaNfeTransporteVolume)
    @JoinColumn({ name: "ID_NFE_TRANSPORTE" })
    nfeTransporte: NfeTransporte;


	/**
	* Constructor
	*/
	constructor(objetoJson: {}) {
		if (objetoJson != null) {
			this.id = objetoJson['id'] == 0 ? undefined : objetoJson['id'];
			this.quantidade = objetoJson['quantidade'];
			this.especie = objetoJson['especie'];
			this.marca = objetoJson['marca'];
			this.numeracao = objetoJson['numeracao'];
			this.pesoLiquido = objetoJson['pesoLiquido'];
			this.pesoBruto = objetoJson['pesoBruto'];
			
			
			this.listaNfeTransporteVolumeLacre = [];
			let listaNfeTransporteVolumeLacreJson = objetoJson['listaNfeTransporteVolumeLacre'];
			if (listaNfeTransporteVolumeLacreJson != null) {
				for (let i = 0; i < listaNfeTransporteVolumeLacreJson.length; i++) {
					let objeto = new NfeTransporteVolumeLacre(listaNfeTransporteVolumeLacreJson[i]);
					this.listaNfeTransporteVolumeLacre.push(objeto);
				}
			}

		}
	}
}