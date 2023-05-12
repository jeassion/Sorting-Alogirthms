unit index;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Spin, ExtCtrls, pngimage, IOUtils, Types,
  Generics.Collections, Generics.Defaults;    //, translater

type TIntegerArray = Array of Integer;

type
  TForm2 = class(TForm)
    btnLoad: TButton;
    redout: TRichEdit;
    lblArrSize: TLabel;
    lstOptions: TListBox;
    btnSort: TButton;
    spnLength: TSpinEdit;
    imgBackground: TImage;
    spnSortMax: TSpinEdit;
    lblArrMax: TLabel;
    Label1: TLabel;
    procedure btnLoadClick(Sender: TObject);
    procedure btnSortClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }


  //var arrValues: Tintegerarray;


  public
    { Public declarations }
  end;

type Bogosort = class
 private
  max : Integer;
  function printa(a: TIntegerArray): String; { Print a list }
  procedure shuffle(var a: TIntegerArray); { Knuth shuffle }
  function sorted(a: TIntegerArray): boolean; { Check for sorted list }
  procedure bogo(var a: TIntegerArray); { Bogosort }
  function Sort(arrInput: TIntegerArray): TIntegerArray;
 public
 end;



var
  Form2: TForm2;
  arrValues: Tintegerarray;
implementation
//uses Bogosort;

{$R *.dfm}

procedure TForm2.btnLoadClick(Sender: TObject);
var iLoop : Integer;
begin
  SetLength(arrValues, spnLength.Value);
  redout.Clear;
  redout.Lines.Add('Original array is as follows: ');
  for iLoop := 0 to length(arrValues)-1 do
   BEGIN
    arrValues[iLoop] := Random(100);
    redout.Lines.Add(IntToStr(arrValues[iLoop]));
   END;

end;

procedure TForm2.btnSortClick(Sender: TObject);
var iLoop : Integer;
    //arrValues: TIntegerArray;
    usedSorting: Bogosort;
    //a: TIntegerArray;
begin
  //Sorting
  redout.Clear;
  usedSorting := Bogosort.Create;

  usedSorting.Sort(arrValues);
  redout.Lines.Add('SORTING COMPLETE/MAXIMUM LENGTH REACHED!');

  //for iLoop := 0 to length(a)-1 do
  //  redout.Lines.Add(IntToStr(a[iLoop]));
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
      DELETE(sOptionsTemp,POS('.pas',sOptionsTemp),4);
      lstOptions.Items.Add(sOptionsTemp);
      END;
end;

function Bogosort.printa(a: TIntegerArray): String;
var
  i: integer;
  sTemp: String;
begin
  for i := 0 to max do
  sTemp:= sTemp + (IntToStr(a[i])+' ');
  result:= sTemp;
end;

{ Knuth shuffle }
procedure Bogosort.shuffle(var a: TIntegerArray);
var
  i,k,tmp: integer;
begin
  for i := max downto 0 do begin
     k := random(i) + 1;
     if (a[i] <> a[k]) then begin
       tmp := a[i]; a[i] := a[k]; a[k] := tmp
     end
  end
end;

function Bogosort.Sort(arrInput: TIntegerArray): TIntegerArray;
var
  a: TIntegerArray;
  i: integer;
begin
{ Test and display }
  max := length(arrInput)-1;
  SetLength(a,max);
  for i := 0 to max do
    a[i] := arrInput[i];
  bogo(a);
end;

{ Check for sorted list }
function Bogosort.sorted(a: TIntegerArray): boolean;
var
  i: integer;
begin
  sorted := True;
  for i := 1 to max do
    if (a[i - 1] > a[i]) then begin
      sorted := False; exit
    end
end;

{ Bogosort }
procedure Bogosort.bogo(var a: TIntegerArray);
var
  i: Integer;
  sTemp: String;
begin
  i := 0; randomize;
  sTemp:= (IntToStr(i)+': '+printa(a));
  Form2.redout.Lines.Add(sTemp);
  Form2.redout.Perform( EM_SCROLL, SB_LINEDOWN, 0);
  while not sorted(a) AND (i < Form2.spnSortMax.Value) do begin
    shuffle(a);
    i := i + 1;
    sTemp:= (IntToStr(i)+': '+printa(a));
    Form2.redout.Lines.Add(sTemp);
    Form2.redout.Perform( EM_SCROLL, SB_LINEDOWN, 0);
  end
end;

end.
