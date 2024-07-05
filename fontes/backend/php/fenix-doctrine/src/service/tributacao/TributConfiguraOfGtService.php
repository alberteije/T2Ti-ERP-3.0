<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [TRIBUT_CONFIGURA_OF_GT] 
                                                                                
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

class TributConfiguraOfGtService extends ServiceBase
{
    public static function consultarLista()
    {
        $gerenteConexao = GerenteConexao::getInstance();
        $objetoRepository = $gerenteConexao->entityManager->getRepository('TributConfiguraOfGt');
        return $objetoRepository->findAll();
    }

    public static function consultarListaFiltroValor($filtro)
    {
        
        $gerenteConexao = GerenteConexao::getInstance();
        $sql = "SELECT t FROM TributConfiguraOfGt t WHERE " . $filtro->where;
        $query = $gerenteConexao->entityManager->createQuery($sql);
        
        return $query->getResult();
    }

    public static function consultarObjeto(int $id)
    {
        $gerenteConexao = GerenteConexao::getInstance();
        return $gerenteConexao->entityManager->find('TributConfiguraOfGt', $id);
    }

    public static function salvar($objeto)
    {
        parent::salvarBase($objeto);
    }

    public static function excluir($objeto)
    {
		TributConfiguraOfGtService::excluirFilhos($objeto);
		parent::excluirBase($objeto);
    }

	public static function excluirFilhos($objeto)
	{
		$gerenteConexao = GerenteConexao::getInstance();
	
		$tributCofins = $objeto->getTributCofins();
		if ($tributCofins != null) {
			$objeto->setTributCofins(null);
			$gerenteConexao->entityManager->remove($tributCofins);
		}

		$tributIpi = $objeto->getTributIpi();
		if ($tributIpi != null) {
			$objeto->setTributIpi(null);
			$gerenteConexao->entityManager->remove($tributIpi);
		}

		$tributPis = $objeto->getTributPis();
		if ($tributPis != null) {
			$objeto->setTributPis(null);
			$gerenteConexao->entityManager->remove($tributPis);
		}

		$listaTributIcmsUf = $objeto->getListaTributIcmsUf();
		if ($listaTributIcmsUf != null) {
			for ($i = 0; $i < count($listaTributIcmsUf); $i++) {
				$tributIcmsUf = $listaTributIcmsUf[$i];
				$gerenteConexao->entityManager->remove($tributIcmsUf);
			}

		}

	}
	
}