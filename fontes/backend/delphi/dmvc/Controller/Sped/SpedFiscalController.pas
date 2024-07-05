{*******************************************************************************
Title: T2Ti ERP Fenix                                                                
Description: Controller relacionado ao movimento do Sped Fiscal
                                                                                
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
*******************************************************************************}
unit SpedFiscalController;

interface

uses mvcframework, mvcframework.Commons,
  MVCFramework.Serializer.Intf,
  System.SysUtils, System.Classes,
  System.Rtti,
  MVCFramework.SystemJSONUtils;

type

  [MVCDoc('Sped Fiscal')]
  [MVCPath('/sped-fiscal')]
  TSpedFiscalController = class(TMVCController)
  public
    [MVCDoc('Retorna uma lista de objetos')]
    [MVCPath('/($filtro)')]
    [MVCHTTPMethod([httpGET])]
    procedure GerarSpedFiscal(Context: TWebContext);

  end;

implementation

{ TSpedFiscalController }

uses SpedFiscalService, Commons, Filtro,

  MVCFramework.DataSet.Utils,
  MVCFramework.Serializer.Commons,
  MVCFramework.Serializer.Defaults,
  MVCFramework.Serializer.JsonDataObjects;

procedure TSpedFiscalController.GerarSpedFiscal(Context: TWebContext);
var
  FiltroUrl: string;
  ArquivoTXT: TFileStream;
begin
  FiltroUrl := Context.Request.Params['filtro'];
  try
    ArquivoTXT := TFileStream.Create(TSpedFiscalService.GerarSpedFiscal(FiltroUrl), fmOpenRead or fmShareDenyWrite);
    ContentType := 'text/plain';
    Render(ArquivoTXT, True);
  except
    on E: EServiceException do
    begin
      raise EMVCException.Create
        ('Erro no Servidor [Gerar PDF SpedFiscal] - Exceção: ' + E.Message,
        E.StackTrace, 0, 500);
    end
    else
      raise;
  end;
end;

end.
