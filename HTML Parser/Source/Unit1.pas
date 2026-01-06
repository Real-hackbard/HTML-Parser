unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ComCtrls, Vcl.Shell.ShellCtrls, HTMLParser, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    HTMLParser1: THTMLParser;
    OpenDialog: TOpenDialog;
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    StatusBar1: TStatusBar;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Button8: TButton;
    Label1: TLabel;
    RadioGroup1: TRadioGroup;
    Button2: TButton;
    Button3: TButton;
    FontDialog1: TFontDialog;
    FindDialog1: TFindDialog;
    Button4: TButton;
    Panel3: TPanel;
    Memo1: TMemo;
    Panel4: TPanel;
    ProgressBar1: TProgressBar;
    procedure Button1Click(Sender: TObject);
    procedure HTMLParser1Parsing(Sender: TObject; Lines, Total: Integer);
    procedure HTMLParser1FoundComment(Sender: TObject; Comment: String);
    procedure Button8Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FindDialog1Find(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure disable;
    procedure enable;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}
procedure TForm1.disable;
begin
  Button1.Enabled := false;
  Button2.Enabled := false;
  Button3.Enabled := false;
  Button4.Enabled := false;
  Button8.Enabled := false;
  RadioGroup1.Enabled := false;
  ComboBox1.Enabled := false;
end;

procedure TForm1.enable;
begin
  Button1.Enabled := true;
  Button2.Enabled := true;
  Button3.Enabled := true;
  Button4.Enabled := true;
  Button8.Enabled := true;
  RadioGroup1.Enabled := true;
  ComboBox1.Enabled := true;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
 if OpenDialog.Execute then
 begin
  Memo1.Clear;
  disable;
  HTMLParser1.HTML.Clear;
  HTMLParser1.HTML.LoadFromFile(OpenDialog.Filename);
  HTMLParser1.Execute;
  Application.ProcessMessages;
 end;
 Button8.Click;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if FontDialog1.Execute then Memo1.Font := FontDialog1.Font;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if Memo1.Lines.Count = 0 then
  begin
    MessageDlg('No Data to clear..',mtInformation, [mbOK], 0);
    Exit;
  end;
  Memo1.Clear;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  if Memo1.Lines.Count = 0 then
  begin
    MessageDlg('No Data to search..',mtInformation, [mbOK], 0);
    Exit;
  end;
  FindDialog1.Execute;
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  Memo1.Lines.Clear;
  Screen.Cursor := crHourGlass;
  case ComboBox1.ItemIndex of
   0 :  Memo1.Lines.Assign(HTMLparser1.Parsed.Hyperlinks);
   1 : Memo1.Lines.Assign(HTMLparser1.Parsed.Images);
   2 : Memo1.Lines.Assign(HTMLparser1.Parsed.Emails);
   3 : Memo1.Lines.Assign(HTMLparser1.Parsed.HTTPLinks);
   4 : Memo1.Lines.Assign(HTMLparser1.Parsed.HTML.Local);
   5 : Memo1.Lines.Assign(HTMLparser1.Parsed.HTML.Remote);
   6 : Memo1.Lines.Assign(HTMLparser1.Parsed.FTPlinks);
   7 : Memo1.Lines.Assign(HTMLparser1.Parsed.FramePages);
   8 : Memo1.Lines.Assign(HTMLparser1.Parsed.Java.Local);
   9 : Memo1.Lines.Assign(HTMLparser1.Parsed.Java.Remote);
   10 : Memo1.Lines.Assign(HTMLparser1.Parsed.PHP.Local);
   11 : Memo1.Lines.Assign(HTMLparser1.Parsed.PHP.Remote);
   12 : Memo1.Lines.Assign(HTMLparser1.Parsed.PERL.Local);
   13 : Memo1.Lines.Assign(HTMLparser1.Parsed.PERL.Remote);
   14 : Memo1.Lines.Assign(HTMLparser1.Parsed.Media.Local);
   15 : Memo1.Lines.Assign(HTMLparser1.Parsed.Media.Remote);
   16 : Memo1.Lines.Assign(HTMLparser1.Parsed.ActiveX.Local);
   17 : Memo1.Lines.Assign(HTMLparser1.Parsed.ActiveX.Remote);
   18 : Memo1.Lines.Assign(HTMLparser1.Parsed.ASP.Local);
   19 : Memo1.Lines.Assign(HTMLparser1.Parsed.ASP.Remote);
  end;
  StatusBar1.Panels[3].Text := IntToStr(Memo1.Lines.Count);
  Screen.Cursor := crDefault;
  Memo1.Lines.SaveToFile(ExtractFilePath(Application.ExeName) +
                          'Data\Backup\backup.txt');
  RadioGroup1.OnClick(sender);
end;

procedure TForm1.FindDialog1Find(Sender: TObject);
const
  TWordSeperators: set of Char = ['A'..'Z', 'a'..'z', 'ö', 'Ö', 'Ä', 'ä', 'ü', 'Ü', 'ß',
  '´', '`', '@', '0'..'9'];
var
  Buffer: String;
  CmpText: String;
  Position: Integer;
  Counter: Integer;
  Left, Right: Boolean;
  Hit: Boolean;
begin
  if not (frMatchCase in Finddialog1.Options) then
  begin
    CmpText:=AnsiUpperCase(Finddialog1.FindText);
    Buffer := AnsiUpperCase(Copy(Memo1.Text, Memo1.SelStart+Memo1.SelLength+1,
      Length(Memo1.Text)))
  end
  else
  begin
    CmpText := Finddialog1.FindText;
    Buffer:=Copy(Memo1.Text,Memo1.SelStart+Memo1.SelLength+1,Length(Memo1.Text));
  end;

  Position:=AnsiPos(CmpText, Buffer);

  if Position > 0 then
  begin
    if frWholeWord in FindDialog1.Options then
    begin
      Counter:=0;
      Position:=AnsiPos(CmpText, Buffer);
      Hit:=False;
      while (Position > 0) and not Hit do
      begin
        Left:=(Position = 1) or (not (Buffer[Position-1] in TWordSeperators));
        Right:=(Position+Length(Finddialog1.FindText) >= Length(Buffer)) or
          (not (Buffer[Position+Length(Finddialog1.FindText)] in TWordSeperators));
        Hit:=Left and Right;
        Inc(Counter, Position);
        Delete(Buffer, 1, Position);
        Position:=Pos(CmpText, Buffer);
      end;

      if Hit then
      begin
        Memo1.SelStart:= Memo1.SelStart+Memo1.SelLength+Counter-1;
        Memo1.SelLength:= Length(Finddialog1.FindText);
      end
      else
        FindDialog1.CloseDialog;
    end
    else
    begin
      Memo1.SelStart:= Memo1.SelStart+Memo1.SelLength+Position-1;
      Memo1.SelLength:= Length(Finddialog1.FindText);
    end;
  end
  else
    FindDialog1.CloseDialog;
  Memo1.SetFocus;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  DoubleBuffered := true;
  Memo1.MaxLength := $7FFFFFF0;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  StatusBar1.SetFocus;
end;

procedure TForm1.HTMLParser1Parsing(Sender: TObject; Lines,
  Total: Integer);
begin
  StatusBar1.Panels[1].Text := Format('%d of %d',[Lines,Total]);
  Application.ProcessMessages;
end;

procedure TForm1.RadioGroup1Click(Sender: TObject);
const
  UTF8BOM: array[0..2] of Byte = ($EF, $BB, $BF);
var
  links : TStringList;
  UTF8Str: UTF8String;
  FS: TFileStream;
begin
  Screen.Cursor := crHourGlass;
  Memo1.Clear;
  Memo1.Lines.LoadFromFile(ExtractFilePath(Application.ExeName) +'Data\Backup\backup.txt');
  Sleep(50);

  case RadioGroup1.ItemIndex of
  0 : begin
        try
          links  := TStringList.Create();
          links.Text := (Memo1.Text);
          links.SaveToFile(ExtractFilePath(Application.ExeName) +
                          'Data\Encoding\list.txt', TEncoding.UTF7);
          Memo1.Lines.LoadFromFile(ExtractFilePath(Application.ExeName) +
                          'Data\Encoding\list.txt');
        finally
          Sleep(50);
          links.Free;
        end;
      end;

  1 : begin
        try
          links  := TStringList.Create();
          links.Text := (Memo1.Text);
          links.SaveToFile(ExtractFilePath(Application.ExeName) +
                          'Data\Encoding\list.txt', TEncoding.UTF8);
          Memo1.Lines.LoadFromFile(ExtractFilePath(Application.ExeName) +
                          'Data\Encoding\list.txt');
        finally
          Sleep(50);
          links.Free;
        end;
      end;

  2 : begin
        try
          links  := TStringList.Create();
          links.Text := (Memo1.Text);
          links.SaveToFile(ExtractFilePath(Application.ExeName) +
                          'Data\Encoding\list.txt', TEncoding.Unicode);
          Memo1.Lines.LoadFromFile(ExtractFilePath(Application.ExeName) +
                          'Data\Encoding\list.txt');
        finally
          Sleep(50);
          links.Free;
        end;
      end;

  3 : begin
        try
          links  := TStringList.Create();
          links.Text := (Memo1.Text);
          links.SaveToFile(ExtractFilePath(Application.ExeName) +
                          'Data\Encoding\list.txt', TEncoding.BigEndianUnicode);
          Memo1.Lines.LoadFromFile(ExtractFilePath(Application.ExeName) +
                          'Data\Encoding\list.txt');
        finally
          Sleep(50);
          links.Free;
        end;
      end;

  4 : begin
        UTF8Str := UTF8Encode(Memo1.Text);
        FS := TFileStream.Create(ExtractFilePath(Application.ExeName) +
                                'Data\Encoding\list.txt', fmCreate);
        try
          FS.WriteBuffer(UTF8BOM[0], SizeOf(UTF8BOM));
          FS.WriteBuffer(PAnsiChar(UTF8Str)^, Length(UTF8Str));
        finally
          FS.Free;
        end;
        Memo1.Lines.LoadFromFile(ExtractFilePath(Application.ExeName) +
                                'Data\Encoding\list.txt');
        Sleep(50);
      end;

  5 : begin
        try
          links  := TStringList.Create();
          links.Text := (Memo1.Text);
          links.SaveToFile(ExtractFilePath(Application.ExeName) +
                          'Data\Encoding\list.txt', TEncoding.ANSI);
          Memo1.Lines.LoadFromFile(ExtractFilePath(Application.ExeName) +
                          'Data\Encoding\list.txt');
        finally
          Sleep(50);
          links.Free;
        end;
      end;

  6 : begin
        try
          links  := TStringList.Create();
          links.Text := (Memo1.Text);
          links.SaveToFile(ExtractFilePath(Application.ExeName) +
                          'Data\Encoding\list.txt', TEncoding.ASCII);
          Memo1.Lines.LoadFromFile(ExtractFilePath(Application.ExeName) +
                          'Data\Encoding\list.txt');
        finally
          Sleep(50);
          links.Free;
        end;
      end;

  7 : begin
        try
          links  := TStringList.Create();
          links.Text := (Memo1.Text);
          links.SaveToFile(ExtractFilePath(Application.ExeName) +
                          'Data\Encoding\list.txt', TEncoding.Default);
          Memo1.Lines.LoadFromFile(ExtractFilePath(Application.ExeName) +
                          'Data\Encoding\list.txt');
        finally
          Sleep(50);
          links.Free;
        end;
      end;

  end;
  Screen.Cursor := crDefault;
end;

procedure TForm1.HTMLParser1FoundComment(Sender: TObject; Comment: String);
begin
  StatusBar1.Panels[5].Text := (Comment+'" on line #'+
                                InttoStr(HTMLParser1.CurrentLine));
  Application.ProcessMessages;
end;

end.
