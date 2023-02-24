program Project2;

uses
  Vcl.Forms,
  Unit2 in 'Unit2.pas' {perCUrso};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TperCUrso, perCUrso);
  Application.Run;
end.
