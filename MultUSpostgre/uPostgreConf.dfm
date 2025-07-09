object frmPostgreConf: TfrmPostgreConf
  Left = 0
  Top = 0
  Caption = 'Configura'#231#227'o do Servidor postgreSQL Server'
  ClientHeight = 284
  ClientWidth = 427
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  TextHeight = 15
  object Label5: TLabel
    Left = 8
    Top = 86
    Width = 63
    Height = 15
    Caption = 'Username :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 8
    Top = 115
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
  object Label1: TLabel
    Left = 8
    Top = 179
    Width = 161
    Height = 15
    Caption = 'Selecione o Banco de Dados :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 8
    Width = 211
    Height = 15
    Caption = 'Selecione a biblioteca do postgreSQL :'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnSalvar: TButton
    Left = 8
    Top = 251
    Width = 75
    Height = 25
    Caption = '&Salvar'
    TabOrder = 4
    OnClick = btnSalvarClick
  end
  object btnCancelar: TButton
    Left = 97
    Top = 251
    Width = 75
    Height = 25
    Caption = '&Cancelar'
    TabOrder = 5
    OnClick = btnCancelarClick
  end
  object edtUser: TEdit
    Left = 77
    Top = 78
    Width = 92
    Height = 23
    Hint = 'Default: SYSDBA'
    Alignment = taCenter
    MaxLength = 4
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object edtPassw: TEdit
    Left = 77
    Top = 107
    Width = 92
    Height = 23
    Hint = 'Default: masterkey'
    Alignment = taCenter
    ParentShowHint = False
    PasswordChar = '*'
    ShowHint = True
    TabOrder = 1
  end
  object btnDefault: TButton
    Left = 185
    Top = 251
    Width = 75
    Height = 25
    Caption = '&Default'
    TabOrder = 6
    OnClick = btnDefaultClick
  end
  object cbbBD: TComboBox
    Left = 8
    Top = 200
    Width = 161
    Height = 23
    Style = csDropDownList
    TabOrder = 3
  end
  object btnConectar: TButton
    Left = 8
    Top = 136
    Width = 75
    Height = 25
    Caption = '&Conectar'
    TabOrder = 2
    OnClick = btnConectarClick
  end
  object btnProcurar: TButton
    Left = 8
    Top = 29
    Width = 75
    Height = 25
    Caption = '&Procurar'
    TabOrder = 7
    OnClick = btnProcurarClick
  end
  object edtLib: TEdit
    Left = 89
    Top = 29
    Width = 330
    Height = 23
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
  end
  object OpenDialog1: TOpenDialog
    Left = 360
    Top = 208
  end
end
