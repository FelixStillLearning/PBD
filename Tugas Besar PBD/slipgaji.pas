unit slipgaji;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, ExtCtrls, StdCtrls, jpeg, DB,DateUtils;

type
  Tfslipgaji = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Shape1: TShape;
    DBTextidkaryawan: TDBText;
    Label3: TLabel;
    DBText2: TDBText;
    Label4: TLabel;
    DBTextnoslip: TDBText;
    Label5: TLabel;
    DBText4namalengkap: TDBText;
    Label6: TLabel;
    DBTexttotaljamperbulan: TDBText;
    Label7: TLabel;
    DBText6: TDBText;
    Label8: TLabel;
    DBText7: TDBText;
    Label9: TLabel;
    DBTexttotalgaji: TDBText;
    Label10: TLabel;
    DBText9: TDBText;
    Label11: TLabel;
    DBText10: TDBText;
    Label12: TLabel;
    DBText11: TDBText;
    DBText12: TDBText;
    Label13: TLabel;
    btnkembali: TButton;
    btnkalkulasislipgaji: TButton;
    Label14: TLabel;
    DBText1: TDBText;
    procedure btnkembaliClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnkalkulasislipgajiClick(Sender: TObject);
    procedure RefreshSlipGajiDisplay;
  private
    { Private declarations }
    FCurrentPeriod: TDateTime;
  public
    { Public declarations }
  end;

var
  fslipgaji: Tfslipgaji;

implementation

uses dashboard_karyawan, datamodule, login;

{$R *.dfm}

procedure Tfslipgaji.btnkembaliClick(Sender: TObject);
begin
  fslipgaji.close;
  fmenu2.show();
end;

procedure Tfslipgaji.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  mydm.TabelAktif(False);
end;

procedure Tfslipgaji.FormShow(Sender: TObject);
begin
  mydm.TabelAktif(True);
  FCurrentPeriod := EncodeDate(YearOf(Now), MonthOf(Now), 1);
  RefreshSlipGajiDisplay;
end;

procedure Tfslipgaji.RefreshSlipGajiDisplay;
begin
  // Refresh the last saved slip gaji record for current employee
  with mydm.zq_penggajian do
  begin
    if Active then
    begin
      Close;
    end;
    SQL.Clear;
    SQL.Add('SELECT * FROM penggajian');
    SQL.Add('WHERE id_karyawan = :id_karyawan');
    SQL.Add('AND periode_gaji = :periode');
    SQL.Add('ORDER BY tanggal_cetak DESC LIMIT 1');
    ParamByName('id_karyawan').AsString := g_id_karyawan;
    ParamByName('periode').AsDateTime := FCurrentPeriod;
    Open;
  end;
end;

procedure Tfslipgaji.btnkalkulasislipgajiClick(Sender: TObject);
var
  TotalGaji: Double;
  IdKaryawan: Integer;
  NoSlip: String;
begin
  Screen.Cursor := crHourGlass;
  try
    IdKaryawan := StrToInt(g_id_karyawan);

    // Calculate monthly totals
    mydm.HitungTotalBulanan;
    
    // Calculate salary based on hours worked
    mydm.HitungGajiBulanan(IdKaryawan, TotalGaji);
    
    // Save to database
    mydm.SimpanSlipGaji(IdKaryawan, mydm.TotalJamBulanan, TotalGaji);
    
    // Generate slip number
    NoSlip := 'SG-' + FormatDateTime('yyyymm', FCurrentPeriod) + '-' +
              Format('%.3d', [IdKaryawan]);
    
    // Update display with new calculations
    with mydm.zq_penggajian do
    begin
      if Locate('no_slip', NoSlip, []) then
      begin
        // Update DBText components with calculated values
        DBTextnoslip.Caption := FieldByName('no_slip').AsString;
        DBTextidkaryawan.Caption := g_id_karyawan;
        DBText4namalengkap.Caption := mydm.zq_karyawan.FieldByName('nama_lengkap').AsString;
        DBTexttotaljamperbulan.Caption := FormatFloat('0.00', mydm.TotalJamBulanan);
        DBText6.Caption := IntToStr(mydm.TotalHariKerjaBulanan);
        DBText7.Caption := mydm.zq_jabatan.FieldByName('tarif_perjam').AsString;
        DBTexttotalgaji.Caption := FormatFloat('Rp #,##0.00', TotalGaji);
        DBText9.Caption := FormatDateTime('mmmm yyyy', FCurrentPeriod);
        DBText10.Caption := FormatDateTime('dd/mm/yyyy', Now);
        DBText11.Caption := FormatDateTime('dd/mm/yyyy', Now);
        DBText12.Caption := FieldByName('status').AsString;
        DBText1.Caption := mydm.zq_jabatan.FieldByName('nama_jabatan').AsString;
      end;
    end;
    
    ShowMessage('Kalkulasi dan penyimpanan slip gaji berhasil!');
    
  except
    on E: Exception do
      ShowMessage('Error pada proses kalkulasi slip gaji: ' + E.Message);
  end;
  Screen.Cursor := crDefault;
  RefreshSlipGajiDisplay;
end;

end.
