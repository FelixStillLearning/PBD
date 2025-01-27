unit login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, Buttons, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection;

var
  g_id_karyawan: string;  // Variabel global untuk menyimpan ID karyawan yang login

type
  Tflogin = class(TForm)
    Image1: TImage;
    ed_user: TEdit;
    ed_pw: TEdit;
    btnlogin: TBitBtn;
    btncancel: TBitBtn;
    ZConn: TZConnection;
    zq_login: TZQuery;
    btnsignup: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    CheckBox1: TCheckBox;
    procedure btnloginClick(Sender: TObject);
    procedure btncancelClick(Sender: TObject);
    procedure btnsignupClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  flogin: Tflogin;

implementation

uses dashboard_admin,dashboard_karyawan,daftar;

{$R *.dfm}

procedure Tflogin.btnloginClick(Sender: TObject);
var
  level: string;
begin
  // Mengambil data id_karyawan dan role dari tabel pengguna berdasarkan username dan password
  zq_login.SQL.Text := 'SELECT id_karyawan, role FROM pengguna WHERE username = :username AND password = :password';
  zq_login.ParamByName('username').AsString := ed_user.Text;
  zq_login.ParamByName('password').AsString := ed_pw.Text;
  zq_login.Active := True;

  if zq_login.RecordCount = 1 then
  begin
    g_id_karyawan := zq_login['id_karyawan'];  // Menyimpan ID karyawan yang login
    level := zq_login['role'];  // Mendapatkan role pengguna
    
    if level = 'admin' then
    begin
      Application.MessageBox('Selamat Datang Admin!', 'Login Success', MB_OK + MB_ICONINFORMATION);
      fmenu1.Show;
    end
    else if level = 'user' then
    begin
      Application.MessageBox('Selamat Datang Karyawan!', 'Login Success', MB_OK + MB_ICONINFORMATION);
      Application.CreateForm(Tfmenu2, fmenu2);
      g_id_karyawan := zq_login['id_karyawan'];
      fmenu2.Show;
    end;


    flogin.Hide;
  end
  else
  begin
    Application.MessageBox('Username atau password salah !!!', 'Login Failed', MB_OK + MB_ICONERROR);
  end;
end;

procedure Tflogin.btncancelClick(Sender: TObject);
begin
  // Menutup aplikasi
  Application.Terminate;
end;

procedure Tflogin.btnsignupClick(Sender: TObject);
begin
  Application.CreateForm(Tfregister, fregister); // Mengasumsikan form di unit daftar memiliki nama Tfdaftar
  fregister.Show; // Menampilkan form daftar
  flogin.Hide; // Menyembunyikan form login (opsional, jika ingin hanya form daftar yang terlihat)
end;

procedure Tflogin.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
  ed_pw.PasswordChar := #0 else
  ed_pw.PasswordChar := '*';
end;

end.
