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







