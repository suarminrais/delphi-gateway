object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 398
  ClientWidth = 555
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 253
    Top = 32
    Width = 185
    Height = 89
    Lines.Strings = (
      'Kotak Keluar')
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 32
    Top = 32
    Width = 185
    Height = 245
    TabOrder = 1
    object Label1: TLabel
      Left = 184
      Top = 104
      Width = 31
      Height = 13
      Caption = 'Label1'
    end
    object Label2: TLabel
      Left = 56
      Top = 37
      Width = 67
      Height = 13
      Caption = 'Nomor Tujuan'
    end
    object Label3: TLabel
      Left = 80
      Top = 77
      Width = 11
      Height = 13
      Caption = 'Isi'
    end
    object Button1: TButton
      Left = 48
      Top = 204
      Width = 75
      Height = 25
      Caption = 'Kirim'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Edit1: TEdit
      Left = 32
      Top = 56
      Width = 121
      Height = 21
      TabOrder = 1
    end
    object Memo2: TMemo
      Left = 32
      Top = 96
      Width = 121
      Height = 89
      TabOrder = 2
    end
  end
end
