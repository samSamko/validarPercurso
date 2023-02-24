object perCUrso: TperCUrso
  Left = 0
  Top = 0
  Caption = 'perCUrso'
  ClientHeight = 107
  ClientWidth = 273
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ufIni: TEdit
    Left = 8
    Top = 6
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'RS'
  end
  object ufFim: TEdit
    Left = 144
    Top = 6
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'SP'
  end
  object ufPerc: TEdit
    Left = 8
    Top = 33
    Width = 257
    Height = 21
    TabOrder = 2
    Text = 'SC;PR'
  end
  object validarPerc: TButton
    Left = 8
    Top = 60
    Width = 82
    Height = 41
    Caption = 'Validar'
    TabOrder = 3
    OnClick = validarPercClick
  end
  object sinal: TPanel
    Left = 96
    Top = 60
    Width = 169
    Height = 41
    Color = clWhite
    ParentBackground = False
    TabOrder = 4
  end
end
