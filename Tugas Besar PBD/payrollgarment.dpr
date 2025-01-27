program payrollgarment;

uses
  Forms,
  login in 'login.pas' {flogin},
  dashboard_admin in 'dashboard_admin.pas' {fmenu1},
  dashboard_karyawan in 'dashboard_karyawan.pas' {fmenu2},
  datamodule in 'datamodule.pas' {mydm: TDataModule},
  daftar in 'daftar.pas' {fregister},
  informasi_karyawan in 'informasi_karyawan.pas' {finformasikaryawan},
  absensi in 'absensi.pas' {fabsensi},
  slipgaji in 'slipgaji.pas' {fslipgaji};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tflogin, flogin);
  Application.CreateForm(Tfmenu1, fmenu1);
  Application.CreateForm(Tfmenu2, fmenu2);
  Application.CreateForm(Tmydm, mydm);
  Application.CreateForm(Tfregister, fregister);
  Application.CreateForm(Tfinformasikaryawan, finformasikaryawan);
  Application.CreateForm(Tfabsensi, fabsensi);
  Application.CreateForm(Tfslipgaji, fslipgaji);
  Application.Run;
end.
