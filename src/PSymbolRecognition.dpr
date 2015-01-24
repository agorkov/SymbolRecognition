program PSymbolRecognition;

uses
  Forms,
  UFMain in 'UFMain.pas' {FMain},
  UPerseptron in 'UPerseptron.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFMain, FMain);
  Application.Run;
end.
