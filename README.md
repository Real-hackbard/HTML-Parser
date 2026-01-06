# HTML-Parser:

</br>

![Compiler](https://github.com/user-attachments/assets/a916143d-3f1b-4e1f-b1e0-1067ef9e0401) ![10 Seattle](https://github.com/user-attachments/assets/c70b7f21-688a-4239-87c9-9a03a8ff25ab) ![10 1 Berlin](https://github.com/user-attachments/assets/bdcd48fc-9f09-4830-b82e-d38c20492362) ![10 2 Tokyo](https://github.com/user-attachments/assets/5bdb9f86-7f44-4f7e-aed2-dd08de170bd5) ![10 3 Rio](https://github.com/user-attachments/assets/e7d09817-54b6-4d71-a373-22ee179cd49c)  ![10 4 Sydney](https://github.com/user-attachments/assets/e75342ca-1e24-4a7e-8fe3-ce22f307d881) ![11 Alexandria](https://github.com/user-attachments/assets/64f150d0-286a-4edd-acab-9f77f92d68ad) ![12 Athens](https://github.com/user-attachments/assets/59700807-6abf-4e6d-9439-5dc70fc0ceca)  
![Components](https://github.com/user-attachments/assets/d6a7a7a4-f10e-4df1-9c4f-b4a1a8db7f0e) ![HTML Parser pas](https://github.com/user-attachments/assets/4383af55-064d-4afc-b593-45179898eee7)  
![Discription](https://github.com/user-attachments/assets/4a778202-1072-463a-bfa3-842226e300af) ![HTML Parser](https://github.com/user-attachments/assets/5fa27685-6f9e-44a2-bac6-4bb7c72212ef)  
![Last Update](https://github.com/user-attachments/assets/e1d05f21-2a01-4ecf-94f3-b7bdff4d44dd) ![012026](https://github.com/user-attachments/assets/ae91e595-2dbf-4d94-b953-81e4fd25dcc3)   
![License](https://github.com/user-attachments/assets/ff71a38b-8813-4a79-8774-09a2f3893b48) ![Freeware](https://github.com/user-attachments/assets/1fea2bbf-b296-4152-badd-e1cdae115c43)  

</br>

Parsing, syntax analysis, or syntactic analysis is a process of analyzing a [string](https://en.wikipedia.org/wiki/String_(computer_science)) of [symbols](https://en.wikipedia.org/wiki/Symbol_(formal)), either in natural language, [computer languages](https://en.wikipedia.org/wiki/Computer_language) or [data structures](https://en.wikipedia.org/wiki/Data_structure), conforming to the rules of a formal grammar by breaking it into parts. The term parsing comes from Latin pars (orationis), meaning part (of speech).

The term has slightly different meanings in different branches of [linguistics](https://en.wikipedia.org/wiki/Linguistics) and [computer science](https://en.wikipedia.org/wiki/Computer_science). Traditional sentence parsing is often performed as a method of understanding the exact meaning of a sentence or word, sometimes with the aid of devices such as sentence diagrams. It usually emphasizes the importance of grammatical divisions such as [subject](https://en.wikipedia.org/wiki/Subject_(grammar)) and predicate.

</br>

![HTMLParser](https://github.com/user-attachments/assets/afb6e6cf-31a7-4ce6-aca4-10c90601807e)

</br>

# Parse Example:

```pascal
FHyperlinks : tStrings; { All Related Document, Local+Remote }
    FImages     : tStrings; { Document in <IMG SRC=...}
    FEmails     : tStrings; { Anchors <A.. with "mailto:"  }
    FHTTPLinks  : tStrings; { Anchors <A.. with "http:"  }
    FFTPLinks   : tStrings; { Anchors <A.. with "ftp:"  }
    FLocalLinks : tStrings; { Anchors <A.. with no protocol }
    FFramePages : tStrings; { <FRAME SRC=... }

    { .. by extension.. }    
    FHTML       : tLocalRemote;  { *.HTM,*.HTML,*.SHTML,*.DHTML }
    FImage      : tLocalRemote;  { *.JPEG, *.GIF, *.TIF .. }
    FMedia      : tLocalRemote;  { *.AVI, *.MP3, *.MPEG ... }
    FJava       : tLocalRemote;  { *.JAVA, *.CLASS, *.JS }
    FActiveX    : tLocalRemote;  { *.CAB .. }
    FASP        : tLocalRemote;  { *.ASP }
    FPHP        : tLocalRemote;  { *.PHP, *.PHP3 ... }
    FPERL       : tLocalRemote;  { *.PL, *.CGI.. }

    FTitle      : String;        { <TITLE>...</TITLE> }
    FKeyword    : String;        { <META NAME="KEYWORD" ... }
    FDescription: String;        { <META NAME="DESCRIPTION" ... }
```

# Types of parsers:
The task of the parser is essentially to determine if and how the input can be derived from the start symbol of the grammar. This can be done in essentially two ways:

* [Top-down parsing](https://en.wikipedia.org/wiki/Top-down_parsing)  
  Top-down parsing can be viewed as an attempt to find left-most derivations of an input-stream by searching for parse trees using a top-down expansion of the given [formal grammar](https://en.wikipedia.org/wiki/Formal_grammar) rules. Tokens are consumed from left to right. Inclusive choice is used to accommodate ambiguity by expanding all alternative right-hand-sides of grammar rules. This is known as the primordial soup approach. Very similar to sentence diagramming, primordial soup breaks down the constituencies of sentences.

* [Bottom-up parsing](https://en.wikipedia.org/wiki/Bottom-up_parsing)
  A parser can start with the input and attempt to rewrite it to the start symbol. Intuitively, the parser attempts to locate the most basic elements, then the elements containing these, and so on. [LR parsers](https://en.wikipedia.org/wiki/LR_parser) are examples of bottom-up parsers. Another term used for this type of parser is [Shift-Reduce](https://en.wikipedia.org/wiki/Shift-reduce_parser) parsing.

# Parser Tags:
In computer science and linguistics, parser tags are markers assigned to words or phrases to describe their grammatical function and structure within a sentence.
Parser tags can be defined in this section, which is located within the component.

```pascal
Procedure   THTMLParser.AddTag(Tag:String);
var
 TagName   : String;
 Hyperlink : String;
 UHyperLink: String;
 MetaName,
 MetaContent : String;
 P,S,Sc,Vr:String;
 Ext      : String;
Begin
 If Buffering then
 Begin
  If Pos(Uppercase(BufferingTT),Uppercase(Tag))=0 then
  Begin
   Buffer:=Buffer+'<'+Tag+'>';
   Exit;
  End;
 End;

 { Remove all trailing spaces }
 Screen.Cursor := crHourGlass;
 Trim(Tag);

 If Pos('!--',Tag)=0 then
   If Assigned(FOnFoundTag) then FOnFoundTag(Self,Tag);

 If Pos(' ',Tag)<>0 then
  TagName:=Uppercase(Copy(Tag,1,Pos(' ',Tag)-1)) else
  TagName:=Uppercase(Tag);

 If TagName='A' then { Anchors }
 Begin
  Hyperlink:=ExtractValue(GetTagAttribute(Tag,'href'));
  UHyperlink:=Uppercase(Hyperlink);
  ParseURL(UHyperlink,P,S,Sc,Vr);

  { Extension Check }
  Ext:=ExtractFileExt(SC);
  If Pos('HTM',Ext)<>0 then
  Begin
   If Pos('HTTPS://',UHyperlink)<>0 then
    FParsed.FHTML.FRemote.Add(Hyperlink) else
    FParsed.FHTML.FLocal.Add(Hyperlink);
  End else
  if ((Ext='.JPG') or
      (Ext='.JPEG') or
      (Ext='.GIF') or
      (Ext='.TIF') or
      (Ext='.PCX') or
      (Ext='.PNG') or
      (Ext='.BMP'))
  then
  Begin
   If Pos('HTTPS://',UHyperlink)<>0 then
    FParsed.FImage.FRemote.Add(Hyperlink) else
    FParsed.FImage.FLocal.Add(Hyperlink);
  End else
  if ((Ext='.AVI') or
      (Ext='.MP3') or
      (Ext='.AU') or
      (Ext='.MOV') or
      (Ext='.MPG') or
      (Ext='.MPEG'))
  then
  Begin
   If Pos('HTTPS://',UHyperlink)<>0 then
    FParsed.FMedia.FRemote.Add(Hyperlink) else
    FParsed.FMedia.FLocal.Add(Hyperlink);
  End else
  if ((Ext='.JS') or
      (Ext='.CLASS') or
      (Ext='.JAVA'))
  then
  Begin
   If Pos('HTTPS://',UHyperlink)<>0 then
    FParsed.FJava.FRemote.Add(Hyperlink) else
    FParsed.FJava.FLocal.Add(Hyperlink);
  End else
  if ((Ext='.ASP'))
  then
  Begin
   If Pos('HTTPS://',UHyperlink)<>0 then
    FParsed.FASP.FRemote.Add(Hyperlink) else
    FParsed.FASP.FLocal.Add(Hyperlink);
  End else
  if ((Ext='.PL') or
      (Ext='.CGI'))
  then
  Begin
   If Pos('HTTPS://',UHyperlink)<>0 then
    FParsed.FPERL.FRemote.Add(Hyperlink) else
    FParsed.FPERL.FLocal.Add(Hyperlink);
  End else
  If Pos('PHP',Ext)<>0
  then
  Begin
   If Pos('HTTPS://',UHyperlink)<>0 then
    FParsed.FPHP.FRemote.Add(Hyperlink) else
    FParsed.FPHP.FLocal.Add(Hyperlink);
  End else
  if ((Ext='.CAB'))
  then
  Begin
   If Pos('HTTPS://',UHyperlink)<>0 then
    FParsed.FActiveX.FRemote.Add(Hyperlink) else
    FParsed.FActiveX.FLocal.Add(Hyperlink);
  End;

  If Pos('MAILTO:',Uppercase(hyperlink))<>0 then
  begin
   FParsed.FEmails.Add(Copy(Hyperlink,8,Length(Hyperlink)-7));
  end else

  If Pos('FTP://',UHyperlink)<>0 then
  begin
   FParsed.FFTPLinks.Add(Hyperlink);
  end else

  If Pos('HTTPS://',UHyperlink)<>0 then
  begin
   FParsed.FHTTPLinks.Add(Hyperlink);
  end else

  If Pos('://',UHyperlink)=0 then
  begin
   FParsed.FLocalLinks.Add(Hyperlink);
  end else

  If Assigned(FOnFoundHyperlink) then FOnFoundHyperlink(Self,Hyperlink);
  FParsed.FHyperlinks.Add(Hyperlink);
 End else

 If TagName='IMG' then { Image }
 Begin
  FParsed.FImages.Add(ExtractValue(GetTagAttribute(Tag,'src')));
 End else

 If TagName='FRAME' then { Frame }
 Begin
  FParsed.FFramePages.Add(ExtractValue(GetTagAttribute(Tag,'src')));
 End else

 If TagName='META' then { Meta }
 Begin
  MetaName:=Uppercase(ExtractValue(GetTagAttribute(Tag,'name')));
  MetaContent:=ExtractValue(GetTagAttribute(Tag,'content'));

  If MetaName='KEYWORD' then
   FParsed.FKeyword:=MetaContent else
  if MetaName='DESCRIPTION' then
   FParsed.FDescription:=MetaContent;
 End else

 If TagName='!--' then { Comment }
 Begin
  If Assigned(FOnFoundComment) then FOnFoundComment(Self,Copy(Tag,5,Length(Tag)-3-4));
  { <!-- Comment --> }
 End else
 
 If (TagName='TITLE') then { Title }
 Begin
  Buffering:=True;
  BufferingTT := '/TITLE';
 End else

 If (TagName='/TITLE') then
 Begin
  Buffering:=False;
  BufferingTT:='';
  FParsed.FTitle:=Buffer;
  Buffer:='';
 End;
End;
```

# Parser development software:
Some of the well known parser development tools include the following:

* [ANTLR](https://en.wikipedia.org/wiki/ANTLR)
* [Bison](https://en.wikipedia.org/wiki/GNU_Bison)
* [Coco/R](https://en.wikipedia.org/wiki/Coco/R)
* [Definite clause grammar](https://en.wikipedia.org/wiki/Definite_clause_grammar)
* [GOLD](https://en.wikipedia.org/wiki/GOLD_(parser))
* [JavaCC](https://en.wikipedia.org/wiki/JavaCC)
* Lemon
* Lex
* LuZc
* Parboiled
* Parsec
* Ragel
* Spirit Parser Framework
* Syntax Definition Formalism
* SYNTAX
* XPL
* Yacc

