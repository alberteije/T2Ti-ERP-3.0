<?php

/**
 * Classe transiente para realizar o cálculo de imposto da NF-e
 */
class CalculoNFe 
{
    public $crtEmissor;// emissor
    public $ufEmissor;

    public $tipoCliente;// cliente ou fornecedor
    public $ufCliente;
    public $ufClienteCod;

    public $valorBrutoProdutos;// icms
    public $valorFrete;
    public $valorSeguro;
    public $valorOutrasDespesas;
    public $valorDesconto;
    public $cstIcms;
    public $csosn;
    public $modalidadeBcIcms;
    public $baseCalculoIcms;
    public $taxaReducaoBcIcms;
    public $valorReducaoBcIcms;
    public $aliquotaIcms;
    public $aliquotaIcmsInter;
    public $valorIcms;

    public $modalidadeBcIcmsSt;// icms ST
    public $percentualMvaIcmsSt;
    public $baseCalculoIcmsSt;
    public $reducaoBcIcmsSt;
    public $valorReducaoBcIcmsSt;
    public $aliquotaIcmsSt;
    public $valorIcmsSt;

    public $aliquotaCreditoIcmsSn;// icms credito simples
    public $valorCreditoIcmsSn;

    public $cstIpi;// ipi
    public $baseCalculoIpi;
    public $aliquotaIpi;
    public $valorIpi;

    public $cstPis;// pis
    public $baseCalculoPis;
    public $aliquotaPis;
    public $aliquotaPisReais;
    public $valorPis;

    public $cstCofins;// cofins
    public $baseCalculoCofins;
    public $aliquotaCofins;
    public $aliquotaCofinsReais;
    public $valorCofins;

}