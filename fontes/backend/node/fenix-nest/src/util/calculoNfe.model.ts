/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Model transiente para realizar os cálculos da NF-e
                                                                                
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

export class CalculoNfeModel { 

	crtEmissor :number; // emissor
	ufEmissor :number; 
										
	tipoCliente :string; // cliente ou fornecedor
	ufCliente :string; 
	ufClienteCod :number; 
										
	valorBrutoProdutos :number; // icms
	valorFrete :number; 
	valorSeguro :number; 
	valorOutrasDespesas :number; 
	valorDesconto :number; 
	cstIcms :string; 
	csosn :string; 
	modalidadeBcIcms :string; 
	baseCalculoIcms :number; 
	taxaReducaoBcIcms :number; 
	valorReducaoBcIcms :number; 
	aliquotaIcms :number; 
	aliquotaIcmsInter :number; 
	valorIcms :number; 
										
	modalidadeBcIcmsSt :string; // icms ST
	percentualMvaIcmsSt :number; 
	baseCalculoIcmsSt :number; 
	reducaoBcIcmsSt :number; 
	valorReducaoBcIcmsSt :number; 
	aliquotaIcmsSt :number; 
	valorIcmsSt :number; 
										
	aliquotaCreditoIcmsSn :number; // icms credito simples
	valorCreditoIcmsSn :number; 
										
	cstIpi :string; // ipi
	baseCalculoIpi :number; 
	aliquotaIpi :number; 
	valorIpi :number; 
										
	cstPis :string; // pis
	baseCalculoPis :number; 
	aliquotaPis :number; 
	aliquotaPisReais :number; 
	valorPis :number; 
										
	cstCofins :string; // cofins
	baseCalculoCofins :number; 
	aliquotaCofins :number; 
	aliquotaCofinsReais :number; 
	valorCofins :number; 	
}