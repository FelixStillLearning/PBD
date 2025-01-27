unit absensi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, ComCtrls, StdCtrls, Grids, DBGrids, SMDBGrid,
  Mask, DBCtrls, SMDBCtrl;

type
  Tfabsensi = class(TForm)
    Image1: TImage;
    SMDBGrid1: TSMDBGrid;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    DateTimePicker3: TDateTimePicker;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    btnsimpanabsensi: TButton;
    btncancelabsensi: TButton;
    btnKembali: TButton;
    DBNavigator1: TDBNavigator;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnsimpanabsensiClick(Sender: TObject);
    procedure btncancelabsensiClick(Sender: TObject);
    procedure btnKembaliClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fabsensi: Tfabsensi;

implementation
uses dashboard_karyawan,datamodule,login;

{$R *.dfm}

procedure Tfabsensi.FormShow(Sender: TObject);
begin
  mydm.TabelAktif(True);
  // Mengambil data absensi hanya untuk karyawan yang login
  mydm.zq_absensi.SQL.Text := 'SELECT * FROM absensi WHERE id_karyawan = :id_karyawan ORDER BY tanggal DESC';
  mydm.zq_absensi.ParamByName('id_karyawan').AsString := g_id_karyawan;  // Menggunakan ID karyawan yang login
  mydm.zq_absensi.Open;
end;

procedure Tfabsensi.FormClose(Sender: TObject; var Action: TCloseAction);
begin
mydm.TabelAktif(False);
end;

procedure Tfabsensi.btnsimpanabsensiClick(Sender: TObject);
begin
  // Menyimpan data absensi baru berdasarkan ID karyawan yang login
  mydm.zq_absensi.Append;
  mydm.zq_absensi.FieldByName('id_karyawan').AsString := g_id_karyawan;  // Menggunakan ID karyawan yang login
  mydm.zq_absensi.FieldByName('jam_masuk').AsDateTime := DateTimePicker1.DateTime;  // Jam masuk
  mydm.zq_absensi.FieldByName('jam_keluar').AsDateTime := DateTimePicker2.DateTime;  // Jam keluar
  mydm.zq_absensi.FieldByName('tanggal').AsDateTime := DateTimePicker3.Date;
  mydm.zq_absensi.FieldByName('keterangan').AsString := DBEdit2.Text;  // Tanggal absensi
  mydm.zq_absensi.Post;

  ShowMessage('Absensi berhasil disimpan!');
  mydm.zq_absensi.Refresh;  // Refresh data grid setelah absensi disimpan
end;

procedure Tfabsensi.btncancelabsensiClick(Sender: TObject);
begin
  // Membatalkan input data absensi
  mydm.zq_absensi.Cancel;
  ShowMessage('Input absensi dibatalkan!');
end;

procedure Tfabsensi.btnKembaliClick(Sender: TObject);
begin
  // Menutup form absensi dan kembali ke dashboard karyawan
  fabsensi.Close;
  fmenu2.Show;
end;

end.
