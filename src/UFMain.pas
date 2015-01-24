unit UFMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls;

type
  TFMain = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    BTeach: TButton;
    BRecognition: TButton;
    BClear: TButton;
    Image1: TImage;
    BPicture: TButton;
    Label1: TLabel;
    Label2: TLabel;
    TrackBar1: TTrackBar;
    Label3: TLabel;
    Edit1: TEdit;
    procedure Panel1Click(Sender: TObject);
    procedure BTeachClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BRecognitionClick(Sender: TObject);
    procedure BClearClick(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure BPictureClick(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMain: TFMain;

implementation

{$R *.dfm}
uses
  UPerseptron;

var
Perceptron: UPerseptron.TRPerseptron;
h: byte;
AllowPaint: boolean;
PX,PY: integer;

procedure TFMain.BClearClick(Sender: TObject);
begin
  Panel1.Caption:='0';
  Panel2.Caption:='0';
  Panel3.Caption:='0';
  Panel4.Caption:='0';
  Panel5.Caption:='0';
  Panel6.Caption:='0';
  Panel7.Caption:='0';
  Panel8.Caption:='0';
  Panel9.Caption:='0';
  Panel10.Caption:='0';
  Panel11.Caption:='0';
  Panel12.Caption:='0';
  Panel1.Tag:=0;
  Panel2.Tag:=0;
  Panel3.Tag:=0;
  Panel4.Tag:=0;
  Panel5.Tag:=0;
  Panel6.Tag:=0;
  Panel7.Tag:=0;
  Panel8.Tag:=0;
  Panel9.Tag:=0;
  Panel10.Tag:=0;
  Panel11.Tag:=0;
  Panel12.Tag:=0;
  AllowPaint:=false;
  Image1.Canvas.Pen.Color:=clWhite;
  Image1.Canvas.Rectangle(0,0,Image1.Width,Image1.Height);
  Image1.Canvas.Pen.Width:=TrackBar1.Position;
  Image1.Canvas.Pen.Color:=clBlack;
end;

procedure TFMain.BPictureClick(Sender: TObject);
var
ACaption: array [1..4,1..3] of word;
max: word;
i,j: LongWord;
PI,PJ: byte;
begin
  for i:=0 to Image1.Height-1 do
  begin
  
    if i<Image1.Height/4 then
      PI:=1
    else
      if i<Image1.Height/2 then
        PI:=2
      else
        if i<Image1.Height*3/4 then
          PI:=3
        else
          PI:=4;
        

    for j:=0 to Image1.Width-1 do
    begin
      if j<Image1.Width/3 then
        PJ:=1
      else
        if j<Image1.Width*2/3 then
          PJ:=2
        else
          PJ:=3;
      if Image1.Canvas.Pixels[j,i]<>clWhite then
        ACaption[PI,PJ]:=ACaption[PI,PJ]+1;

      {case PI of
      1:Image1.Canvas.Pixels[j,i]:=clBlack;
      2:Image1.Canvas.Pixels[j,i]:=clGreen;
      3:Image1.Canvas.Pixels[j,i]:=clYellow;
      4:Image1.Canvas.Pixels[j,i]:=clRed;
      end;}

    end;
  end;

  max:=ACaption[1,1];
  for i:=1 to 4 do
    for j:=1 to 3 do
      if max<ACaption[i,j] then
        max:=ACaption[i,j];

  ///
  ///  Нормализация матрицы рецепторов
  ///
  if max>0 then
    for i:=1 to 4 do
      for j:=1 to 3 do
        ACaption[i,j]:=round((100*ACaption[i,j])/max);

  Panel1.Caption:=inttostr(ACaption[1,1]);
  Panel2.Caption:=inttostr(ACaption[1,2]);
  Panel3.Caption:=inttostr(ACaption[1,3]);
  Panel4.Caption:=inttostr(ACaption[2,1]);
  Panel5.Caption:=inttostr(ACaption[2,2]);
  Panel6.Caption:=inttostr(ACaption[2,3]);
  Panel7.Caption:=inttostr(ACaption[3,1]);
  Panel8.Caption:=inttostr(ACaption[3,2]);
  Panel9.Caption:=inttostr(ACaption[3,3]);
  Panel10.Caption:=inttostr(ACaption[4,1]);
  Panel11.Caption:=inttostr(ACaption[4,2]);
  Panel12.Caption:=inttostr(ACaption[4,3]);

  Panel1.Tag:=ACaption[1,1];
  Panel2.Tag:=ACaption[1,2];
  Panel3.Tag:=ACaption[1,3];
  Panel4.Tag:=ACaption[2,1];
  Panel5.Tag:=ACaption[2,2];
  Panel6.Tag:=ACaption[2,3];
  Panel7.Tag:=ACaption[3,1];
  Panel8.Tag:=ACaption[3,2];
  Panel9.Tag:=ACaption[3,3];
  Panel10.Tag:=ACaption[4,1];
  Panel11.Tag:=ACaption[4,2];
  Panel12.Tag:=ACaption[4,3];
    
end;

procedure TFMain.BRecognitionClick(Sender: TObject);
var
i,j: word;
max,p: word;
begin
  BPictureClick(Sender);
  for i:=1 to Perceptron.PResult do
    Perceptron.AResult[i]:=0;


  for j:=1 to Perceptron.PResult do
    if strtoint(Panel1.Caption)>h then
      Perceptron.AResult[j]:=Perceptron.AResult[j]+Perceptron.AConnections[j,1];

  for j:=1 to Perceptron.PResult do
      if strtoint(Panel2.Caption)>h then
        Perceptron.AResult[j]:=Perceptron.AResult[j]+Perceptron.AConnections[j,2];

  for j:=1 to Perceptron.PResult do
      if strtoint(Panel3.Caption)>h then
        Perceptron.AResult[j]:=Perceptron.AResult[j]+Perceptron.AConnections[j,3];

  for j:=1 to Perceptron.PResult do
      if strtoint(Panel4.Caption)>h then
        Perceptron.AResult[j]:=Perceptron.AResult[j]+Perceptron.AConnections[j,4];

  for j:=1 to Perceptron.PResult do
      if strtoint(Panel5.Caption)>h then
        Perceptron.AResult[j]:=Perceptron.AResult[j]+Perceptron.AConnections[j,5];

  for j:=1 to Perceptron.PResult do
      if strtoint(Panel6.Caption)>h then
        Perceptron.AResult[j]:=Perceptron.AResult[j]+Perceptron.AConnections[j,6];

  for j:=1 to Perceptron.PResult do
      if strtoint(Panel7.Caption)>h then
        Perceptron.AResult[j]:=Perceptron.AResult[j]+Perceptron.AConnections[j,7];

  for j:=1 to Perceptron.PResult do
      if strtoint(Panel8.Caption)>h then
        Perceptron.AResult[j]:=Perceptron.AResult[j]+Perceptron.AConnections[j,8];

  for j:=1 to Perceptron.PResult do
      if strtoint(Panel9.Caption)>h then
        Perceptron.AResult[j]:=Perceptron.AResult[j]+Perceptron.AConnections[j,9];

  for j:=1 to Perceptron.PResult do
      if strtoint(Panel10.Caption)>h then
        Perceptron.AResult[j]:=Perceptron.AResult[j]+Perceptron.AConnections[j,10];

  for j:=1 to Perceptron.PResult do
      if strtoint(Panel11.Caption)>h then
        Perceptron.AResult[j]:=Perceptron.AResult[j]+Perceptron.AConnections[j,11];

  for j:=1 to Perceptron.PResult do
      if strtoint(Panel12.Caption)>h then
        Perceptron.AResult[j]:=Perceptron.AResult[j]+Perceptron.AConnections[j,12];

  max:=Perceptron.AResult[1]; p:=1;
  for i:=1 to Perceptron.PResult do
    if max<Perceptron.AResult[i] then
    begin
      max:=Perceptron.AResult[i];
      p:=i;
    end;

  ShowMessage('Это символ '+Perceptron.ASymbols[p]);
end;

procedure TFMain.BTeachClick(Sender: TObject);
var
str: string;
i: word;
begin
  BPictureClick(Sender);
  str:='';
  if InputQuery('Это символ','Введите данные',str) then
  begin
    ///
    ///  Начать обучение
    ///
    inc(Perceptron.PResult);
    Perceptron.ASymbols[Perceptron.PResult]:=str;
    if strtoint(Panel1.Caption)>h then
      Perceptron.AConnections[Perceptron.PResult,1]:=strtoint(Panel1.Caption);
    if strtoint(Panel2.Caption)>h then
      Perceptron.AConnections[Perceptron.PResult,2]:=strtoint(Panel2.Caption);
    if strtoint(Panel3.Caption)>h then
      Perceptron.AConnections[Perceptron.PResult,3]:=strtoint(Panel3.Caption);
    if strtoint(Panel4.Caption)>h then
      Perceptron.AConnections[Perceptron.PResult,4]:=strtoint(Panel4.Caption);
    if strtoint(Panel5.Caption)>h then
      Perceptron.AConnections[Perceptron.PResult,5]:=strtoint(Panel5.Caption);
    if strtoint(Panel6.Caption)>h then
      Perceptron.AConnections[Perceptron.PResult,6]:=strtoint(Panel6.Caption);
    if strtoint(Panel7.Caption)>h then
      Perceptron.AConnections[Perceptron.PResult,7]:=strtoint(Panel7.Caption);
    if strtoint(Panel8.Caption)>h then
      Perceptron.AConnections[Perceptron.PResult,8]:=strtoint(Panel8.Caption);
    if strtoint(Panel9.Caption)>h then
      Perceptron.AConnections[Perceptron.PResult,9]:=strtoint(Panel9.Caption);
    if strtoint(Panel10.Caption)>h then
      Perceptron.AConnections[Perceptron.PResult,10]:=strtoint(Panel10.Caption);
    if strtoint(Panel11.Caption)>h then
      Perceptron.AConnections[Perceptron.PResult,11]:=strtoint(Panel11.Caption);
    if strtoint(Panel12.Caption)>h then
    Perceptron.AConnections[Perceptron.PResult,12]:=strtoint(Panel12.Caption);
  end;

  Label2.Caption:='';
  for i:=1 to Perceptron.PResult do
    Label2.Caption:=Label2.Caption+Perceptron.ASymbols[i];


end;

procedure TFMain.Edit1Change(Sender: TObject);
begin
  try
    h:=strtoint(Edit1.Text);
  except

  end;
end;

procedure TFMain.FormCreate(Sender: TObject);
begin
  Perceptron.PResult:=0;
  BClearClick(Sender);
  h:=strtoint(Edit1.Text);
end;

procedure TFMain.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  AllowPaint:=true;
  PX:=X; PY:=Y;
end;

procedure TFMain.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if AllowPaint then
  begin
    Image1.Canvas.MoveTo(PX,PY);
    Image1.Canvas.LineTo(X,Y);
    PX:=X; PY:=Y;
  end;
end;

procedure TFMain.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  AllowPaint:=false;
end;

procedure TFMain.Panel1Click(Sender: TObject);
begin
  TPanel(Sender).Tag:=TPanel(Sender).Tag+10;
  if TPanel(Sender).Tag>100 then
    TPanel(Sender).Tag:=0;
  TPanel(Sender).Caption:=inttostr(TPanel(Sender).Tag);
end;

procedure TFMain.TrackBar1Change(Sender: TObject);
begin
  Image1.Canvas.Pen.Width:=TrackBar1.Position;
end;

end.
