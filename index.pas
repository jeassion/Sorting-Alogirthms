unit index;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Spin, ExtCtrls, pngimage, IOUtils, Types,
  Generics.Collections, Generics.Defaults,Bogosort;
type
  TForm2 = class(TForm)
    btnLoad: TButton;
    redout: TRichEdit;
    lblArrSize: TLabel;
    lstOptions: TListBox;
    btnSort: TButton;
    spnLength: TSpinEdit;
    imgBackground: TImage;
    procedure btnLoadClick(Sender: TObject);
    procedure btnSortClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  arrValues: bogosort.Tintegerarray;

implementation

{$R *.dfm}

procedure TForm2.btnLoadClick(Sender: TObject);
var iLoop : Integer;
begin
  SetLength(arrValues, spnLength.Value);
  for iLoop := 0 to length(arrValues)-1 do
    arrValues[iLoop] := Random(1000);


end;

procedure TForm2.btnSortClick(Sender: TObject);
var iLoop : Integer;
begin
  arrvalues:=bogosort.Sort(arrValues);
  redout.Clear;
  for iLoop := 0 to length(arrvalues)-1 do
    redout.Lines.Add(IntToStr(arrvalues[iLoop]));
end;

procedure TForm2.Button1Click(Sender: TObject);
var pos:integer;

begin
for pos := 0 to length(arrValues)-1 do
    redout.Lines.Add(IntToStr(arrValues[pos]));
end;

procedure TForm2.FormActivate(Sender: TObject);
var arrFileNames : TStringDynArray;
    iLoop : Integer;
    sOptionsTemp : String;
begin
    arrFileNames := TDirectory.GetFiles('.\Algorithms', '*.pas');
    for iLoop := 0 to length(arrFileNames)-1 do
      BEGIN
      sOptionsTemp := arrFileNames[iLoop];
      DELETE(sOptionsTemp,1,POS('\',sOptionsTemp));
      DELETE(sOptionsTemp,1,POS('\',sOptionsTemp));
      DELETE(sOptionsTemp,POS('.pas',sOptionsTemp),3);
      lstOptions.Items.Add(sOptionsTemp);
      END;
end;
end.
