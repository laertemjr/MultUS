unit uFirebirdConf;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.IniFiles, Vcl.StdCtrls;

type
  TfrmFirebirdConf = class(TForm)
    edtDatabase: TEdit;
    Label1: TLabel;
    btnProcurar: TButton;
    edtPort: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    edtServer: TEdit;
    btnSalvar: TButton;
    btnCancelar: TButton;
    OpenDialog1: TOpenDialog;
    edtUser_Name: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    edtPassword: TEdit;
    btnDefault: TButton;
    Label2: TLabel;
    edtLib: TEdit;
    btnProcurarLib: TButton;
    procedure btnProcurarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnDefaultClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnProcurarLibClick(Sender: TObject);
  private
    { Private declarations }
    iniconf : TIniFile;
    bpodeSalvar:Boolean;
    procedure leituraINI();
  public
    { Public declarations }


  end;

var
  frmFirebirdConf: TfrmFirebirdConf;

implementation

uses
   uGlobal;

{$R *.dfm}


procedure TfrmFirebirdConf.FormShow(Sender: TObject);
begin
   bAbortar := False;
   bpodeSalvar := False;
   edtDatabase.Clear;
   edtLib.Clear;
   edtPort.Clear;
   edtServer.Clear;
   edtUser_Name.Clear;
   edtPassword.Clear;
   if FileExists(ExtractFilePath(Application.ExeName) + 'config.ini') then leituraINI();
end;

procedure TfrmFirebirdConf.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   if bpodeSalvar then
   begin
    CanClose := True;
    Exit;
   end;

   if MsgPergunta('Fechar o formulário ? As alterações que não estiverem salvas serão descartadas.', False) then
   begin
      CanClose := True;
      bAbortar := True;
   end
   else CanClose := False;
end;

procedure TfrmFirebirdConf.leituraINI;
begin
   iniconf := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'config.ini');
   edtDatabase.Text  := iniconf.ReadString('Firebird', 'Database', '');
   edtPort.Text      := iniconf.ReadString('Firebird', 'Port', '');
   edtServer.Text    := iniconf.ReadString('Firebird', 'Server', '');
   edtUser_Name.Text := iniconf.ReadString('Firebird', 'User_Name', '');
   edtPassword.Text  := iniconf.ReadString('Firebird', 'Password', '');
   edtLib.Text       := iniconf.ReadString('Firebird', 'VendorLib', '');
   iniconf.Free;
end;

procedure TfrmFirebirdConf.btnProcurarClick(Sender: TObject);
begin
   OpenDialog1.FileName := EmptyStr;
   OpenDialog1.Filter := 'Firebird database (*.fdb)|*.fdb';
   OpenDialog1.InitialDir := ExtractFilePath(Application.ExeName);
   OpenDialog1.Title := 'Localize o Banco de Dados Firebird';

   if OpenDialog1.Execute then
      edtDatabase.Text := OpenDialog1.FileName
   else OpenDialog1.FileName := EmptyStr;
end;

procedure TfrmFirebirdConf.btnProcurarLibClick(Sender: TObject);
begin
   OpenDialog1.FileName := EmptyStr;
   OpenDialog1.Filter := 'Firebird database Library (*.dll)|*.dll';
   OpenDialog1.InitialDir := ExtractFilePath(Application.ExeName);
   OpenDialog1.Title := 'Localize a Biblioteca do Banco de Dados Firebird';

   if OpenDialog1.Execute then
      edtLib.Text := OpenDialog1.FileName
   else OpenDialog1.FileName := EmptyStr;
end;

procedure TfrmFirebirdConf.btnSalvarClick(Sender: TObject);
begin
   if MsgPergunta('Salvar as alterações ?') then
   begin
      iniconf := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'config.ini');
      iniconf.WriteString('Firebird', 'Database', edtDatabase.Text);
      iniconf.WriteString('Firebird', 'Port', edtPort.Text);
      iniconf.WriteString('Firebird', 'Server', edtServer.Text);
      iniconf.WriteString('Firebird', 'User_Name', edtUser_Name.Text);
      iniconf.WriteString('Firebird', 'Password', edtPassword.Text);
      iniconf.WriteString('Firebird', 'VendorLib', edtLib.Text);
      iniconf.Free;
      bpodeSalvar := True;
      Self.Close;
   end
   else Exit;
end;

procedure TfrmFirebirdConf.btnCancelarClick(Sender: TObject);
begin
   if MsgPergunta('Descartar as alterações ?', False) then leituraINI()
   else Exit;
end;

procedure TfrmFirebirdConf.btnDefaultClick(Sender: TObject);
begin
   edtPort.Text     := '3050';
   edtServer.Text := 'localhost';
   edtUser_Name.Text     := 'SYSDBA';
   edtPassword.Text    := 'masterkey';
end;

end.
