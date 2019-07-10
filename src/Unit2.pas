unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Global,Rest, JsonObject, ExtCtrls;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Panel1: TPanel;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Memo2: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
var
rest: HCkRest;
glob: HCkGlobal;
success: Boolean;
bTls: Boolean;
port: Integer;
bAutoReconnect: Boolean;
responseJson: PWideChar;
json: HCkJsonObject;

begin
glob := CkGlobal_Create();
success := CkGlobal_UnlockBundle(glob,'service on');

rest := CkRest_Create();

success := CkRest_SetAuthBasic(rest,'AC045ce2419c87020d649cdfe9b115b496','79325e20059c8415ceb542b70cc4506a');

bTls := True;
port := 443;
bAutoReconnect := True;
success := CkRest_Connect(rest,'api.twilio.com',port,bTls,bAutoReconnect);
if (success <> True) then
  begin
    Memo1.Lines.Add(CkRest__lastErrorText(rest));
    Exit;
  end;

success := CkRest_AddQueryParam(rest,'To', PWideChar(Edit1.Text));
success := CkRest_AddQueryParam(rest,'From','+12029155319');
success := CkRest_AddQueryParam(rest,'Body', PWideChar(Memo2.Lines.GetText));

responseJson := CkRest__fullRequestFormUrlEncoded(rest,'POST','/2010-04-01/Accounts/AC045ce2419c87020d649cdfe9b115b496/Messages.json');
if (CkRest_getLastMethodSuccess(rest) <> True) then
  begin
    Memo1.Lines.Add(CkRest__lastErrorText(rest));
    Exit;
  end;

if (CkRest_getResponseStatusCode(rest) <> 201) then
  begin
    Memo1.Lines.Add('response status code = ' + IntToStr(CkRest_getResponseStatusCode(rest)));
    Memo1.Lines.Add('response status text = ' + CkRest__responseStatusText(rest));
    Memo1.Lines.Add('response header: ' + CkRest__responseHeader(rest));
    Memo1.Lines.Add('response body (if any): ' + responseJson);
    Memo1.Lines.Add('---');
    Memo1.Lines.Add('LastRequestStartLine: ' + CkRest__lastRequestStartLine(rest));
    Memo1.Lines.Add('LastRequestHeader: ' + CkRest__lastRequestHeader(rest));
    Exit;
  end;

json := CkJsonObject_Create();
CkJsonObject_putEmitCompact(json,False);
success := CkJsonObject_Load(json,responseJson);

Memo1.Lines.Add(CkJsonObject__emit(json));

Memo1.Lines.Add('sid: ' + CkJsonObject__stringOf(json,'sid'));
Memo1.Lines.Add('body: ' + CkJsonObject__stringOf(json,'body'));

Memo1.Lines.Add('Success.');

CkRest_Dispose(rest);
CkJsonObject_Dispose(json);

end;

end.
