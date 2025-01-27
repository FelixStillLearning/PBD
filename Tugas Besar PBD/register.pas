unit register;

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
    btnback: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fregister: Tfregister;

implementation

{$R *.dfm}

end.
