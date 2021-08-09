program Project3;

uses
  Vcl.Forms,
  UnitSettings in 'UnitSettings.pas' {FormSettings},
  UnitAdduser in 'UnitAdduser.pas' {FormAddUser};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormSettings, FormSettings);
  Application.CreateForm(TFormAddUser, FormAddUser);
  Application.Run;
end.
