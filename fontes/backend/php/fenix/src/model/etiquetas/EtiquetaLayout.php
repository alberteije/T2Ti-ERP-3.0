<?php
/*******************************************************************************
Title: T2Ti ERP 3.0
Description: Model relacionado à tabela [ETIQUETA_LAYOUT] 
                                                                                
The MIT License                                                                 
                                                                                
Copyright: Copyright (C) 2021 T2Ti.COM                                          
                                                                                
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
declare(strict_types=1);

class EtiquetaLayout extends EloquentModel implements \JsonSerializable
{
    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'ETIQUETA_LAYOUT';

    /**
     * Eager Loading - Relacionamentos que devem ser sempre carregados por padrão
     *
     * @var array
     */
	
    /**
     * Relations
     */

    /**
     * Gets e Sets
     */
    public function getIdAttribute() 
	{
		return $this->attributes['ID'];
	}

	public function setIdAttribute($id) 
	{
		$this->attributes['ID'] = $id;
	}

    public function getIdFormatoPapelAttribute() 
	{
		return $this->attributes['ID_FORMATO_PAPEL'];
	}

	public function setIdFormatoPapelAttribute($idFormatoPapel) 
	{
		$this->attributes['ID_FORMATO_PAPEL'] = $idFormatoPapel;
	}

    public function getCodigoFabricanteAttribute() 
	{
		return $this->attributes['CODIGO_FABRICANTE'];
	}

	public function setCodigoFabricanteAttribute($codigoFabricante) 
	{
		$this->attributes['CODIGO_FABRICANTE'] = $codigoFabricante;
	}

    public function getQuantidadeAttribute() 
	{
		return $this->attributes['QUANTIDADE'];
	}

	public function setQuantidadeAttribute($quantidade) 
	{
		$this->attributes['QUANTIDADE'] = $quantidade;
	}

    public function getQuantidadeHorizontalAttribute() 
	{
		return $this->attributes['QUANTIDADE_HORIZONTAL'];
	}

	public function setQuantidadeHorizontalAttribute($quantidadeHorizontal) 
	{
		$this->attributes['QUANTIDADE_HORIZONTAL'] = $quantidadeHorizontal;
	}

    public function getQuantidadeVerticalAttribute() 
	{
		return $this->attributes['QUANTIDADE_VERTICAL'];
	}

	public function setQuantidadeVerticalAttribute($quantidadeVertical) 
	{
		$this->attributes['QUANTIDADE_VERTICAL'] = $quantidadeVertical;
	}

    public function getMargemSuperiorAttribute() 
	{
		return $this->attributes['MARGEM_SUPERIOR'];
	}

	public function setMargemSuperiorAttribute($margemSuperior) 
	{
		$this->attributes['MARGEM_SUPERIOR'] = $margemSuperior;
	}

    public function getMargemInferiorAttribute() 
	{
		return $this->attributes['MARGEM_INFERIOR'];
	}

	public function setMargemInferiorAttribute($margemInferior) 
	{
		$this->attributes['MARGEM_INFERIOR'] = $margemInferior;
	}

    public function getMargemEsquerdaAttribute() 
	{
		return $this->attributes['MARGEM_ESQUERDA'];
	}

	public function setMargemEsquerdaAttribute($margemEsquerda) 
	{
		$this->attributes['MARGEM_ESQUERDA'] = $margemEsquerda;
	}

    public function getMargemDireitaAttribute() 
	{
		return $this->attributes['MARGEM_DIREITA'];
	}

	public function setMargemDireitaAttribute($margemDireita) 
	{
		$this->attributes['MARGEM_DIREITA'] = $margemDireita;
	}

    public function getEspacamentoHorizontalAttribute() 
	{
		return $this->attributes['ESPACAMENTO_HORIZONTAL'];
	}

	public function setEspacamentoHorizontalAttribute($espacamentoHorizontal) 
	{
		$this->attributes['ESPACAMENTO_HORIZONTAL'] = $espacamentoHorizontal;
	}

    public function getEspacamentoVerticalAttribute() 
	{
		return $this->attributes['ESPACAMENTO_VERTICAL'];
	}

	public function setEspacamentoVerticalAttribute($espacamentoVertical) 
	{
		$this->attributes['ESPACAMENTO_VERTICAL'] = $espacamentoVertical;
	}


    /**
     * Mapping
     */
    public function mapear($objeto)
    {
        if (isset($objeto)) {
            isset($objeto->id) ? $this->setIdAttribute($objeto->id) : $this->setIdAttribute(null);

			$this->setIdFormatoPapelAttribute($objeto->idFormatoPapel);
			$this->setCodigoFabricanteAttribute($objeto->codigoFabricante);
			$this->setQuantidadeAttribute($objeto->quantidade);
			$this->setQuantidadeHorizontalAttribute($objeto->quantidadeHorizontal);
			$this->setQuantidadeVerticalAttribute($objeto->quantidadeVertical);
			$this->setMargemSuperiorAttribute($objeto->margemSuperior);
			$this->setMargemInferiorAttribute($objeto->margemInferior);
			$this->setMargemEsquerdaAttribute($objeto->margemEsquerda);
			$this->setMargemDireitaAttribute($objeto->margemDireita);
			$this->setEspacamentoHorizontalAttribute($objeto->espacamentoHorizontal);
			$this->setEspacamentoVerticalAttribute($objeto->espacamentoVertical);

			// vincular objetos
        }
    }

    /**
     * Serialization
     * {@inheritdoc}
     */
    public function jsonSerialize()
    {
        return [
			'id' => $this->getIdAttribute(),
			'idFormatoPapel' => $this->getIdFormatoPapelAttribute(),
			'codigoFabricante' => $this->getCodigoFabricanteAttribute(),
			'quantidade' => $this->getQuantidadeAttribute(),
			'quantidadeHorizontal' => $this->getQuantidadeHorizontalAttribute(),
			'quantidadeVertical' => $this->getQuantidadeVerticalAttribute(),
			'margemSuperior' => $this->getMargemSuperiorAttribute(),
			'margemInferior' => $this->getMargemInferiorAttribute(),
			'margemEsquerda' => $this->getMargemEsquerdaAttribute(),
			'margemDireita' => $this->getMargemDireitaAttribute(),
			'espacamentoHorizontal' => $this->getEspacamentoHorizontalAttribute(),
			'espacamentoVertical' => $this->getEspacamentoVerticalAttribute(),
        ];
    }
}