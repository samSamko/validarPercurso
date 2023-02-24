unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  System.StrUtils,Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TperCUrso = class(TForm)
    ufIni: TEdit;
    ufFim: TEdit;
    ufPerc: TEdit;
    validarPerc: TButton;
    sinal: TPanel;
    procedure validarPercClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  perCUrso: TperCUrso;

implementation

{$R *.dfm}


function validRoute(ufIni:string;ufFim:string;perc:string):Boolean; //by Samael Samoilenko (samael.com.br)
begin
  Result := False;
  //Uppercase tudo pra prevenir erro humano
  ufIni:=Trim(UpperCase(ufIni));ufFim:=Trim(UpperCase(ufFim));perc:=Trim(UpperCase(perc));
  //Entrega dentro do estado sem percurso
  if (ufIni=ufFim) and (perc='') then begin Result:=True;Exit end;
  //Verificar cada par de estados
  var curUf,proxUf:string;
  curUf := '';proxUf := '';
  //Se for para uf de fronteira, assumir direto UFINI;UFFIM, se não, montar percurso
  if perc='' then perc:=ufIni+';'+ufFim else perc:=ufIni+';'+perc+';'+ufFim;
  //Verificar quantas fronteiras atravessaremos
  var countUf:integer:=0;
  for var J := 1 to Length(perc) do
    if perc[J] = ';' then
      inc(countUf);
  //Verificar se cada fronteira é valida, se não for sair com default (false)
  for var I := 0 to countUf do
  begin
    //Na primeira volta, assumir só uma fronteira, nas seguintes multiplicar
    //posição pela fronteira para pegar próximas fronteiras
    if curUf = '' then curUf:=ufIni else curUf:=Copy(perc,4+(3*I),2);
    if proxUf = '' then proxUf:=Copy(perc,4,2) else proxUf:=Copy(perc,(7+(3*I)),2);
    if (curUf = 'RS') and (IndexStr(proxUf,['SC']) <> -1) then continue;
    if (curUf = 'SC') and (IndexStr(proxUf,['RS','PR']) <> -1) then continue;
    if (curUf = 'PR') and (IndexStr(proxUf,['SC','SP','MS']) <> -1) then continue;
    if (curUf = 'SP') and (IndexStr(proxUf,['PR','MS','MG','RJ']) <> -1) then continue;
    if (curUf = 'RJ') and (IndexStr(proxUf,['SP','MG','ES']) <> -1) then continue;
    if (curUf = 'ES') and (IndexStr(proxUf,['RJ','MG','BA']) <> -1) then continue;
    if (curUf = 'BA') and (IndexStr(proxUf,['ES','MG','GO','TO','PI','PE','AL','SE']) <> -1) then continue;
    if (curUf = 'SE') and (IndexStr(proxUf,['BA','AL']) <> -1) then continue;
    if (curUf = 'AL') and (IndexStr(proxUf,['SE','BA','PE']) <> -1) then continue;
    if (curUf = 'PE') and (IndexStr(proxUf,['AL','BA','PI','CE','PB']) <> -1) then continue;
    if (curUf = 'PB') and (IndexStr(proxUf,['PE','CE','RN']) <> -1) then continue;
    if (curUf = 'RN') and (IndexStr(proxUf,['PB','CE']) <> -1) then continue;
    if (curUf = 'CE') and (IndexStr(proxUf,['RN','PB','PE','PI']) <> -1) then continue;
    if (curUf = 'PI') and (IndexStr(proxUf,['CE','PE','BA','TO','MA']) <> -1) then continue;
    if (curUf = 'MA') and (IndexStr(proxUf,['PI','TO','PA']) <> -1) then continue;
    if (curUf = 'PA') and (IndexStr(proxUf,['MA','TO','MT','AM','RR','AP']) <> -1) then continue;
    if (curUf = 'AP') and (IndexStr(proxUf,['PA']) <> -1) then continue;
    if (curUf = 'RR') and (IndexStr(proxUf,['PA','AM']) <> -1) then continue;
    if (curUf = 'AM') and (IndexStr(proxUf,['RR','PA','MT','RO','AC']) <> -1) then continue;
    if (curUf = 'AC') and (IndexStr(proxUf,['AM']) <> -1) then continue;
    if (curUf = 'RO') and (IndexStr(proxUf,['AM','MT']) <> -1) then continue;
    if (curUf = 'MT') and (IndexStr(proxUf,['RO','AM','PA','TO','GO','MS']) <> -1) then continue;
    if (curUf = 'MS') and (IndexStr(proxUf,['MT','GO','MG','SP','PR']) <> -1) then continue;
    if (curUf = 'MG') and (IndexStr(proxUf,['BA','RS','RJ','ES','SP','MS','GO']) <> -1) then continue;
    if (curUf = 'GO') and (IndexStr(proxUf,['TO','BA','MG','MS','MT','DF']) <> -1) then continue;
    if (curUf = 'TO') and (IndexStr(proxUf,['MA','PI','BA','GO','MT','PA']) <> -1) then continue;
    if (curUf = 'DF') and (IndexStr(proxUf,['GO']) <> -1) then continue;
    //Se chegar ao fim e ultima UF ficou cortada (o percurso é impar), validar como true
    if Length(proxUf)<2 then Result := True;
    Exit
  end;
end;

procedure TperCUrso.validarPercClick(Sender: TObject);
begin
  if validRoute(ufIni.Text,ufFim.Text,ufPerc.Text) then
    begin sinal.Color:=clGreen;sinal.Caption:='Valido' end
  else
    begin sinal.Color:=clRed;sinal.Caption:='Invalido' end
end;

end.
