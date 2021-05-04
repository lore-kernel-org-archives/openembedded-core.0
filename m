Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web08.3584.1620089999268769550
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 May 2021 17:59:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Gd9Ur0VH;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id y32so5172003pga.11
        for <openembedded-core@lists.openembedded.org>; Mon, 03 May 2021 17:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version:thread-index
         :content-language:importance;
        bh=r3pWvpLdmMD7pmCls+gsZ2Y/cKkZodPU6jkxjmw42g8=;
        b=Gd9Ur0VHhnBkct8CcNh8aCHrPmzwfSvVzTk25zQ6lkK5efV3sXMUOCInSqvBvXkYkK
         WxIsXFyZbxKi5rv+n3eho3fPlhpzgdR1qotDp4wMzLHS6EBhHkIieNSPe+MvGI2LarIP
         HkCmv4hMMaB5V8QZuBNIWUkTAVnTqk0kYq5qEpMcM6q5fEJvUMXpzH5spT4NNLXqLB+8
         E217wzJigWk9YkX2WNylcQbHYFkoVsv3Px4u2be58MA5doy4O1YDy/V2J+DhQi7ZnxFA
         deY8dU1OiXVuP4nKjL5vnBeG6HZgd4L0UTT1lan/exjXFBlk6aYVMi/o/ZuJZfEQHup4
         0oJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :thread-index:content-language:importance;
        bh=r3pWvpLdmMD7pmCls+gsZ2Y/cKkZodPU6jkxjmw42g8=;
        b=tZZaOn+I3aylZd7JxTVyr4s2fJyu9vBguQkWMNEQUS8kzzCd6OThLb3jQZW5TOBIFM
         S68G7opOaM++g6agbRtheZbhuqWHFePsqaPafPYzTGiVbQ+oXcXDDY1JFBdw8zIjQrrE
         ZbhiRPe0wVOzuVPUFP8slSqyZj8Oji5iueNmAf8G4gcwAnhjM4NiIwCjWlOoOiSbIkHY
         V5UccTtvWn42egEb7wnJ4D8/3fuiceFO6waqPaLLwrZaBhSptVrBFLHVCNEYJC+R+JU2
         k553Klea9JuE4gpRAl5oCDNhgamx1jniLtC55Y/2PcH8lSHstrR35Wf6cE4zYuXW7l+Z
         Sv6A==
X-Gm-Message-State: AOAM533EoL4E/E7cphKj+Cl7Ed6giUX6EAYsQZo7UqSrDfoV7CmnpQXy
	mmtx+QyCpxZZcEpfUDCtmhCQtUhg9LY=
X-Google-Smtp-Source: ABdhPJxOc5hp59dWdDK+LLOWAXRDZpPLkHPwBRcQKGbFHXM08MuJ/3csJPgxVklN2zTJpJJErwWMXg==
X-Received: by 2002:a17:90b:958:: with SMTP id dw24mr1604593pjb.185.1620089998168;
        Mon, 03 May 2021 17:59:58 -0700 (PDT)
Return-Path: <sjolley.yp.pm@gmail.com>
Received: from skjolley (wsip-72-194-163-85.ph.ph.cox.net. [72.194.163.85])
        by smtp.gmail.com with ESMTPSA id cm22sm11151059pjb.32.2021.05.03.17.59.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 May 2021 17:59:57 -0700 (PDT)
From: "Stephen Jolley" <sjolley.yp.pm@gmail.com>
To: <yocto@yoctoproject.org>,
	<openembedded-core@lists.openembedded.org>
Subject: Reminder: Yocto Project Technical Team Meeting @ Monthly from 8am on the first Tuesday (PDT)
Date: Mon, 3 May 2021 17:59:57 -0700
Message-ID: <13f001d74080$cdfde8c0$69f9ba40$@gmail.com>
MIME-Version: 1.0
X-Priority: 1 (Highest)
X-MSMail-Priority: High
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQLY9KgT92zWYjC8iNx7PzS6emF3ng==
Importance: High
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_13F1_01D74046.219FD410"
Content-Language: en-us

------=_NextPart_000_13F1_01D74046.219FD410
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

All,

 

Just a reminder we will hold the monthly Yocto Project Technical Meeting at
8am PST tomorrow. (5/4)  

 

Yocto Project Technical Team Meeting: We encourage people attending the
meeting to logon and announce themselves on the Yocto Project IRC chancel
during the meeting (optional):

Yocto IRC: http://webchat.freenode.net/?channels=#yocto

 

Wiki: https://www.yoctoproject.org/public-virtual-meetings/

 

When            Monthly from 8am to 9am on the first Tuesday Pacific Time

Where           Zoom Meeting:
https://zoom.us/j/990892712?pwd=cHU1MjhoM2x6ck81bkcrYjRrcmJsUT09

 

We are tracking the minutes at:
https://docs.google.com/document/d/1ly8nyhO14kDNnFcW2QskANXW3ZT7QwKC5wWVDg9d
DH4/edit?pli=1 Please request access if you want to assist in editing them.
The world should have view access. 

 

Thanks,

 

Stephen K. Jolley

Yocto Project Program Manager

*    Cell:                (208) 244-4460

* Email:              sjolley.yp.pm@gmail.com
<mailto:sjolley.yp.pm@gmail.com> 

 


------=_NextPart_000_13F1_01D74046.219FD410
Content-Type: text/html;
	boundary="----=_NextPart_000_0973_01D72A5D.A2EDAF50";
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><meta =
http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii"><meta name=3DGenerator content=3D"Microsoft Word 15 =
(filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"Comic Sans MS";
	panose-1:3 15 7 2 3 3 2 2 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:"MS Sans Serif";
	panose-1:0 0 0 0 0 0 0 0 0 0;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle18
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US =
link=3D"#0563C1" vlink=3D"#954F72" style=3D'word-wrap:break-word'><div =
class=3DWordSection1><p class=3DMsoNormal =
style=3D'text-autospace:none'><span =
style=3D'color:#1F497D'>All,</span><span =
style=3D'font-size:12.0pt;font-family:"Times New =
Roman",serif'><o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'text-autospace:none'><span =
style=3D'color:#1F497D'>&nbsp;</span><span =
style=3D'font-size:12.0pt;font-family:"Times New =
Roman",serif'><o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'text-autospace:none'><span style=3D'color:#1F497D'>Just a =
reminder we will hold the monthly Yocto Project Technical Meeting at 8am =
PST tomorrow. (5/4)&nbsp; <o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'text-autospace:none'><span =
style=3D'color:#1F497D'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal =
style=3D'text-autospace:none'><span style=3D'color:#1F497D'>Yocto =
Project Technical Team Meeting: We encourage people attending the =
meeting to logon and announce themselves on the Yocto Project IRC =
chancel during the meeting (optional):</span><span =
style=3D'font-size:12.0pt;font-family:"Times New =
Roman",serif'><o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'text-autospace:none'><span style=3D'color:#1F497D'>Yocto IRC: =
</span><a =
href=3D"http://webchat.freenode.net/?channels=3D#yocto">http://webchat.fr=
eenode.net/?channels=3D#yocto</a><span =
style=3D'font-size:12.0pt;font-family:"Times New =
Roman",serif'><o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'text-autospace:none'><span =
style=3D'color:#1F497D'>&nbsp;</span><span =
style=3D'font-size:12.0pt;font-family:"Times New =
Roman",serif'><o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'text-autospace:none'><span style=3D'color:#1F497D'>Wiki: =
</span><a =
href=3D"https://www.yoctoproject.org/public-virtual-meetings/">https://ww=
w.yoctoproject.org/public-virtual-meetings/</a><span =
style=3D'font-size:12.0pt;font-family:"Times New =
Roman",serif'><o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'text-autospace:none'><span =
style=3D'color:#1F497D'>&nbsp;</span><span =
style=3D'font-size:12.0pt;font-family:"Times New =
Roman",serif'><o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'text-autospace:none'><span =
style=3D'color:#1F497D'>When&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; Monthly from 8am to 9am on the first Tuesday =
Pacific Time</span><span style=3D'font-size:12.0pt;font-family:"Times =
New Roman",serif'><o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'text-autospace:none'><span =
style=3D'color:#1F497D'>Where&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; Zoom Meeting: <a =
href=3D"https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT0=
9">https://zoom.us/j/990892712?pwd=3DcHU1MjhoM2x6ck81bkcrYjRrcmJsUT09</a>=
<o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'text-autospace:none'><span =
style=3D'color:#1F497D'>&nbsp;</span><span =
style=3D'font-size:12.0pt;font-family:"Times New =
Roman",serif'><o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'text-autospace:none'><span style=3D'color:#1F497D'>We are =
tracking the minutes at: </span><a =
href=3D"https://docs.google.com/document/d/1ly8nyhO14kDNnFcW2QskANXW3ZT7Q=
wKC5wWVDg9dDH4/edit?pli=3D1">https://docs.google.com/document/d/1ly8nyhO1=
4kDNnFcW2QskANXW3ZT7QwKC5wWVDg9dDH4/edit?pli=3D1</a><span =
style=3D'color:#1F497D'> Please request access if you want to assist in =
editing them.&nbsp; The world should have view access. </span><span =
style=3D'font-size:12.0pt;font-family:"Times New =
Roman",serif'><o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'text-autospace:none'><span =
style=3D'color:#1F497D'>&nbsp;</span><span =
style=3D'font-size:12.0pt;font-family:"Times New =
Roman",serif'><o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'text-autospace:none'><span =
style=3D'color:#1F497D'>Thanks,</span><span =
style=3D'font-size:12.0pt;font-family:"Times New =
Roman",serif'><o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'text-autospace:none'><o:p>&nbsp;</o:p></p><p class=3DMsoNormal =
style=3D'page-break-after:avoid;text-autospace:none'><b><i><span =
style=3D'font-size:16.0pt;font-family:"Times New =
Roman",serif;color:purple'>Stephen K. Jolley</span></i></b><b><i><span =
style=3D'font-size:16.0pt;font-family:"Tahoma",sans-serif;color:purple'><=
o:p></o:p></span></i></b></p><p class=3DMsoNormal><b><span =
style=3D'font-size:8.0pt;font-family:"Courier New";color:blue'>Yocto =
Project Program Manager<o:p></o:p></span></b></p><p =
class=3DMsoNormal><span =
style=3D'font-size:9.0pt;font-family:Wingdings;color:black'>(</span><span=
 style=3D'font-size:9.0pt;font-family:"MS Sans =
Serif";color:teal'>&nbsp;&nbsp;&nbsp; </span><b><span =
style=3D'font-size:8.0pt;font-family:"Comic Sans =
MS";color:teal'>Cell</span></b><span =
style=3D'font-size:9.0pt;font-family:"MS Sans =
Serif";color:teal'>:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span =
style=3D'font-size:9.0pt;font-family:"MS Sans Serif"'>(208) =
244-4460<span style=3D'color:black'><o:p></o:p></span></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:9.0pt;font-family:Wingdings'>* </span><b><span =
lang=3DFR style=3D'font-size:8.0pt;font-family:"Comic Sans =
MS";color:teal'>Email</span></b><span lang=3DFR =
style=3D'font-size:9.0pt;font-family:"MS Sans =
Serif";color:teal'>:</span><span lang=3DFR =
style=3D'font-size:9.0pt;font-family:"MS Sans =
Serif"'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;<u><span style=3D'color:blue'><a =
href=3D"mailto:sjolley.yp.pm@gmail.com">sjolley.yp.pm@gmail.com</a></span=
></u></span><span lang=3DFR =
style=3D'font-size:12.0pt;font-family:"Arial",sans-serif'><o:p></o:p></sp=
an></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p></div></body></html>

------=_NextPart_000_13F1_01D74046.219FD410--
