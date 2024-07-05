<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [PESSOA] 
                                                                                
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

class PessoaService extends ServiceBase
{
    public static function consultarLista()
    {
        $gerenteConexao = GerenteConexao::getInstance();
        $objetoRepository = $gerenteConexao->entityManager->getRepository('Pessoa');
        return $objetoRepository->findAll();
    }

    public static function consultarListaFiltroValor($filtro)
    {        
        $gerenteConexao = GerenteConexao::getInstance();
        $sql = "SELECT t FROM Pessoa t WHERE " . $filtro->where;
        $query = $gerenteConexao->entityManager->createQuery($sql);
        
        return $query->getResult();
    }

    public static function consultarObjeto(int $id)
    {
        $gerenteConexao = GerenteConexao::getInstance();
        return $gerenteConexao->entityManager->find('Pessoa', $id);
    }

    public static function salvar($objeto)
    {
        $gerenteConexao = GerenteConexao::getInstance();        
        $gerenteConexao->entityManager->persist($objeto);
//		PessoaService::excluirVinculados($objeto);		
        $gerenteConexao->entityManager->flush();
    }

    public static function excluir($objeto)
    {
		PessoaService::excluirFilhos($objeto);
		PessoaService::excluirVinculados($objeto);
		parent::excluirBase($objeto);
    }

	public static function excluirFilhos($objeto)
	{
		$gerenteConexao = GerenteConexao::getInstance();
	
		$sql = "delete from PESSOA_FISICA where ID_PESSOA = " . $objeto->getId();
		$stmt = $gerenteConexao->entityManager->getConnection()->prepare($sql);
		$stmt->execute();

		$sql = "delete from PESSOA_JURIDICA where ID_PESSOA = " . $objeto->getId();
		$stmt = $gerenteConexao->entityManager->getConnection()->prepare($sql);
		$stmt->execute();

		$sql = "delete from PESSOA_CONTATO where ID_PESSOA = " . $objeto->getId();
		$stmt = $gerenteConexao->entityManager->getConnection()->prepare($sql);
		$stmt->execute();

		$sql = "delete from PESSOA_ENDERECO where ID_PESSOA = " . $objeto->getId();
		$stmt = $gerenteConexao->entityManager->getConnection()->prepare($sql);
		$stmt->execute();

		$sql = "delete from PESSOA_TELEFONE where ID_PESSOA = " . $objeto->getId();
		$stmt = $gerenteConexao->entityManager->getConnection()->prepare($sql);
		$stmt->execute();
	}

	public static function excluirVinculados($objeto)
	{
		$gerenteConexao = GerenteConexao::getInstance();

		// objetos vinculados 1:1 que tem grande change de causar erros no momento da
		// exclusão, pois são vinculados a vários outros módulos do ERP		
		// Cliente
		$sql = "delete from CLIENTE where ID_PESSOA = " . $objeto->getId();
		$stmt = $gerenteConexao->entityManager->getConnection()->prepare($sql);
		$stmt->execute();
		// Fornecedor
		$sql = "delete from FORNECEDOR where ID_PESSOA = " . $objeto->getId();
		$stmt = $gerenteConexao->entityManager->getConnection()->prepare($sql);
		$stmt->execute();
		// Transportadora
		$sql = "delete from TRANSPORTADORA where ID_PESSOA = " . $objeto->getId();
		$stmt = $gerenteConexao->entityManager->getConnection()->prepare($sql);
		$stmt->execute();
		// Colaborador
		$sql = "delete from COLABORADOR where ID_PESSOA = " . $objeto->getId();
		$stmt = $gerenteConexao->entityManager->getConnection()->prepare($sql);
		$stmt->execute();
		// Contador
		$sql = "delete from CONTADOR where ID_PESSOA = " . $objeto->getId();
		$stmt = $gerenteConexao->entityManager->getConnection()->prepare($sql);
		$stmt->execute();		
	}	
}