unit dashboard_admin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls, Buttons, SMDBCtrl, Grids, DBGrids,
  SMDBGrid, mxExport, DBCtrls, Mask;

type
  Tfmenu1 = class(TForm)
    Label1: TLabel;
    btnlogout: TBitBtn;
    btninfokaryawan: TBitBtn;
    SMDBGrid1: TSMDBGrid;
    SMDBGrid2: TSMDBGrid;
    SMDBGrid3: TSMDBGrid;
    SMDBNavigator1: TSMDBNavigator;
    SMDBNavigator2: TSMDBNavigator;
    SMDBNavigator3: TSMDBNavigator;
    export_jabatan: TmxDBGridExport;
    export_pengguna: TmxDBGridExport;
    export_absensi: TmxDBGridExport;
    Label2: TLabel;
    ed_namajabatan: TEdit;
    Label3: TLabel;
    ed_tarifjam: TEdit;
    btncreatejbtn: TButton;
    btnupdatejbtn: TButton;
    btndeletejbtn: TButton;
    ed_idjabatan: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    ed_idkaryawan: TEdit;
    ed_idpengguna: TEdit;
    ed_username: TEdit;
    ed_password: TEdit;
    ed_role: TEdit;
    btnupdatepengguna: TButton;
    btndeletepengguna: TButton;
    btncreatepengguna: TButton;
    Image1: TImage;
    SaveDialog1: TSaveDialog;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    btnsimpan: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btncreatejbtnClick(Sender: TObject);
    procedure btnupdatejbtnClick(Sender: TObject);
    procedure btndeletejbtnClick(Sender: TObject);
    procedure ed_idjabatanChange(Sender: TObject);
    procedure btncreatepenggunaClick(Sender: TObject);
    procedure btnupdatepenggunaClick(Sender: TObject);
    procedure btndeletepenggunaClick(Sender: TObject);
    procedure ed_idpenggunaChange(Sender: TObject);
    procedure btnlogoutClick(Sender: TObject);
    procedure SMDBNavigator1Click(Sender: TObject; Button: TSMNavigateBtn);
    procedure SMDBNavigator2Click(Sender: TObject; Button: TSMNavigateBtn);
    procedure SMDBNavigator3Click(Sender: TObject; Button: TSMNavigateBtn);
    procedure btninfokaryawanClick(Sender: TObject);
    procedure btnsimpanClick(Sender: TObject);
    procedure DBLookupComboBox1CloseUp(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmenu1: Tfmenu1;

implementation
uses datamodule,login, informasi_karyawan;

{$R *.dfm}

procedure Tfmenu1.FormShow(Sender: TObject);
begin
mydm.TabelAktif(True);
end;

procedure Tfmenu1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
mydm.TabelAktif(False);
end;

procedure Tfmenu1.btncreatejbtnClick(Sender: TObject);
begin
  try
    if Trim(ed_idjabatan.Text) = '' then
      raise Exception.Create('ID Jabatan tidak boleh kosong.');
    if Trim(ed_namajabatan.Text) = '' then
      raise Exception.Create('Nama Jabatan tidak boleh kosong.');
    if Trim(ed_tarifjam.Text) = '' then
      raise Exception.Create('Tarif Jam tidak boleh kosong.');

    with mydm.zq_jabatan do
    begin
      Append; // Memulai mode tambah data
      FieldByName('id_jabatan').AsString := ed_idjabatan.Text;
      FieldByName('nama_jabatan').AsString := ed_namajabatan.Text;
      FieldByName('tarif_perjam').AsFloat := StrToFloat(ed_tarifjam.Text);
      Post; // Simpan data
    end;

    ShowMessage('Data berhasil ditambahkan!');
    ed_idjabatan.Clear;
    ed_namajabatan.Clear;
    ed_tarifjam.Clear;
  except
    on E: Exception do
      ShowMessage('Error: ' + E.Message);
  end;
end;

procedure Tfmenu1.btnupdatejbtnClick(Sender: TObject);
begin
  try
    if Trim(ed_idjabatan.Text) = '' then
      raise Exception.Create('ID Jabatan tidak boleh kosong.');

    with mydm.zq_jabatan do
    begin
      if Locate('id_jabatan', ed_idjabatan.Text, []) then
      begin
        Edit; // Mode edit data
        FieldByName('nama_jabatan').AsString := ed_namajabatan.Text;
        FieldByName('tarif_perjam').AsFloat := StrToFloat(ed_tarifjam.Text);
        Post; // Simpan perubahan
        ShowMessage('Data berhasil diperbarui!');
      end
      else
        ShowMessage('Data dengan ID Jabatan tersebut tidak ditemukan.');
    end;
  except
    on E: Exception do
      ShowMessage('Error: ' + E.Message);
  end;
end;

procedure Tfmenu1.btndeletejbtnClick(Sender: TObject);
begin
  try
    if Trim(ed_idjabatan.Text) = '' then
      raise Exception.Create('ID Jabatan tidak boleh kosong.');

    with mydm.zq_jabatan do
    begin
      if Locate('id_jabatan', ed_idjabatan.Text, []) then
      begin
        if MessageDlg('Apakah Anda yakin ingin menghapus data ini?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          Delete; // Hapus data
          ShowMessage('Data berhasil dihapus!');
        end;
      end
      else
        ShowMessage('Data dengan ID Jabatan tersebut tidak ditemukan.');
    end;
  except
    on E: Exception do
      ShowMessage('Error: ' + E.Message);
  end;
end;

procedure Tfmenu1.ed_idjabatanChange(Sender: TObject);
begin
  if Trim(ed_idjabatan.Text) = '' then Exit;

  with mydm.zq_jabatan do
  begin
    if Locate('id_jabatan', ed_idjabatan.Text, []) then
    begin
      ed_namajabatan.Text := FieldByName('nama_jabatan').AsString;
      ed_tarifjam.Text := FloatToStr(FieldByName('tarif_perjam').AsFloat);
    end
    else
    begin
      ed_namajabatan.Clear;
      ed_tarifjam.Clear;
    end;
  end;
end;

procedure Tfmenu1.btncreatepenggunaClick(Sender: TObject);
begin
  try
    if Trim(ed_idpengguna.Text) = '' then
      raise Exception.Create('ID Pengguna tidak boleh kosong.');
    if Trim(ed_idkaryawan.Text) = '' then
      raise Exception.Create('ID Karyawan tidak boleh kosong.');
    if Trim(ed_username.Text) = '' then
      raise Exception.Create('Username tidak boleh kosong.');
    if Trim(ed_password.Text) = '' then
      raise Exception.Create('Password tidak boleh kosong.');
    if Trim(ed_role.Text) = '' then
      raise Exception.Create('Role tidak boleh kosong.');

    with mydm.zq_pengguna do
    begin
      Append; // Memulai mode tambah data
      FieldByName('id_pengguna').AsString := ed_idpengguna.Text;
      FieldByName('id_karyawan').AsString := ed_idkaryawan.Text;
      FieldByName('username').AsString := ed_username.Text;
      FieldByName('password').AsString := ed_password.Text;
      FieldByName('role').AsString := ed_role.Text;
      Post; // Simpan data
    end;

    ShowMessage('Data pengguna berhasil ditambahkan!');
    ed_idpengguna.Clear;
    ed_idkaryawan.Clear;
    ed_username.Clear;
    ed_password.Clear;
    ed_role.Clear;
  except
    on E: Exception do
      ShowMessage('Error: ' + E.Message);
  end;
end;
//
procedure Tfmenu1.btnupdatepenggunaClick(Sender: TObject);
begin
  try
    if Trim(ed_idpengguna.Text) = '' then
      raise Exception.Create('ID Pengguna tidak boleh kosong.');

    with mydm.zq_pengguna do
    begin
      if Locate('id_pengguna', ed_idpengguna.Text, []) then
      begin
        Edit; // Mode edit data
        FieldByName('id_karyawan').AsString := ed_idkaryawan.Text;
        FieldByName('username').AsString := ed_username.Text;
        FieldByName('password').AsString := ed_password.Text;
        FieldByName('role').AsString := ed_role.Text;
        Post; // Simpan perubahan
        ShowMessage('Data pengguna berhasil diperbarui!');
      end
      else
        ShowMessage('Data dengan ID Pengguna tersebut tidak ditemukan.');
    end;
  except
    on E: Exception do
      ShowMessage('Error: ' + E.Message);
  end;
end;

procedure Tfmenu1.btndeletepenggunaClick(Sender: TObject);
begin
  try
    if Trim(ed_idpengguna.Text) = '' then
      raise Exception.Create('ID Pengguna tidak boleh kosong.');

    with mydm.zq_pengguna do
    begin
      if Locate('id_pengguna', ed_idpengguna.Text, []) then
      begin
        if MessageDlg('Apakah Anda yakin ingin menghapus data ini?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          Delete; // Hapus data
          ShowMessage('Data pengguna berhasil dihapus!');
        end;
      end
      else
        ShowMessage('Data dengan ID Pengguna tersebut tidak ditemukan.');
    end;
  except
    on E: Exception do
      ShowMessage('Error: ' + E.Message);
  end;
end;

procedure Tfmenu1.ed_idpenggunaChange(Sender: TObject);
begin
  if Trim(ed_idpengguna.Text) = '' then Exit;

  with mydm.zq_pengguna do
  begin
    if Locate('id_pengguna', ed_idpengguna.Text, []) then
    begin
      ed_idkaryawan.Text := FieldByName('id_karyawan').AsString;
      ed_username.Text := FieldByName('username').AsString;
      ed_password.Text := FieldByName('password').AsString;
      ed_role.Text := FieldByName('role').AsString;
    end
    else
    begin
      ed_idkaryawan.Clear;
      ed_username.Clear;
      ed_password.Clear;
      ed_role.Clear;
    end;
  end;
end;

procedure Tfmenu1.btnlogoutClick(Sender: TObject);
begin
 fmenu1.Close;
 flogin.Show();
end;

procedure Tfmenu1.SMDBNavigator1Click(Sender: TObject;
  Button: TSMNavigateBtn);
begin
  case Button of
    sbFind: mydm.find_jabatan.Execute;
    sbFilter: mydm.filter_jabatan.Execute;
    sbExport:
      begin
        if Application.MessageBox('Apakah Anda akan mengekspor data?',
          'Export File', MB_OKCANCEL + MB_ICONQUESTION) = IDOK then
        begin
          if SaveDialog1.Execute = True then
          begin
            export_jabatan.FileName := SaveDialog1.FileName;
            export_jabatan.Select;
          end;
        end;
      end;

    sbPrint:
      begin
        mydm.rpt_jabatan.ShowReport();
      end;

  end;
end;
procedure Tfmenu1.SMDBNavigator2Click(Sender: TObject;
  Button: TSMNavigateBtn);
begin
  case Button of
    sbFind: mydm.find_pengguna.Execute;
    sbFilter: mydm.filter_pengguna.Execute;
    sbExport:
      begin
        if Application.MessageBox('Apakah Anda akan mengekspor data?',
          'Export File', MB_OKCANCEL + MB_ICONQUESTION) = IDOK then
        begin
          if SaveDialog1.Execute = True then
          begin
            export_pengguna.FileName := SaveDialog1.FileName;
            export_pengguna.Select;
          end;
        end;
      end;

    sbPrint:
      begin
        mydm.rpt_pengguna.ShowReport();
      end;

  end;
end;

procedure Tfmenu1.SMDBNavigator3Click(Sender: TObject;
  Button: TSMNavigateBtn);
begin
  case Button of
    sbFind: mydm.find_absensi.Execute;
    sbFilter: mydm.filter_absensi.Execute;
    sbExport:
      begin
        if Application.MessageBox('Apakah Anda akan mengekspor data?',
          'Export File', MB_OKCANCEL + MB_ICONQUESTION) = IDOK then
        begin
          if SaveDialog1.Execute = True then
          begin
            export_absensi.FileName := SaveDialog1.FileName;
            export_absensi.Select;
          end;
        end;
      end;

    sbPrint:
      begin
        mydm.rpt_absensi.ShowReport();
      end;

  end;
end;

procedure Tfmenu1.btninfokaryawanClick(Sender: TObject);
begin
fmenu1.Close;
finformasikaryawan.show();
end;

procedure Tfmenu1.btnsimpanClick(Sender: TObject);
var
    staffID: string;
begin
    if not flogin.ZConn.Connected then
    flogin.ZConn.Connected := True;

    if not mydm.zq_karyawan.Active then
  begin
    mydm.zq_karyawan.SQL.Clear;
    mydm.zq_karyawan.SQL.Add('SELECT * FROM karyawan');
    mydm.zq_karyawan.Open;
  end;

    if VarIsNull(DBLookupComboBox1.KeyValue) then
  begin
    ShowMessage('Silakan pilih karyawan terlebih dahulu.');
    Exit;
  end;


  begin
    staffID := IntToStr(DBLookupComboBox1.KeyValue);
    ShowMessage('KeyValue: ' + staffID);
  end;

  if mydm.zq_karyawan.Locate('id_karyawan', DBLookupComboBox1.KeyValue, []) then
  begin
  mydm.zq_pengguna.SQL.Clear;
  mydm.zq_pengguna.SQL.Add(
    'INSERT INTO pengguna (id_pengguna,username,password,role,id_karyawan) ' +
    'VALUES (:id_pengguna, :username, :password, :role, :id_karyawan)'
  );
  mydm.zq_pengguna.Params.ParamByName('id_pengguna').AsString := ed_idpengguna.Text;
  mydm.zq_pengguna.Params.ParamByName('username').AsString := ed_username.Text;
  mydm.zq_pengguna.Params.ParamByName('password').AsString := ed_password.Text;
  mydm.zq_pengguna.Params.ParamByName('role').AsString := ed_role.Text;
  mydm.zq_pengguna.Params.ParamByName('id_karyawan').AsString := staffID;

  end
  else
  begin
    ShowMessage('Karyawan tidak ditemukan dengan ID: ' + VarToStr(DBLookupComboBox1.KeyValue));
  end;

  try
    mydm.zq_pengguna.ExecSQL;
    ShowMessage('Data berhasil ditambahkan!');
  except
    on E: Exception do
      ShowMessage('Error: ' + E.Message);
  end;

  mydm.zq_pengguna.Close;
  mydm.zq_pengguna.SQL.Clear;
  mydm.zq_pengguna.SQL.Add('SELECT * FROM pengguna');
  mydm.zq_pengguna.Open;

  ed_idkaryawan.Clear;
  ed_idpengguna.Clear;
  ed_username.Clear;
  ed_password.Clear;
  ed_role.Clear;
end;

procedure Tfmenu1.DBLookupComboBox1CloseUp(Sender: TObject);
begin
  if VarIsNull(DBLookupComboBox1.KeyValue) then
  begin
    ShowMessage('Silakan pilih karyawan yang valid.');
    DBLookupComboBox1.KeyValue := Null;
    Exit;
  end;

  if not mydm.zq_karyawan.Locate('id_karyawan', DBLookupComboBox1.KeyValue, []) then
  begin
    ShowMessage('Karyawan tidak ditemukan. Silakan pilih karyawan yang valid.');
    DBLookupComboBox1.KeyValue := Null;
  end;
end;


end.
