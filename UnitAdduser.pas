unit UnitAdduser;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask,UnitSettings,
  Data.DB, mySQLDbTables;

type
  TFormAddUser = class(TForm)
    LabelLogin: TLabel;
    LabelPass: TLabel;
    LabelPass1: TLabel;
    LabelName: TLabel;
    GroupBox: TGroupBox;
    EditLogin: TEdit;
    EditName: TEdit;
    MaskEditPass: TMaskEdit;
    MaskEditPass1: TMaskEdit;
    ButtonCreate: TButton;
    MySQLQueryUser: TMySQLQuery;
    procedure AddUser();
    procedure AddUserCategory();
    procedure AddUserModule();
    procedure FormCreate(Sender: TObject);
    procedure EditLoginKeyPress(Sender: TObject; var Key: Char);
    procedure EditNameKeyPress(Sender: TObject; var Key: Char);
    procedure MaskEditPassKeyPress(Sender: TObject; var Key: Char);
    procedure MaskEditPass1KeyPress(Sender: TObject; var Key: Char);
    procedure ButtonCreateClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAddUser: TFormAddUser;
  UserID : String;
  CompanyID : String;

implementation

{$R *.dfm}

procedure TFormAddUser.EditLoginKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key=#13) then
    EditName.SetFocus;
end;

procedure TFormAddUser.EditNameKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key=#13) then
    MaskEditPass.SetFocus;
end;

procedure TFormAddUser.FormCreate(Sender: TObject);
begin
    LabelPass1.Caption := 'Подтверждение'+#13#10+'         пароля';
    CompanyID := '1';

end;

procedure TFormAddUser.MaskEditPass1KeyPress(Sender: TObject; var Key: Char);
begin
 if (Key=#13) then
    ButtonCreate.SetFocus;
end;

procedure TFormAddUser.MaskEditPassKeyPress(Sender: TObject; var Key: Char);
begin
 if (Key=#13) then
    MaskEditPass1.SetFocus;
end;

procedure TFormAddUser.AddUser();
var Login,Name,Pass : String;
begin
     if MaskEditPass.Text = MaskEditPass1.Text then
     begin
     Login := EditLogin.Text;
     Name := EditName.Text;
     Pass := MaskEditPass.Text;
     end else begin
       showmessage('Пароль не совпадает');
       MaskEditPass.SetFocus;
       exit;
     end;

     MySQLQueryUser.SQL.Text := ' INSERT INTO `ListUser` '+
     ' (`idUser`, `userLogin`, `userPass`, `CompanyID`, `userName`, `userVisible`) VALUES '+
     ' (NULL, '''+Login+''', '''+Pass+''','''+CompanyID+''', '''+Name+''', 1)'+
     '; SELECT LAST_INSERT_ID()';
     MySQLQueryUser.Active := true;


      UserID := MySQLQueryUser.Fields[0].AsString;

      AddUserCategory();
end;

procedure TFormAddUser.AddUserCategory();
var SQL,CategoryID : String;
begin

     MySQLQueryUser.SQL.Text := ' SELECT ListCMID FROM ListCategoryModule '+
     ' WHERE Visible = 1';
     MySQLQueryUser.Active := true;


     SQL := SQL + ' INSERT INTO `ListLinkingUserCategory` '+
     '(`ListUserCatID`, `CatModuleID`, `userID`, `visible`, `CompanyID`) VALUES ';
     while not MySQLQueryUser.Eof do
     begin

     CategoryID:= MySQLQueryUser.Fields[0].AsString;
     SQL := SQL +  '(NULL, '+CategoryID+', '+UserID+', 1, '+CompanyID+'), ';
     MySQLQueryUser.Next;

     end;

     Delete(SQL, Length(SQL)-1, 1);

     MySQLQueryUser.SQL.Text := SQL;
     MySQLQueryUser.ExecSQL;

     AddUserModule();

end;


procedure TFormAddUser.ButtonCreateClick(Sender: TObject);
begin
    AddUser();
    FormAddUser.Close;
    FormSettings.ListBoxAllView;
end;


procedure TFormAddUser.AddUserModule();
var SQL,ModuleID : String;
begin

     MySQLQueryUser.SQL.Text := ' SELECT ListModuleID FROM ListModule '+
     ' WHERE Visible = 1';
     MySQLQueryUser.Active := true;


     SQL := SQL + 'INSERT INTO `ListUserModule` '+
     '(`ListUSID`, `userID`, `moduleID`, `Visible`, `CompanyID`) VALUES';
     while not MySQLQueryUser.Eof do
     begin

     ModuleID:= MySQLQueryUser.Fields[0].AsString;
     SQL := SQL +  '(NULL, '+UserID+', '+ModuleID+', 0, '+CompanyID+'), ';
     MySQLQueryUser.Next;

     end;

     Delete(SQL, Length(SQL)-1, 1);

     MySQLQueryUser.SQL.Text := SQL;
     MySQLQueryUser.ExecSQL;


end;

end.
