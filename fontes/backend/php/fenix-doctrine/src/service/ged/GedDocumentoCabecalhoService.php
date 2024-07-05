<?php
/*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Service relacionado à tabela [GED_DOCUMENTO_CABECALHO] 
                                                                                
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

class GedDocumentoCabecalhoService extends ServiceBase
{
    public static function consultarLista()
    {
        $gerenteConexao = GerenteConexao::getInstance();
        $objetoRepository = $gerenteConexao->entityManager->getRepository('GedDocumentoCabecalho');
        return $objetoRepository->findAll();
    }

    public static function consultarListaFiltroValor($filtro)
    {
        
        $gerenteConexao = GerenteConexao::getInstance();
        $sql = "SELECT t FROM GedDocumentoCabecalho t WHERE " . $filtro->where;
        $query = $gerenteConexao->entityManager->createQuery($sql);
        
        return $query->getResult();
    }

    public static function consultarObjeto(int $id)
    {
        $gerenteConexao = GerenteConexao::getInstance();
        return $gerenteConexao->entityManager->find('GedDocumentoCabecalho', $id);
    }

    public static function salvar($objeto)
    {
        parent::salvarBase($objeto);
    }

    public static function excluir($objeto)
    {
		GedDocumentoCabecalhoService::excluirFilhos($objeto);
		parent::excluirBase($objeto);
    }

	public static function excluirFilhos($objeto)
	{
		$gerenteConexao = GerenteConexao::getInstance();
	
		$listaGedDocumentoDetalhe = $objeto->getListaGedDocumentoDetalhe();
		if ($listaGedDocumentoDetalhe != null) {
			for ($i = 0; $i < count($listaGedDocumentoDetalhe); $i++) {
				$gedDocumentoDetalhe = $listaGedDocumentoDetalhe[$i];
				$gerenteConexao->entityManager->remove($gedDocumentoDetalhe);
			}

		}

	}

    public static function atualizarDetalhe($arquivoEnviado)
    {
		$nomeArquivo = $arquivoEnviado->getClientFilename();
		$nomeArquivoMD5 = md5($nomeArquivo);
		$nomeArquivoCompleto = "C:\\T2Ti\\GED\\" . $nomeArquivoMD5 . ".jpg";
		
		if ($arquivoEnviado->getError() === UPLOAD_ERR_OK) {
			$arquivoEnviado->moveTo($nomeArquivoCompleto);
		}		
	}	
	
    // Exercício - observe o algoritmo abaixo e implemente
    /*
    01-verifique se o usuário mandou um detalhe com um cabeçalho que ainda não foi persistido
      01.1-se este for o caso, persista o cabeçalho
    02-verifique qual operação no detalhe foi solicitada pelo usuário
      02.1-se for 'gravar detalhe'
        02.1.1-verifique se é uma inserção
          02.1.1.1 - insira um novo registro em ged_documento_detalhe
          02.1.1.2 - insira um registro em ged_versao_documento com ação=I
            --- calcule o hash do arquivo e grave no campo HASH_ARQUIVO
        02.1.2-verifique se é uma alteração
          02.1.2.1 - altere o registro em ged_documento_detalhe
          02.1.2.2 - insira um registro em ged_versao_documento com ação=A
            --- calcule o hash do arquivo e grave no campo HASH_ARQUIVO
      02.2-se for 'excluir detalhe'
        02.2.1 - altere o registro em ged_documento_detalhe informando a data da exclusão
        02.2.2 - insira um registro em ged_versao_documento com ação=E
            --- calcule o hash do arquivo e grave no campo HASH_ARQUIVO
    03-verifique se o detalhe veio com o campo 'assinado="S"'
      03.1-neste caso utilize o OpenSSL para assinar o arquivo
    */
	
}