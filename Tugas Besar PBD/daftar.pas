unit daftar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, jpeg, Buttons;

type
  Tfregister = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ed_user: TEdit;
    ed_pw: TEdit;
    btncreate: TBitBtn;
    BitBtn2: TBitBtn;
    Label4: TLabel;
    ed_id: TEdit;
    procedure BitBtn2Click(Sender: TObject);
    procedure btncreateClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fregister: Tfregister;

implementation
uses login,datamodule;

{$R *.dfm}

procedure Tfregister.BitBtn2Click(Sender: TObject);
begin
  flogin.Show; // Menampilkan form daftar
  fregister.Hide;
end;

procedure Tfregister.btncreateClick(Sender: TObject);
var
  id_karyawan, username, password: string;
begin
  // Ambil nilai dari inputan user
  id_karyawan := ed_id.Text;
  username := ed_user.Text;
  password := ed_pw.Text;

  // Validasi input tidak kosong
  if (id_karyawan = '') or (username = '') or (password = '') then
  begin
    Application.MessageBox('Semua field harus diisi!', 'Error', MB_OK + MB_ICONERROR);
    Exit;
  end;

  // Validasi ID Karyawan di tabel karyawan
  with mydm.zq_karyawan do
  begin
    SQL.Text := 'SELECT * FROM karyawan WHERE id_karyawan = :id_karyawan';
    ParamByName('id_karyawan').AsString := id_karyawan;
    Open;

    if RecordCount = 0 then
    begin
      Application.MessageBox('ID Karyawan tidak ditemukan!', 'Error', MB_OK + MB_ICONERROR);
      Close;
      Exit;
    end;

    Close; // Tutup query setelah validasi
  end;

  // Jika validasi berhasil, masukkan data ke tabel pengguna
  with mydm.zq_pengguna do
  begin
    SQL.Text :=
      'INSERT INTO pengguna (id_karyawan, username, password, role) VALUES (:id_karyawan, :username, :password, :role)';
    ParamByName('id_karyawan').AsString := id_karyawan;
    ParamByName('username').AsString := username;
    ParamByName('password').AsString := password;
    ParamByName('role').AsString := 'user'; // Default role sebagai user
    ExecSQL;

    Application.MessageBox('Akun berhasil dibuat!', 'Success', MB_OK + MB_ICONINFORMATION);
  end;

  // Navigasi kembali ke form login
  flogin.Show;
  fregister.Hide;
end;

end.
