unit Bogosort;

interface
uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Spin, ExtCtrls, pngimage, IOUtils, Types;
type TIntegerArray = Array of Integer;
procedure shuffle(arrInput:TIntegerArray);
function Sort(arrInput: TIntegerArray): TIntegerArray;
function sorted(arrInput:TIntegerArray): boolean;
implementation
procedure shuffle(arrInput:TIntegerArray);
var
  i,k,tmp,max: integer;
begin
max:=length(arrInput);
  for i := max downto 2 do begin
     k := random(i) + 1;
     if (arrInput[i] <> arrInput[k]) then begin
       tmp := arrInput[i];
       arrInput[i] := arrInput[k];
       arrInput[k] := tmp ;

     end;//showmessage('2');
  end;
showmessage(inttostr(arrInput[1]));
end;
function sorted(arrInput:TIntegerArray): boolean;
var
  max,i: integer;
begin
max:=length(arrInput);
  sorted := True;
  for i := 2 to max do
    if (arrInput[i - 1] > arrInput[i]) then begin
      sorted := False; exit
    end;

    //showmessage('3');
end;
function Sort(arrInput: TIntegerArray): TIntegerArray;
var
  i: integer;
  sorts:boolean;
begin

  sorts:=false;
  i := 1; randomize;
     //ShowMessage('1');
  while sorts=false do begin
    if not sorted(arrInput)=true then
       sorts:=false;
    shuffle(arrInput);
    if sorted(arrInput)=true then
    sorts:=true

end;
showmessage(inttostr(arrInput[1]));
   result := arrInput;
end;

end.
