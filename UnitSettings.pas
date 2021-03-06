unit UnitSettings;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Menus, Vcl.ComCtrls, mySQLDbTables;

type
  TFormSettings = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    PopupMenuCategory: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    ScrollBoxSettings: TScrollBox;
    GroupBox4: TGroupBox;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBLookupListBoxCategory: TDBLookupListBox;
    Button1: TButton;
    DBLookupListBoxModuleAdded: TDBLookupListBox;
    DBLookupListBoxModuleNotAdded: TDBLookupListBox;
    DBGridUsers: TDBGrid;
    ButtonAddUser: TButton;
    Label4: TLabel;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBLookupListBoxUsersModule: TDBLookupListBox;
    DBLookupListBoxUsersAddedModule: TDBLookupListBox;
    DBLookupListBoxUsersNotAddedModule: TDBLookupListBox;
    GroupBox3: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DBLookupListBoxUsers: TDBLookupListBox;
    DBLookupListBoxCategoryAdded: TDBLookupListBox;
    DBLookupListBoxCategoryNotAdded: TDBLookupListBox;
    MySQLDatabaseSettings: TMySQLDatabase;
    PopupMenuUsers: TPopupMenu;
    N3: TMenuItem;
    DataSourceCategory: TDataSource;
    DataSourceCategory0: TDataSource;
    DataSourceCategory1: TDataSource;
    DataSourceDBGrid: TDataSource;
    DataSourceModule0: TDataSource;
    DataSourceModule1: TDataSource;
    DataSourceUsers: TDataSource;
    DataSourceUsersModule: TDataSource;
    DataSourceUsersModule0: TDataSource;
    DataSourceUsersModule1: TDataSource;
    MySQLQueryCategory: TMySQLQuery;
    MySQLQueryCategory0: TMySQLQuery;
    MySQLQueryCategory1: TMySQLQuery;
    MySQLQueryDBGrid: TMySQLQuery;
    MySQLQueryModule0: TMySQLQuery;
    MySQLQueryModule1: TMySQLQuery;
    MySQLQueryUsers: TMySQLQuery;
    MySQLQueryUsersModule: TMySQLQuery;
    MySQLQueryUsersModule0: TMySQLQuery;
    MySQLQueryUsersModule1: TMySQLQuery;
    MySQLQueryUpdate: TMySQLQuery;
    procedure DBGridUsersView();
    procedure UsersView();
    procedure UsersModuleView();
    procedure CategoryView();
    procedure NewCategory();
    procedure AddedCategoryView();
    procedure NotAddedCategoryView();
    procedure AddedModuleView();
    procedure NotAddedModuleView();
    procedure AddCategoryToNoAdded();
    procedure AddCategoryToAdded();
    procedure AddModuleToNoAdded();
    procedure AddModuleToAdded();
    procedure AddUserModuleToNoAdded();
    procedure AddUserModuleToAdded();
    procedure AddedUsersModuleView();
    procedure NotAddedUsersModuleView();
    procedure ListBoxAllView();
    procedure AddCategoryUser(CategoryID : String);
    procedure DBLookupListBoxUsersClick(Sender: TObject);
    procedure DBLookupListBoxCategoryAddedDblClick(Sender: TObject);
    procedure DBLookupListBoxCategoryNotAddedDblClick(Sender: TObject);
    procedure DBLookupListBoxCategoryClick(Sender: TObject);
    procedure DBLookupListBoxModuleAddedDblClick(Sender: TObject);
    procedure DBLookupListBoxModuleNotAddedDblClick(Sender: TObject);
    procedure DBLookupListBoxUsersModuleClick(Sender: TObject);
    procedure DBLookupListBoxUsersNotAddedModuleDblClick(Sender: TObject);
    procedure DBLookupListBoxUsersAddedModuleDblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure ButtonAddUserClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGridUsersDblClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure ScrollBoxSettingsMouseWheelDown(Sender: TObject;
      Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
    procedure ScrollBoxSettingsMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSettings: TFormSettings;
  CompanyID : String;

implementation

{$R *.dfm}

uses UnitAdduser;

procedure TFormSettings.ListBoxAllView();
begin

  ScrollBoxSettings.AutoScroll := true;

  CompanyID := '1';

  DBGridUsersView();

  UsersView();

  CategoryView();

  UsersModuleView();




end;

procedure TFormSettings.DBGridUsersDblClick(Sender: TObject);
var
i :integer; strUpdate,idUser : String;
begin
i := DBGridUsers.SelectedIndex;

 if i = 1 then
   begin
     strUpdate := DBGridUsers.DataSource.DataSet.Fields[i].Value;
     idUser := DBGridUsers.DataSource.DataSet.Fields[0].Value;
     if not InputQuery('???? ??????','??????? ?????', strUpdate)
      then exit;
       MySQLQueryDBGrid.SQL.Text := 'UPDATE `ListUser` SET '+
       ' `userLogin` = '''+strUpdate+''' WHERE `ListUser`.`idUser` = '''+idUser+''' ';
       MySQLQueryDBGrid.ExecSQL;

   end;

 if i = 2 then
   begin
     strUpdate := DBGridUsers.DataSource.DataSet.Fields[i].Value;
     idUser := DBGridUsers.DataSource.DataSet.Fields[0].Value;
     if not InputQuery('???? ??????','??????? ???', strUpdate)
      then exit;
       MySQLQueryDBGrid.SQL.Text := 'UPDATE `ListUser` SET '+
       ' `userName` = '''+strUpdate+''' WHERE `ListUser`.`idUser` = '''+idUser+''' ';
       MySQLQueryDBGrid.ExecSQL;
   end;

   if (i = 1) or (i = 2) then
   begin
       DBGridUsersView();
       UsersView();
       UsersModuleView();
   end;






end;

procedure TFormSettings.DBGridUsersView();
begin

     MySQLQueryDBGrid.SQL.Text := 'SELECT idUser,UserLogin, UserName FROM ListUser '+
     'WHERE CompanyID = '''+CompanyID+''' AND userVisible = 1';
     MySQLQueryDBGrid.Active := true;

     DataSourceDBGrid.DataSet := MySQLQueryDBGrid;
     DBGridUsers.DataSource := DataSourceDBGrid;

     DBGridUsers.Columns[0].Title.caption:='ID';
     DBGridUsers.Columns[1].Title.caption:='????? ????????????';
     DBGridUsers.Columns[2].Title.caption:='??? ????????????';


end;

procedure TFormSettings.DBLookupListBoxCategoryAddedDblClick(Sender: TObject);
begin
  if DBLookupListBoxCategoryAdded.SelectedItem <> '' then
  begin
    AddCategoryToNoAdded();
    NotAddedUsersModuleView();
  end;
end;

procedure TFormSettings.DBLookupListBoxCategoryClick(Sender: TObject);
begin
  if DBLookupListBoxCategory.SelectedItem <> '' then
    begin
    AddedModuleView();
    NotAddedModuleView();
    end;

end;

procedure TFormSettings.DBLookupListBoxCategoryNotAddedDblClick(
  Sender: TObject);
begin
  if DBLookupListBoxCategoryNotAdded.SelectedItem <> '' then
    AddCategoryToAdded();
end;

procedure TFormSettings.DBLookupListBoxModuleAddedDblClick(Sender: TObject);
begin
  if DBLookupListBoxModuleAdded.SelectedItem <> '' then
    AddModuleToNoAdded();
end;

procedure TFormSettings.DBLookupListBoxModuleNotAddedDblClick(Sender: TObject);
begin
  if DBLookupListBoxModuleNotAdded.SelectedItem <> '' then
    AddModuleToAdded();
end;

procedure TFormSettings.DBLookupListBoxUsersAddedModuleDblClick(
  Sender: TObject);
begin
  if DBLookupListBoxUsersAddedModule.SelectedItem <> '' then
    AddUserModuleToNoAdded();
end;

procedure TFormSettings.DBLookupListBoxUsersClick(Sender: TObject);
begin
    if DBLookupListBoxUsers.SelectedItem <> '' then
      begin
      AddedCategoryView();
      NotAddedCategoryView();
      end;
end;

procedure TFormSettings.DBLookupListBoxUsersModuleClick(Sender: TObject);
begin
  if DBLookupListBoxUsersModule.SelectedItem <> '' then
  begin
    AddedUsersModuleView();
    NotAddedUsersModuleView();
  end;
end;

procedure TFormSettings.DBLookupListBoxUsersNotAddedModuleDblClick(
  Sender: TObject);
begin
  if DBLookupListBoxUsersNotAddedModule.SelectedItem <> '' then
     AddUserModuleToAdded();
end;

procedure TFormSettings.FormCreate(Sender: TObject);
begin
    ListBoxAllView();
    ScrollBoxSettings.AutoScroll := true;

end;

procedure TFormSettings.UsersView();
begin

     MySQLQueryUsers.SQL.Text := 'SELECT idUser,userName FROM ListUser '+
     ' WHERE CompanyID = '''+CompanyID+''' AND userVisible = 1 GROUP BY idUser';
     MySQLQueryUsers.Active := true;

     DataSourceUsers.DataSet := MySQLQueryUsers;
     DBLookupListBoxUsers.ListSource := DataSourceUsers;
     DBLookupListBoxUsers.KeyField := 'idUser';
     DBLookupListBoxUsers.ListField := 'userName';

     DBLookupListBoxUsers.KeyValue := 1;

     AddedCategoryView();
     NotAddedCategoryView();

end;

procedure TFormSettings.AddedCategoryView();
var idUser : string;
begin

     idUser := DBLookupListBoxUsers.KeyValue;

     MySQLQueryCategory1.SQL.Text := 'SELECT ListUserCatID,NameCategory FROM '+
     ' ListLinkingUserCategory INNER JOIN ListCategoryModule ON CatModuleID = ListCMID '+
     ' INNER JOIN ListUser ON userID = idUser WHERE idUser = '''+idUser+''' '+
     ' AND ListLinkingUserCategory.visible = 1'+
     ' AND ListLinkingUserCategory.CompanyID = '''+CompanyID+''' ';
     MySQLQueryCategory1.Active := true;

     DataSourceCategory1.DataSet := MySQLQueryCategory1;
     DBLookupListBoxCategoryAdded.ListSource := DataSourceCategory1;
     DBLookupListBoxCategoryAdded.KeyField := 'ListUserCatID';
     DBLookupListBoxCategoryAdded.ListField := 'NameCategory';

end;

procedure TFormSettings.NotAddedCategoryView();
var idUser : string;
begin

     idUser := DBLookupListBoxUsers.KeyValue;

     MySQLQueryCategory0.SQL.Text := 'SELECT ListUserCatID,NameCategory FROM '+
     ' ListLinkingUserCategory INNER JOIN ListCategoryModule ON CatModuleID = ListCMID '+
     ' INNER JOIN ListUser ON userID = idUser WHERE idUser = '''+idUser+''' '+
     ' AND ListLinkingUserCategory.visible = 0'+
     ' AND ListLinkingUserCategory.CompanyID = '''+CompanyID+''' ';
     MySQLQueryCategory0.Active := true;

     DataSourceCategory0.DataSet := MySQLQueryCategory0;
     DBLookupListBoxCategoryNotAdded.ListSource := DataSourceCategory0;
     DBLookupListBoxCategoryNotAdded.KeyField := 'ListUserCatID';
     DBLookupListBoxCategoryNotAdded.ListField := 'NameCategory';

end;

procedure TFormSettings.AddCategoryToNoAdded();
var ListUserCatID : String;
begin

     ListUserCatID := DBLookupListBoxCategoryAdded.KeyValue;

     MySQLQueryUpdate.SQL.Text := 'UPDATE ListLinkingUserCategory SET '+
     ' ListLinkingUserCategory.visible = 0 '+
     ' WHERE ListUserCatID = '''+ListUserCatID+''' ';
     MySQLQueryUpdate.ExecSQL;

     NotAddedCategoryView();
     AddedCategoryView();
     NotAddedUsersModuleView();

end;

procedure TFormSettings.AddCategoryToAdded();
var ListUserCatID : String;
begin

     ListUserCatID := DBLookupListBoxCategoryNotAdded.KeyValue;

     MySQLQueryUpdate.SQL.Text := 'UPDATE ListLinkingUserCategory SET '+
     ' ListLinkingUserCategory.visible = 1 '+
     ' WHERE ListUserCatID = '''+ListUserCatID+''' ';
     MySQLQueryUpdate.ExecSQL;

     NotAddedCategoryView();
     AddedCategoryView();
     NotAddedUsersModuleView();

end;


procedure TFormSettings.CategoryView();
begin

     MySQLQueryCategory.SQL.Text := 'SELECT ListCMID,NameCategory FROM ListCategoryModule'+
     ' WHERE Visible = 1 '+
     ' AND ListCategoryModule.CompanyID = '''+CompanyID+''' ';
     MySQLQueryCategory.Active := true;

     DataSourceCategory.DataSet := MySQLQueryCategory;
     DBLookupListBoxCategory.ListSource := DataSourceCategory;
     DBLookupListBoxCategory.KeyField := 'ListCMID';
     DBLookupListBoxCategory.ListField := 'NameCategory';

     DBLookupListBoxCategory.KeyValue := 1;

     AddedModuleView();
     NotAddedModuleView();

end;

procedure TFormSettings.AddedModuleView();
var ListCMID : string;
begin

     ListCMID := DBLookupListBoxCategory.KeyValue;

     MySQLQueryModule1.SQL.Text := 'SELECT ListModCatID,NameModule FROM '+
     ' ListLinkingModulesCategories INNER JOIN ListModule ON moduleID = ListModuleID '+
     ' INNER JOIN ListCategoryModule ON categoryID = ListCMID WHERE categoryID = '+
     ' '''+ListCMID+''' AND ListLinkingModulesCategories.visible = 1 AND '+
     ' ListLinkingModulesCategories.CompanyID = '''+CompanyID+''' ';
     MySQLQueryModule1.Active := true;

     DataSourceModule1.DataSet := MySQLQueryModule1;
     DBLookupListBoxModuleAdded.ListSource := DataSourceModule1;
     DBLookupListBoxModuleAdded.KeyField := 'ListModCatID';
     DBLookupListBoxModuleAdded.ListField := 'NameModule';

end;

procedure TFormSettings.NotAddedModuleView();
var ListCMID : string;
begin

     ListCMID := DBLookupListBoxCategory.KeyValue;

     MySQLQueryModule0.SQL.Text := 'SELECT ListModCatID,NameModule FROM '+
     ' ListLinkingModulesCategories INNER JOIN ListModule ON moduleID = ListModuleID '+
     ' INNER JOIN ListCategoryModule ON categoryID = ListCMID WHERE categoryID = '+
     ' '''+ListCMID+''' AND ListLinkingModulesCategories.visible = 0 AND '+
     ' ListLinkingModulesCategories.CompanyID = '''+CompanyID+''' ';
     MySQLQueryModule0.Active := true;

     DataSourceModule0.DataSet := MySQLQueryModule0;
     DBLookupListBoxModuleNotAdded.ListSource := DataSourceModule0;
     DBLookupListBoxModuleNotAdded.KeyField := 'ListModCatID';
     DBLookupListBoxModuleNotAdded.ListField := 'NameModule';

end;

procedure TFormSettings.AddModuleToNoAdded();
var ListModCatID : string;
begin

     ListModCatID := DBLookupListBoxModuleAdded.KeyValue;

     MySQLQueryUpdate.SQL.Text := 'UPDATE ListLinkingModulesCategories SET '+
     ' ListLinkingModulesCategories.visible = 0 '+
     ' WHERE ListModCatID = '''+ListModCatID+''' ';
      MySQLQueryUpdate.ExecSQL;

     AddedModuleView();
     NotAddedModuleView();
     NotAddedUsersModuleView();

end;

procedure TFormSettings.AddModuleToAdded();
var ListModCatID : string;
begin

     ListModCatID := DBLookupListBoxModuleNotAdded.KeyValue;

     MySQLQueryUpdate.SQL.Text := 'UPDATE ListLinkingModulesCategories SET visible = 1 '+
     ' WHERE ListModCatID = '''+ListModCatID+''' ';
      MySQLQueryUpdate.ExecSQL;

     AddedModuleView();
     NotAddedModuleView();
     NotAddedUsersModuleView();

end;

procedure TFormSettings.UsersModuleView();
begin

     MySQLQueryUsersModule.SQL.Text := 'SELECT idUser,userName FROM ListUser WHERE '+
     ' CompanyID = '''+CompanyID+''' AND userVisible = 1 GROUP BY idUser';
     MySQLQueryUsersModule.Active := true;

     DataSourceUsersModule.DataSet := MySQLQueryUsersModule;
     DBLookupListBoxUsersModule.ListSource := DataSourceUsersModule;
     DBLookupListBoxUsersModule.KeyField := 'idUser';
     DBLookupListBoxUsersModule.ListField := 'userName';

     DBLookupListBoxUsersModule.KeyValue := 1;

     AddedUsersModuleView();
     NotAddedUsersModuleView();
end;

procedure TFormSettings.AddedUsersModuleView();
var userID : string;
begin

     userID := DBLookupListBoxUsersModule.KeyValue;

     MySQLQueryUsersModule1.SQL.Text := 'SELECT ListUSID,NameModule FROM ListUserModule '+
     ' INNER JOIN ListModule ON moduleID = ListModuleID '+
     ' INNER JOIN ListUser ON userID = idUser WHERE '+
     ' userID = '''+userID+''' AND  ListUserModule.Visible = 1 AND '+
     ' ListUserModule.CompanyID = '''+CompanyID+''' ';
     MySQLQueryUsersModule1.Active := true;

     DataSourceUsersModule1.DataSet := MySQLQueryUsersModule1;
     DBLookupListBoxUsersAddedModule.ListSource := DataSourceUsersModule1;
     DBLookupListBoxUsersAddedModule.KeyField := 'ListUSID';
     DBLookupListBoxUsersAddedModule.ListField := 'NameModule';
end;

procedure TFormSettings.NotAddedUsersModuleView();
var userID,SQLText : string;
begin

     userID := DBLookupListBoxUsersModule.KeyValue;

     MySQLQueryUpdate.SQL.Text := 'SELECT moduleID,NameModule FROM '+
     ' ListLinkingUserCategory INNER JOIN ListUser ON userID = idUser '+
     ' INNER JOIN ListLinkingModulesCategories ON CatModuleID = CategoryID '+
     ' INNER JOIN ListModule ON ListModuleID = moduleID '+
     ' WHERE userID = '''+userID+''' AND ListLinkingUserCategory.visible = 1'+
     ' AND ListLinkingModulesCategories.Visible = 1  NOT IN ( SELECT moduleID FROM '+
     ' ListUserModule WHERE userID = '''+userID+''' AND CompanyID = '''+CompanyID+''' '+
     ' AND Visible = 1 ) ORDER BY moduleID';
     MySQLQueryUpdate.Active := true;


     while not MySQLQueryUpdate.Eof do
      begin
      SQLText := SQLText + ' AND ListModuleID <> '+ MySQLQueryUpdate.Fields[0].AsString;
      MySQLQueryUpdate.Next;
      end;


     MySQLQueryUsersModule0.SQL.Text := 'SELECT ListModuleID,NameModule FROM ListModule'+
     ' WHERE Visible = 1 '+SQLText+' ';
     MySQLQueryUsersModule0.Active := true;


     DataSourceUsersModule0.DataSet := MySQLQueryUsersModule0;
     DBLookupListBoxUsersNotAddedModule.ListSource := DataSourceUsersModule0;
     DBLookupListBoxUsersNotAddedModule.KeyField := 'ListModuleID';
     DBLookupListBoxUsersNotAddedModule.ListField := 'NameModule';

end;

procedure TFormSettings.ScrollBoxSettingsMouseWheelDown(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
    ScrollBoxSettings.VertScrollBar.Position:= ScrollBoxSettings.VertScrollBar.Position + 16;
end;

procedure TFormSettings.ScrollBoxSettingsMouseWheelUp(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
    ScrollBoxSettings.VertScrollBar.Position:= ScrollBoxSettings.VertScrollBar.Position - 16;
end;

procedure TFormSettings.AddUserModuleToNoAdded();
var ListUSID : string;
begin

     ListUSID := DBLookupListBoxUsersAddedModule.KeyValue;

     MySQLQueryUpdate.SQL.Text := 'UPDATE ListUserModule SET visible = 0 '+
     ' WHERE ListUSID = '''+ListUSID+''' ';
      MySQLQueryUpdate.ExecSQL;

     AddedUsersModuleView();
     NotAddedUsersModuleView();
end;

procedure TFormSettings.Button1Click(Sender: TObject);
begin
    NewCategory();
end;

procedure TFormSettings.ButtonAddUserClick(Sender: TObject);
begin
    FormAddUser.showmodal;
end;

procedure TFormSettings.AddUserModuleToAdded();
var ModuleID,UserID : string;
begin

     ModuleID := DBLookupListBoxUsersNotAddedModule.KeyValue;
     UserID := DBLookupListBoxUsersModule.KeyValue;

     MySQLQueryUpdate.SQL.Text := 'INSERT INTO `ListUserModule` '+
     ' (`ListUSID`, `userID`, `moduleID`, `Visible`, `CompanyID`) VALUES '+
     ' (NULL, '''+UserID+''', '''+ModuleID+''', 1, '''+CompanyID+''')';
     MySQLQueryUpdate.ExecSQL;

     AddedUsersModuleView();
     NotAddedUsersModuleView();
end;

procedure TFormSettings.N1Click(Sender: TObject);
var CategoryID,NameCategory : String;
begin

    CategoryID := DBLookupListBoxCategory.KeyValue;
    NameCategory := DBLookupListBoxCategory.SelectedItem;
    if not InputQuery('???? ??????','??????? ???????? ?????????', NameCategory)
    then exit;

    MySQLQueryUpdate.SQL.Text := ' UPDATE `ListCategoryModule` SET ' +
    ' `NameCategory` = '''+NameCategory+''' WHERE `ListCategoryModule`.`ListCMID` = '+
    ' '''+CategoryID+''' ';
    MySQLQueryUpdate.ExecSQL;

    CategoryView();

end;

procedure TFormSettings.N2Click(Sender: TObject);
var CategoryID,CategoryName,str: String;
   WND:HWND;
   Tip:integer;
begin
   WND:=FormSettings.Handle;
   Tip:=MB_YESNO+MB_ICONINFORMATION+MB_DEFBUTTON1;
   CategoryName := DBLookupListBoxCategory.SelectedItem;
   str := '?? ????????????? ?????? ??????? ????????? "'+CategoryName+'"?';
   case MessageBox(Wnd,Pchar(str),'???? ??????????????',Tip) of
     IDYES:
    begin
     CategoryID := DBLookupListBoxCategory.KeyValue;

      MySQLQueryUpdate.SQL.Text := ' UPDATE `ListCategoryModule` SET `Visible` = 0 ' +
     ' WHERE `ListCategoryModule`.`ListCMID` = '''+CategoryID+''' ';
      MySQLQueryUpdate.ExecSQL;

     CategoryView();
    end;
   end;


end;

procedure TFormSettings.N3Click(Sender: TObject);
var User,str : String;
   WND:HWND;
   Tip:integer;
begin
   WND:=FormSettings.Handle;
   Tip:=MB_YESNO+MB_ICONINFORMATION+MB_DEFBUTTON1;
   User := DBGridUsers.DataSource.DataSet.Fields[1].Value;
   str := '?? ????????????? ?????? ??????? ???????????? "'+User+'"?';
   case MessageBox(Wnd,Pchar(str),'???? ??????????????',Tip) of
     IDYES:
     begin
      User := DBGridUsers.DataSource.DataSet.Fields[0].Value;
      MySQLQueryUpdate.SQL.Text := 'UPDATE `ListUser` SET `userVisible` = 0 '+
      ' WHERE `ListUser`.`idUser` = '''+User+''' ';
      MySQLQueryUpdate.ExecSQL;

       DBGridUsersView();
       UsersView();
       UsersModuleView();

     end;
   end;

end;

procedure TFormSettings.NewCategory();
var NameCategory,CategoryID,SQL,ModuleID : String;
i : integer;

begin
     if not InputQuery('???? ??????','??????? ???????? ?????????', NameCategory)
     then exit;

     MySQLQueryUpdate.SQL.Text := ' INSERT INTO `ListCategoryModule` '+
     ' (`ListCMID`,`NameCategory`, `CompanyID`, `Visible`) VALUES '+
     ' ( NULL, '''+NameCategory+''', '''+CompanyID+''', 1); SELECT LAST_INSERT_ID()';
     MySQLQueryUpdate.Active := true;

     CategoryID := MySQLQueryUpdate.Fields[0].AsString;

     MySQLQueryUpdate.SQL.Text := ' SELECT ListModuleID FROM ListModule '+
     ' WHERE Visible = 1';
     MySQLQueryUpdate.Active := true;



     SQL := SQL + 'INSERT INTO `ListLinkingModulesCategories`'+
     '(`companyID`, `categoryID`, `moduleID`, `visible`) VALUES ';

     while not MySQLQueryUpdate.Eof do
     begin

     ModuleID := MySQLQueryUpdate.Fields[0].AsString;
     SQL := SQL + ' ('+CompanyID+','+CategoryID+','+ModuleID+',0), ';
     MySQLQueryUpdate.Next;

     end;

     Delete(SQL, Length(SQL)-1, 1);

     MySQLQueryUpdate.SQL.Text := SQL;
     MySQLQueryUpdate.ExecSQL;

     AddCategoryUser(CategoryID);
     CategoryView();

end;


procedure TFormSettings.AddCategoryUser(CategoryID : String);
var SQL,UserID : String;
begin
     MySQLQueryUpdate.SQL.Text := ' SELECT idUser FROM `ListUser`'+
     ' WHERE userVisible = 1';
     MySQLQueryUpdate.Active := true;

     SQL := SQL + 'INSERT INTO `ListLinkingUserCategory` '+
     ' (`ListUserCatID`, `CatModuleID`, `userID`, `visible`, `CompanyID`) VALUES ';

     while not MySQLQueryUpdate.Eof do
     begin

     UserID := MySQLQueryUpdate.Fields[0].AsString;
     SQL := SQL + ' (NULL,'+CategoryID+','+UserID+',0,'+CompanyID+'), ';
     MySQLQueryUpdate.Next;

     end;

     Delete(SQL, Length(SQL)-1, 1);

     MySQLQueryUpdate.SQL.Text := SQL;
     MySQLQueryUpdate.ExecSQL;

     CategoryView();
     UsersView()


end;



end.

