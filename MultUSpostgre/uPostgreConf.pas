unit uPostgreConf;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, System.IniFiles;

type
  TfrmPostgreConf = class(TForm)
    btnSalvar: TButton;
    btnCancelar: TButton;
    OpenDialog1: TOpenDialog;
    edtUser: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    edtPassw: TEdit;
    btnDefault: TButton;
    cbbBD: TComboBox;
    btnConectar: TButton;
    Label1: TLabel;
    Label2: TLabel;
    btnProcurar: TButton;
    edtLib: TEdit;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnDefaultClick(Sender: TObject);
    procedure btnConectarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnProcurarClick(Sender: TObject);
  private
    { Private declarations }
    iniconf : TIniFile;
    bpodeSalvar:Boolean;
    procedure leituraINI();
  public
    { Public declarations }

  end;

var
  frmPostgreConf: TfrmPostgreConf;

implementation

uses
   uGlobal, uDM;

{$R *.dfm}


procedure TfrmPostgreConf.FormShow(Sender: TObject);
begin
   bAbortar := False;
   bpodeSalvar  := False;

   edtUser.Clear;
   edtPassw.Clear;
   cbbBD.Clear;

   if FileExists(ExtractFilePath(Application.ExeName) + 'config.ini') then leituraINI()
   else btnConectar.SetFocus;
end;

procedure TfrmPostgreConf.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
   if bpodeSalvar then
   begin
      CanClose := True;
      dm.FDConnection1.Connected := False;
      Exit;
   end;

   if MsgPergunta('Fechar o formulário ? As alterações que não estiverem salvas serão descartadas.', False) then
   begin
      CanClose := True;
      bAbortar := True;
      dm.FDConnection1.Connected := False;
   end
   else CanClose := False;
end;

procedure TfrmPostgreConf.leituraINI;
begin
   cbbBD.Clear;
   iniconf := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'config.ini');
   edtLib.Text        := iniconf.ReadString('postgre', 'VendorLib', '');
   edtUser.Text       := iniconf.ReadString('postgre', 'User_Name', '');
   edtPassw.Text      := iniconf.ReadString('postgre', 'Password', '');
   cbbBD.Items.Add(iniconf.ReadString('postgre', 'Database', ''));
   cbbBD.ItemIndex := 0;
   iniconf.Free;
end;

procedure TfrmPostgreConf.btnProcurarClick(Sender: TObject);
begin
   OpenDialog1.FileName := EmptyStr;
   OpenDialog1.Filter   := 'postgreSQL server library (*.dll)|*.dll';
   if OpenDialog1.Execute then
      edtLib.Text := OpenDialog1.FileName
   else
      edtLib.Text := EmptyStr;
end;

procedure TfrmPostgreConf.btnSalvarClick(Sender: TObject);
begin
   if MsgPergunta('Salvar as alterações ?') then
   begin
      iniconf := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'config.ini');
      iniconf.WriteString('postgre', 'VendorLib', edtLib.Text);
      iniconf.WriteString('postgre', 'User_Name', edtUser.Text);
      iniconf.WriteString('postgre', 'Password', edtPassw.Text);
      iniconf.WriteString('postgre', 'Database', cbbBD.Text);
      iniconf.Free;
      bpodeSalvar := True;
      Self.Close;
   end
   else Exit;
end;

procedure TfrmPostgreConf.btnCancelarClick(Sender: TObject);
begin
   if MsgPergunta('Descartar as alterações ?', False) then leituraINI()
   else Exit;
end;

procedure TfrmPostgreConf.btnConectarClick(Sender: TObject);
var ConnData:string;
begin
   dm.FDConnection1.Params.Clear;
   dm.FDPhysPgDriverLink1.VendorLib := edtLib.Text;
   dm.FDConnection1.Params.Add('DriverID=PG');
   dm.FDConnection1.Params.Add('Server=localhost');
   dm.FDConnection1.Params.Add('User_Name=' + edtUser.Text);
   dm.FDConnection1.Params.Add('Password=' + edtPassw.Text);

   try
      dm.FDConnection1.Connected := True;
      ShowMessage('Selecione o banco de dados.');
      dm.FDQuery1.SQL.Text := 'SELECT datname FROM pg_database WHERE datistemplate = false AND datallowconn = true';
      dm.FDQuery1.Open;
      dm.FDQuery1.First;
      cbbBD.Items.Clear;
      while not dm.FDQuery1.EOF do
      begin
         cbbBD.Items.Add(dm.FDQuery1.FieldByName('datname').AsString); // 'Database' ou 'name'
         dm.FDQuery1.Next;
      end;
      dm.FDQuery1.Close;
   except
      ShowMessage('Não foi possível conectar o banco de dados.');
   end;
end;

procedure TfrmPostgreConf.btnDefaultClick(Sender: TObject);
begin
   edtUser.Text       := 'postgres';
   edtPassw.Text      := EmptyStr;
end;

end.
