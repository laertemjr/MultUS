program MultUSsqlite;

uses
  Vcl.Forms,
  uGlobal in 'uGlobal.pas',
  uCadCli in 'uCadCli.pas' {frmCadCli},
  uCadUsers in 'uCadUsers.pas' {frmCadUsers},
  uLogin in 'uLogin.pas' {frmLogin},
  uMainMenu in 'uMainMenu.pas' {frmMainMenu},
  uDM in 'uDM.pas' {dm: TDataModule};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmCadCli, frmCadCli);
  Application.CreateForm(TfrmCadUsers, frmCadUsers);
  Application.CreateForm(TfrmMainMenu, frmMainMenu);
  Application.CreateForm(Tdm, dm);
  Application.Run;
end.
