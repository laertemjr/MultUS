object frmFirebirdConf: TfrmFirebirdConf
  Left = 0
  Top = 0
  Caption = 'Configura'#231#227'o do Servidor Firebird'
  ClientHeight = 419
  ClientWidth = 599
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  TextHeight = 15
  object Label1: TLabel
    Left = 8
    Top = 11
    Width = 208
    Height = 15
    Caption = 'Caminho do Banco de Dados Firebird :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 203
    Width = 30
    Height = 15
    Caption = 'Port :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 243
    Width = 44
    Height = 15
    Caption = 'Server :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 8
    Top = 283
    Width = 70
    Height = 15
    Caption = 'User_Name :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 8
    Top = 323
    Width = 58
    Height = 15
    Caption = 'Password :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 107
    Width = 282
    Height = 15
    Caption = 'Caminho da Biblioteca do Banco de Dados Firebird :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtDatabase: TEdit
    Left = 8
    Top = 32
    Width = 577
    Height = 23
    TabStop = False
    ReadOnly = True
    TabOrder = 7
  end
  object btnProcurar: TButton
    Left = 8
    Top = 61
    Width = 75
    Height = 25
    Caption = '&Procurar'
    TabOrder = 0
    OnClick = btnProcurarClick
  end
  object edtPort: TEdit
    Left = 77
    Top = 200
    Width = 92
    Height = 23
    Hint = 'Default: 3050'
    Alignment = taCenter
    MaxLength = 4
    NumbersOnly = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
  end
  object edtServer: TEdit
    Left = 77
    Top = 240
    Width = 92
    Height = 23
    Hint = 'Default: localhost'
    Alignment = taCenter
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object btnSalvar: TButton
    Left = 8
    Top = 368
    Width = 75
    Height = 25
    Caption = '&Salvar'
    TabOrder = 5
    OnClick = btnSalvarClick
  end
  object btnCancelar: TButton
    Left = 94
    Top = 368
    Width = 75
    Height = 25
    Caption = '&Cancelar'
    TabOrder = 6
    OnClick = btnCancelarClick
  end
  object edtUser_Name: TEdit
    Left = 77
    Top = 280
    Width = 92
    Height = 23
    Hint = 'Default: SYSDBA'
    Alignment = taCenter
    MaxLength = 4
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
  end
  object edtPassword: TEdit
    Left = 77
    Top = 320
    Width = 92
    Height = 23
    Hint = 'Default: masterkey'
    Alignment = taCenter
    ParentShowHint = False
    PasswordChar = '*'
    ShowHint = True
    TabOrder = 4
  end
  object btnDefault: TButton
    Left = 182
    Top = 368
    Width = 75
    Height = 25
    Caption = '&Default'
    TabOrder = 8
    OnClick = btnDefaultClick
  end
  object edtLib: TEdit
    Left = 8
    Top = 128
    Width = 577
    Height = 23
    TabStop = False
    ReadOnly = True
    TabOrder = 9
  end
  object btnProcurarLib: TButton
    Left = 8
    Top = 157
    Width = 75
    Height = 25
    Caption = '&Procurar'
    TabOrder = 10
    OnClick = btnProcurarLibClick
  end
  object OpenDialog1: TOpenDialog
    Left = 456
    Top = 224
  end
end
