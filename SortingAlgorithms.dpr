program SortingAlgorithms;

uses
  Forms,
  index in 'index.pas' {Form2},
  Bogosort in 'Algorithms\Bogosort.pas',
  translater in 'Algorithms\translater.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
