unit informasi_karyawan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, SMDBCtrl, Grids, DBGrids, SMDBGrid, StdCtrls,
  Menus, EDBImage, mxExport;

type
  Tfinformasikaryawan = class(TForm)
    Image1: TImage;
    SMDBGrid1: TSMDBGrid;
    SMDBGrid2: TSMDBGrid;
    SMDBNavigator1: TSMDBNavigator;
    SMDBNavigator2: TSMDBNavigator;
    Label1: TLabel;
    PopupMenu1: TPopupMenu;
    EDBImage1: TEDBImage;
    MasukinFoto1: TMenuItem;
    HapusFoto1: TMenuItem;
    SimpanFoto1: TMenuItem;
    export_karyawan: TmxDBGridExport;
    export_penggajian: TmxDBGridExport;
    SaveDialog1: TSaveDialog;
    btnkembali: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure MasukinFoto1Click(Sender: TObject);
    procedure HapusFoto1Click(Sender: TObject);
    procedure SimpanFoto1Click(Sender: TObject);
    procedure SMDBNavigator1Click(Sender: TObject; Button: TSMNavigateBtn);
    procedure SMDBNavigator2Click(Sender: TObject; Button: TSMNavigateBtn);
    procedure btnkembaliClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  finformasikaryawan: Tfinformasikaryawan;

implementation
uses datamodule,myLib_Blob, dashboard_admin;

{$R *.dfm}

procedure Tfinformasikaryawan.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
mydm.TabelAktif(False);
end;

procedure Tfinformasikaryawan.FormShow(Sender: TObject);
begin
mydm.TabelAktif(True);
end;


procedure Tfinformasikaryawan.MasukinFoto1Click(Sender: TObject);
begin
  Blob_FromFileImage(mydm.zq_karyawanblob);
end;

procedure Tfinformasikaryawan.HapusFoto1Click(Sender: TObject);
begin
  Blob_Clear(mydm.zq_karyawanblob,'Are you Sure?');
end;

procedure Tfinformasikaryawan.SimpanFoto1Click(Sender: TObject);
begin
 Blob_ToFileImage(mydm.zq_karyawanblob);
end;

procedure Tfinformasikaryawan.SMDBNavigator1Click(Sender: TObject;
  Button: TSMNavigateBtn);
begin
case Button of
    sbFind: mydm.find_karyawan.Execute;
    sbFilter: mydm.filter_karyawan.Execute;
    sbExport:
      begin
        if Application.MessageBox('Apakah Anda akan mengekspor data?',
          'Export File', MB_OKCANCEL + MB_ICONQUESTION) = IDOK then
        begin
          if SaveDialog1.Execute = True then
          begin
            export_karyawan.FileName := SaveDialog1.FileName;
            export_karyawan.Select;
          end;
        end;
      end;

    sbPrint:
      begin
        mydm.rpt_karyawan.ShowReport();
      end;

  end;
end;

procedure Tfinformasikaryawan.SMDBNavigator2Click(Sender: TObject;
  Button: TSMNavigateBtn);
begin
case Button of
    sbFind: mydm.find_penggajian.Execute;
    sbFilter: mydm.filter_penggajian.Execute;
    sbExport:
      begin
        if Application.MessageBox('Apakah Anda akan mengekspor data?',
          'Export File', MB_OKCANCEL + MB_ICONQUESTION) = IDOK then
        begin
          if SaveDialog1.Execute = True then
          begin
            export_penggajian.FileName := SaveDialog1.FileName;
            export_penggajian.Select;
          end;
        end;
      end;

    sbPrint:
      begin
        mydm.rpt_penggajian.ShowReport();
      end;

  end;
end;

procedure Tfinformasikaryawan.btnkembaliClick(Sender: TObject);
begin
finformasikaryawan.Close;
fmenu1.show();
end;

end.
