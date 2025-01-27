unit datamodule;

interface

uses
  SysUtils, Classes, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  SMDBFltr, SMDBFind, frxClass, frxDBSet,DateUtils,Dialogs, Windows;

type
  Tmydm = class(TDataModule)
    zq_karyawan: TZQuery;
    zq_pengguna: TZQuery;
    zq_penggajian: TZQuery;
    zq_jabatan: TZQuery;
    zq_absensi: TZQuery;
    ds_karyawan: TDataSource;
    ds_pengguna: TDataSource;
    ds_penggajian: TDataSource;
    ds_jabatan: TDataSource;
    ds_absensi: TDataSource;
    find_karyawan: TSMDBFindDialog;
    find_pengguna: TSMDBFindDialog;
    find_penggajian: TSMDBFindDialog;
    find_jabatan: TSMDBFindDialog;
    find_absensi: TSMDBFindDialog;
    filter_karyawan: TSMDBFilterDialog;
    filter_pengguna: TSMDBFilterDialog;
    filter_penggajian: TSMDBFilterDialog;
    filter_jabatan: TSMDBFilterDialog;
    filter_absensi: TSMDBFilterDialog;
    rpt_karyawan: TfrxReport;
    rpt_pengguna: TfrxReport;
    rpt_penggajian: TfrxReport;
    rpt_jabatan: TfrxReport;
    rpt_absensi: TfrxReport;
    rptdb_karyawan: TfrxDBDataset;
    rptdb_pengguna: TfrxDBDataset;
    rptdb_penggajian: TfrxDBDataset;
    rptdb_jabatan: TfrxDBDataset;
    rptdb_absensi: TfrxDBDataset;
    zq_absensiid_absensi: TIntegerField;
    zq_absensiid_karyawan: TIntegerField;
    zq_absensitanggal: TDateField;
    zq_absensijam_masuk: TTimeField;
    zq_absensitotal_jam: TFloatField;
    zq_absensijam_keluar: TTimeField;
    zq_absensikalkulasitotaljam: TFloatField;
    zq_absensikalkulasitotaljamkerjabulanini: TFloatField;
    zq_karyawanid_karyawan: TIntegerField;
    zq_karyawannik: TStringField;
    zq_karyawannama_lengkap: TStringField;
    zq_karyawanjenis_kelamin: TStringField;
    zq_karyawanalamat: TStringField;
    zq_karyawanno_telp: TStringField;
    zq_karyawanemail: TStringField;
    zq_karyawanid_jabatan: TIntegerField;
    zq_karyawantanggal_masuk: TDateField;
    zq_karyawanstatus: TStringField;
    zq_absensiketerangan: TStringField;
    zq_karyawanblob: TBlobField;
    zq_karyawannama_jabatan: TStringField;
    zq_karyawantarifjabatan: TIntegerField;
    zq_jabatanid_jabatan: TIntegerField;
    zq_jabatannama_jabatan: TStringField;
    zq_jabatantarif_perjam: TFloatField;
    zq_penggunaid_pengguna: TIntegerField;
    zq_penggunausername: TStringField;
    zq_penggunapassword: TStringField;
    zq_penggunaid_karyawan: TIntegerField;
    zq_penggunarole: TStringField;
    zq_penggajianid_gaji: TIntegerField;
    zq_penggajianno_slip: TStringField;
    zq_penggajianid_karyawan: TIntegerField;
    zq_penggajianperiode_gaji: TDateField;
    zq_penggajiantotal_jam: TFloatField;
    zq_penggajiantotal_gaji: TFloatField;
    zq_penggajiantanggal_bayar: TDateField;
    zq_penggajiantanggal_cetak: TDateTimeField;
    zq_penggajianstatus: TStringField;
    zq_penggajianid_absensi: TIntegerField;
    zq_karyawantotal_hari_kerja: TIntegerField;
    zq_karyawantotal_jam_kerja: TFloatField;
    zq_penggunanama_karyawan: TStringField;
    procedure zq_absensiCalcFields(DataSet: TDataSet);
    procedure zq_absensiBeforePost(DataSet: TDataSet);
    procedure zq_karyawanDeleteError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure zq_penggajianPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure zq_karyawanPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
  private
    { Private declarations }
    FTotalJamBulanan: Double;
    FTotalHariKerjaBulanan: Integer;
  public
    procedure TabelAktif(b: Boolean);
    procedure HitungTotalBulanan;
    procedure HitungGajiBulanan(id_karyawan: Integer; var TotalGaji: Double);
    procedure SimpanSlipGaji(id_karyawan: Integer; TotalJam: Double; TotalGaji: Double);
    property TotalJamBulanan: Double read FTotalJamBulanan;
    property TotalHariKerjaBulanan: Integer read FTotalHariKerjaBulanan;
  end;
    { Public declarations }

var
  mydm: Tmydm;

implementation
uses login;

{$R *.dfm}
procedure Tmydm.TabelAktif(b:Boolean);
begin
 zq_karyawan.active := b;
 zq_pengguna.active := b;
 zq_penggajian.active := b;
 zq_jabatan.active := b;
 zq_absensi.active := b;
end;



procedure Tmydm.zq_absensiCalcFields(DataSet: TDataSet);
var
  JamMasuk, JamKeluar: TDateTime;
  TotalJam: Double;
begin
  // Kalkulasi jam kerja harian
  if not DataSet.FieldByName('jam_masuk').IsNull and not DataSet.FieldByName('jam_keluar').IsNull then
  begin
    JamMasuk := DataSet.FieldByName('jam_masuk').AsDateTime;
    JamKeluar := DataSet.FieldByName('jam_keluar').AsDateTime;

    // Hitung selisih jam kerja
    TotalJam := (JamKeluar - JamMasuk) * 24;
    if TotalJam < 0 then
      TotalJam := TotalJam + 24;

    DataSet.FieldByName('kalkulasitotaljam').AsFloat := TotalJam;
  end
  else
  begin
    DataSet.FieldByName('kalkulasitotaljam').AsFloat := 0;
  end;
end;

procedure Tmydm.zq_absensiBeforePost(DataSet: TDataSet);
begin
  // Pastikan kalkulasi total jam disalin ke field di database
  if not DataSet.FieldByName('kalkulasitotaljam').IsNull then
  begin
    // Menyalin hasil kalkulasi ke field yang ada di database
    DataSet.FieldByName('total_jam').AsFloat := DataSet.FieldByName('kalkulasitotaljam').AsFloat;
  end;
end;

procedure Tmydm.HitungTotalBulanan;
var
  TotalJamBulanan: Double;
  TotalHariKerjaBulanan: Integer;
  Year, Month, Day: Word;
  CurrentDate: TDateTime;
  ProcessedDays: array[1..31] of Boolean;
  i: Integer;
begin
  // Initialize variables
  TotalJamBulanan := 0;
  TotalHariKerjaBulanan := 0;
  
  // Initialize ProcessedDays array
  for i := 1 to 31 do
    ProcessedDays[i] := False;

  // Get current month and year
  DecodeDate(Now, Year, Month, Day);

  // Make sure dataset is active
  if not zq_absensi.Active then
    zq_absensi.Active := True;

  try
    // Filter data for current month
    zq_absensi.First;
    while not zq_absensi.Eof do
    begin
      CurrentDate := zq_absensi.FieldByName('tanggal').AsDateTime;

      // Check if record is for current month and year
      if (MonthOf(CurrentDate) = Month) and
         (YearOf(CurrentDate) = Year) and
         (zq_absensi.FieldByName('id_karyawan').AsString = g_id_karyawan) and
         (zq_absensi.FieldByName('keterangan').AsString = 'hadir') then
      begin
        // Add total hours
        if not zq_absensi.FieldByName('total_jam').IsNull then
          TotalJamBulanan := TotalJamBulanan + zq_absensi.FieldByName('total_jam').AsFloat;

        // Mark day as processed (for unique day count)
        if not ProcessedDays[DayOf(CurrentDate)] then
        begin
          ProcessedDays[DayOf(CurrentDate)] := True;
          Inc(TotalHariKerjaBulanan);
        end;
      end;
      
      zq_absensi.Next;
    end;

    // Store results in class variables
    FTotalJamBulanan := TotalJamBulanan;
    FTotalHariKerjaBulanan := TotalHariKerjaBulanan;

  except
    on E: Exception do
    begin
      ShowMessage('Error calculating monthly totals: ' + E.Message);
      FTotalJamBulanan := 0;
      FTotalHariKerjaBulanan := 0;
    end;
  end;
end;

procedure Tmydm.HitungGajiBulanan(id_karyawan: Integer; var TotalGaji: Double);
var
  TarifPerJam: Double;
begin
  if not zq_karyawan.Active then zq_karyawan.Active := True;
  if not zq_jabatan.Active then zq_jabatan.Active := True;
  
  try
    zq_karyawan.Locate('id_karyawan', id_karyawan, []);
    zq_jabatan.Locate('id_jabatan', zq_karyawan.FieldByName('id_jabatan').AsInteger, []);
    TarifPerJam := zq_jabatan.FieldByName('tarif_perjam').AsFloat;
    
    TotalGaji := TarifPerJam * FTotalJamBulanan;
  except
    on E: Exception do
    begin
      ShowMessage('Error dalam kalkulasi gaji: ' + E.Message);
      TotalGaji := 0;
    end;
  end;
end;

procedure Tmydm.SimpanSlipGaji(id_karyawan: Integer; TotalJam: Double; TotalGaji: Double);
var
  NoSlip: String;
  CurrentDate: TDateTime;
begin
  if not zq_penggajian.Active then
    zq_penggajian.Active := True;
    
  try
    CurrentDate := Now;
    
    NoSlip := 'SG-' + FormatDateTime('yyyymm', CurrentDate) + '-' + 
              Format('%.3d', [id_karyawan]);
              
    zq_penggajian.Append;
    zq_penggajian.FieldByName('no_slip').AsString := NoSlip;
    zq_penggajian.FieldByName('id_karyawan').AsInteger := id_karyawan;
    zq_penggajian.FieldByName('periode_gaji').AsDateTime := StartOfTheMonth(CurrentDate);
    zq_penggajian.FieldByName('total_jam').AsFloat := TotalJam;
    zq_penggajian.FieldByName('total_gaji').AsFloat := TotalGaji;
    zq_penggajian.FieldByName('tanggal_cetak').AsDateTime := CurrentDate;
    zq_penggajian.FieldByName('status').AsString := 'draft';
    zq_penggajian.Post;
    
  except
    on E: Exception do
    begin
      if zq_penggajian.State in [dsEdit, dsInsert] then
        zq_penggajian.Cancel;
      ShowMessage('Error menyimpan slip gaji: ' + E.Message);
    end;
  end;
end;

procedure Tmydm.zq_karyawanDeleteError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
var
  msg, ref: string;
begin
  msg := E.Message; // Ambil pesan Error dari mySQL
  ref := LowerCase('Cannot delete or update a parent row');
  // ubah menjadi huruf kecil semua
  if Pos(ref, LowerCase(Msg)) > 0 then
  begin // apakah error ref ada di msg ?
    msg := 'Record tidak dapat dihapus/dirubah karena ' + #13#10 +
      'masih mempunyai relasi dengan tabel transaksi';
  end;
  MessageBox(0, PChar(msg), 'Delete Error', MB_ICONERROR or MB_OK);
end;

procedure Tmydm.zq_penggajianPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
var
  msg, ref: string;
begin
  msg := E.Message;
  ref := LowerCase('Cannot add or update a child row');
  if Pos(ref, LowerCase(Msg)) > 0 then
  begin
    if Pos('id_karyawan', msg) > 0 then // terhadap id_karyawan yg di tabel mhs
      msg := 'Record tidak dapat ditambah / dirubah karena ' + #13#10 +
        'ID Karyawan tidak terdaftar pada tabel Transaksi'
  end;
  Action := daAbort;
  // Dataset.Cancel;
  MessageBox(0, PChar(msg), 'Add/Update Error', MB_ICONERROR or MB_OK);
end;

procedure Tmydm.zq_karyawanPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
var
  msg, ref: string;
begin
  msg := E.Message;
  ref := LowerCase('Cannot delete or update a parent row');
  if Pos(ref, LowerCase(Msg)) > 0 then
  begin
    msg := 'Record tidak dapat dihapus/dirubah karena ' + #13#10 +
      'masih mempunyai relasi dengan tabel Transaksi';
  end;
  Action := daAbort; // eksekusi dibatalkan
  MessageBox(0, PChar(msg), 'Add/Update Error', MB_ICONERROR or MB_OK);
end;

end.
