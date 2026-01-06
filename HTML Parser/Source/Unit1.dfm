object Form1: TForm1
  Left = 192
  Top = 107
  Caption = 'HTML Parser'
  ClientHeight = 498
  ClientWidth = 733
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 733
    Height = 50
    Align = alTop
    BevelOuter = bvNone
    Color = clWindow
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 729
    object Label2: TLabel
      Left = 24
      Top = 6
      Width = 159
      Height = 39
      Caption = 'HTML Parser'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -32
      Font.Name = 'Impact'
      Font.Style = []
      ParentFont = False
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 50
    Width = 161
    Height = 429
    Align = alLeft
    BevelOuter = bvNone
    Color = clWindow
    ParentBackground = False
    TabOrder = 1
    ExplicitHeight = 428
    object Label1: TLabel
      Left = 11
      Top = 64
      Width = 63
      Height = 13
      Caption = 'Parse Mode :'
    end
    object Button1: TButton
      Left = 8
      Top = 21
      Width = 55
      Height = 25
      Caption = '&HTML'
      TabOrder = 0
      TabStop = False
      OnClick = Button1Click
    end
    object ComboBox1: TComboBox
      Left = 8
      Top = 80
      Width = 145
      Height = 21
      Style = csDropDownList
      DropDownCount = 20
      ItemIndex = 0
      TabOrder = 1
      TabStop = False
      Text = 'Hyperlinks'
      Items.Strings = (
        'Hyperlinks'
        'Images'
        'eMails'
        'HTTP'
        'HTML Locallinks'
        'HTML Remote'
        'FTP Links'
        'Frame Pages'
        'Java Locallinks'
        'Java Remote'
        'PHP Locallinks'
        'PHP Remote'
        'PERL Locallinks'
        'PERL Remote'
        'Media Locallinks'
        'Media Remote'
        'ActiveX Locallinks'
        'ActiveX Remote'
        'ASP Locallinks'
        'ASP Remote')
    end
    object Button8: TButton
      Left = 11
      Top = 392
      Width = 75
      Height = 25
      Caption = 'Parse'
      TabOrder = 2
      TabStop = False
      OnClick = Button8Click
    end
    object RadioGroup1: TRadioGroup
      Left = 10
      Top = 120
      Width = 145
      Height = 193
      Caption = ' Unicode '
      ItemIndex = 7
      Items.Strings = (
        'UTF-7'
        'UTF-8'
        'UTF-16 LE'
        'UTF-16 BE'
        'UTF-8 Boom'
        'ANSi'
        'ASCii'
        'Default')
      TabOrder = 3
      OnClick = RadioGroup1Click
    end
    object Button2: TButton
      Left = 69
      Top = 21
      Width = 40
      Height = 25
      Caption = 'Font'
      TabOrder = 4
      TabStop = False
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 115
      Top = 21
      Width = 40
      Height = 25
      Caption = 'Clear'
      TabOrder = 5
      TabStop = False
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 11
      Top = 361
      Width = 75
      Height = 25
      Caption = 'Search'
      TabOrder = 6
      TabStop = False
      OnClick = Button4Click
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 479
    Width = 733
    Height = 19
    Panels = <
      item
        Text = 'HTML Parsing :'
        Width = 90
      end
      item
        Text = '0 of 0'
        Width = 120
      end
      item
        Text = 'Found :'
        Width = 50
      end
      item
        Text = '0'
        Width = 60
      end
      item
        Text = 'Comment :'
        Width = 70
      end
      item
        Width = 50
      end>
    ExplicitTop = 478
    ExplicitWidth = 729
  end
  object Panel3: TPanel
    Left = 161
    Top = 50
    Width = 572
    Height = 429
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 3
    ExplicitWidth = 568
    ExplicitHeight = 428
    object Memo1: TMemo
      Left = 0
      Top = 0
      Width = 572
      Height = 412
      TabStop = False
      Align = alClient
      BorderStyle = bsNone
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 0
      ExplicitWidth = 568
      ExplicitHeight = 411
    end
    object Panel4: TPanel
      Left = 0
      Top = 412
      Width = 572
      Height = 17
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitTop = 411
      ExplicitWidth = 568
      object ProgressBar1: TProgressBar
        Left = 0
        Top = 0
        Width = 572
        Height = 17
        Align = alClient
        TabOrder = 0
        ExplicitWidth = 568
      end
    end
  end
  object HTMLParser1: THTMLParser
    OnFoundComment = HTMLParser1FoundComment
    OnParsing = HTMLParser1Parsing
    Left = 368
    Top = 80
  end
  object OpenDialog: TOpenDialog
    DefaultExt = '*.html'
    Filter = 'HTML Files|*.htm;*.html'
    Left = 272
    Top = 80
  end
  object FontDialog1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Left = 448
    Top = 80
  end
  object FindDialog1: TFindDialog
    OnFind = FindDialog1Find
    Left = 544
    Top = 88
  end
end
