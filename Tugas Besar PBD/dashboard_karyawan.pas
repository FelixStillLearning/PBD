unit dashboard_karyawan;

interface


uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, EDBImage, ExtCtrls, jpeg, Buttons, Menus, Mask,
  DBCtrls, DB, DateUtils, Math;

type
  Tfmenu2 = class(TForm)
    Image1: TImage;
    EDBImage1: TEDBImage;
    labelselamatdatangkaryawan: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    btn_logout: TBitBtn;
    btnsimpaneditprofil: TBitBtn;
    btncanceleditprofil: TBitBtn;
    Label7: TLabel;
    btnabsensi: TBitBtn;
    btnslipgaji: TBitBtn;
    Label9: TLabel;
    Label10: TLabel;
    labelstat: TLabel;
    PopupMenu1: TPopupMenu;
    Label12: TLabel;
    Masukinfoto1: TMenuItem;
    hapusfoto1: TMenuItem;
    simpanfoto1: TMenuItem;
    dbed_idkaryawan: TDBEdit;
    dbed_namalengkap: TDBEdit;
    dbed_email: TDBEdit;
    dbed_notelp: TDBEdit;
    dbed_status: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBText1: TDBText;
    Tshape: TShape;
    btnhitung: TButton;
    DBEdit1: TDBEdit;
    procedure btn_logoutClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Masukinfoto1Click(Sender: TObject);
    procedure hapusfoto1Click(Sender: TObject);
    procedure simpanfoto1Click(Sender: TObject);
    procedure btnsimpaneditprofilClick(Sender: TObject);
    procedure btncanceleditprofilClick(Sender: TObject);
    procedure btnabsensiClick(Sender: TObject);
    procedure btnslipgajiClick(Sender: TObject);
    procedure btnhitungClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmenu2: Tfmenu2;

implementation

uses login,datamodule,myLib_Blob, absensi, slipgaji;

{$R *.dfm}

procedure Tfmenu2.btn_logoutClick(Sender: TObject);
begin
fmenu2.Close;
flogin.show();
end;

procedure Tfmenu2.FormShow(Sender: TObject);
begin
  mydm.TabelAktif(True);

  // Memfilter data karyawan berdasarkan ID karyawan yang login
  mydm.zq_karyawan.SQL.Text := 'SELECT * FROM karyawan WHERE id_karyawan = :id_karyawan';
  mydm.zq_karyawan.ParamByName('id_karyawan').AsString := g_id_karyawan;
  mydm.zq_karyawan.Open;

  // Memastikan data karyawan ditampilkan
  if not mydm.zq_karyawan.IsEmpty then
  begin
    labelselamatdatangkaryawan.Caption := 'Selamat Datang, ' + mydm.zq_karyawan.FieldByName('nama_lengkap').AsString;
  end
  else
  begin
    ShowMessage('Data karyawan tidak ditemukan!');
    fmenu2.Close;
    flogin.Show;
  end;
end;

procedure Tfmenu2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  mydm.zq_karyawan.Close;
  mydm.TabelAktif(False);
end;

procedure Tfmenu2.Masukinfoto1Click(Sender: TObject);
begin
Blob_FromFileImage(mydm.zq_karyawanblob);
end;

procedure Tfmenu2.hapusfoto1Click(Sender: TObject);
begin
Blob_Clear(mydm.zq_karyawanblob,'are you sure?????');
end;

procedure Tfmenu2.simpanfoto1Click(Sender: TObject);
begin
Blob_ToFileImage(mydm.zq_karyawanblob);
end;

procedure Tfmenu2.btnsimpaneditprofilClick(Sender: TObject);
begin
  // Menyimpan perubahan ke database
  if mydm.zq_karyawan.State in [dsEdit, dsInsert] then
    mydm.zq_karyawan.Post;
    
  ShowMessage('Data telah disimpan!');
end;


procedure Tfmenu2.btncanceleditprofilClick(Sender: TObject);
begin
  // Membatalkan perubahan yang belum disimpan dan mengembalikan data ke nilai sebelumnya
  if mydm.zq_karyawan.State in [dsEdit, dsInsert] then
    mydm.zq_karyawan.Cancel;

  ShowMessage('Perubahan dibatalkan!');
end;

procedure Tfmenu2.btnabsensiClick(Sender: TObject);
begin
 fmenu2.close;
 fabsensi.show();
end;

procedure Tfmenu2.btnslipgajiClick(Sender: TObject);
begin
fmenu2.Close;
fslipgaji.show();
end;


procedure Tfmenu2.btnhitungClick(Sender: TObject);
begin
  try
    // Pastikan dataset absensi aktif
    if not mydm.zq_absensi.Active then
      mydm.zq_absensi.Active := True;
      
    // Hitung total bulanan
    mydm.HitungTotalBulanan;
    
    // Pastikan dataset karyawan aktif dan dalam mode edit
    if not mydm.zq_karyawan.Active then
      mydm.zq_karyawan.Active := True;
      
    // Pastikan kita berada di record yang benar
    if not mydm.zq_karyawan.Locate('id_karyawan', g_id_karyawan, []) then
    begin
      ShowMessage('Data karyawan tidak ditemukan!');
      Exit;
    end;
    
    // Mulai edit mode
    mydm.zq_karyawan.Edit;
    
    // Update nilai di DBEdit
    DBEdit7.Field.AsFloat := mydm.TotalHariKerjaBulanan;
    DBEdit8.Field.AsFloat := mydm.TotalJamBulanan;
    
    // Simpan perubahan
    mydm.zq_karyawan.Post;
    
    ShowMessage(Format('Kalkulasi selesai!' + #13#10 +
               'Total Hari Kerja: %d hari' + #13#10 +
               'Total Jam Kerja: %.2f jam',
               [mydm.TotalHariKerjaBulanan, mydm.TotalJamBulanan]));
               
  except
    on E: Exception do
    begin
      ShowMessage('Terjadi kesalahan: ' + E.Message);
      if mydm.zq_karyawan.State in [dsEdit, dsInsert] then
        mydm.zq_karyawan.Cancel;
    end;
  end;
end;

end.
