object FWebModule: TFWebModule
  OnCreate = WebModuleCreate
  Actions = <
    item
      Default = True
      Name = 'DefaultHandler'
      PathInfo = '/'
    end>
  Height = 345
  Width = 623
  PixelsPerInch = 144
end
