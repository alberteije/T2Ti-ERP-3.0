object FDataModule: TFDataModule
  OldCreateOrder = False
  Height = 189
  Width = 276
  object ACBrSPEDContabil: TACBrSPEDContabil
    Path = 'C:\Program Files (x86)\Embarcadero\Studio\20.0\bin\'
    Delimitador = '|'
    ReplaceDelimitador = False
    TrimString = True
    CurMascara = '#0.00'
    Left = 80
    Top = 24
  end
  object ACBrSPEDFiscal: TACBrSPEDFiscal
    Path = 'C:\Program Files (x86)\Embarcadero\Studio\20.0\bin\'
    Delimitador = '|'
    ReplaceDelimitador = False
    TrimString = True
    CurMascara = '#0.00'
    Left = 120
    Top = 80
  end
end
