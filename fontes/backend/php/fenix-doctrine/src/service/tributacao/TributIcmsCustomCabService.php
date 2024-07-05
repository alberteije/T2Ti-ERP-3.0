<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [TRIBUT_ICMS_CUSTOM_CAB] 
                                                                                
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

class TributIcmsCustomCabService extends ServiceBase
{
    public static function consultarLista()
    {
        $gerenteConexao = GerenteConexao::getInstance();
        $objetoRepository = $gerenteConexao->entityManager->getRepository('TributIcmsCustomCab');
        return $objetoRepository->findAll();
    }

    public static function consultarListaFiltroValor($filtro)
    {
        
        $gerenteConexao = GerenteConexao::getInstance();
        $sql = "SELECT t FROM TributIcmsCustomCab t WHERE " . $filtro->where;
        $query = $gerenteConexao->entityManager->createQuery($sql);
        
        return $query->getResult();
    }

    public static function consultarObjeto(int $id)
    {
        $gerenteConexao = GerenteConexao::getInstance();
        return $gerenteConexao->entityManager->find('TributIcmsCustomCab', $id);
    }

    public static function salvar($objeto)
    {
        parent::salvarBase($objeto);
    }

    public static function excluir($objeto)
    {
		TributIcmsCustomCabService::excluirFilhos($objeto);
		parent::excluirBase($objeto);
    }

	public static function excluirFilhos($objeto)
	{
		$gerenteConexao = GerenteConexao::getInstance();
	
		$listaTributIcmsCustomDet = $objeto->getListaTributIcmsCustomDet();
		if ($listaTributIcmsCustomDet != null) {
			for ($i = 0; $i < count($listaTributIcmsCustomDet); $i++) {
				$tributIcmsCustomDet = $listaTributIcmsCustomDet[$i];
				$gerenteConexao->entityManager->remove($tributIcmsCustomDet);
			}

		}

	}
	
}