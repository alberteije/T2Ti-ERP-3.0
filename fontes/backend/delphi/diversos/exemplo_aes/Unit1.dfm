object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 291
  ClientWidth = 486
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 24
    Top = 160
    Width = 75
    Height = 25
    Caption = 'cifrar'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 24
    Top = 24
    Width = 385
    Height = 21
    TabOrder = 1
    Text = 'delphi'
  end
  object Memo1: TMemo
    Left = 24
    Top = 51
    Width = 385
    Height = 89
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
  object Button2: TButton
    Left = 334
    Top = 160
    Width = 75
    Height = 25
    Caption = 'decifrar'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Codec1: TCodec
    AsymetricKeySizeInBits = 1024
    AdvancedOptions2 = [optUseGivenIV]
    OnSetIV = Codec1SetIV
    Left = 304
    Top = 224
    StreamCipherId = ''
    BlockCipherId = ''
    ChainId = ''
  end
  object DCP_rijndael1: TDCP_rijndael
    Id = 9
    Algorithm = 'Rijndael'
    MaxKeySize = 256
    BlockSize = 128
    Left = 208
    Top = 160
  end
  object DCP_rc41: TDCP_rc4
    Id = 19
    Algorithm = 'RC4'
    MaxKeySize = 2048
    Left = 240
    Top = 224
  end
  object DCP_sha11: TDCP_sha1
    Id = 2
    Algorithm = 'SHA1'
    HashSize = 160
    Left = 400
    Top = 216
  end
  object DCP_sha2561: TDCP_sha256
    Id = 28
    Algorithm = 'SHA256'
    HashSize = 256
    Left = 136
    Top = 216
  end
  object CryptographicLibrary1: TCryptographicLibrary
    Left = 48
    Top = 232
  end
end
