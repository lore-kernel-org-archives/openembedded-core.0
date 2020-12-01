Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.4079.1606788144107610364
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Nov 2020 18:02:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=o2FnB/dy;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id t37so261907pga.7
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Nov 2020 18:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version:thread-index
         :content-language:importance;
        bh=8pbdue8dUrWKz0oRfF4FAT+BrLQvH3W/YVWZYNw9KaA=;
        b=o2FnB/dyZsAdshx62bWPU/EXt0rXm8Yc/0bioWDUzzB/aW9BmIrlVXh7LQSY76lcm0
         +WHhth1nszEYV1ctDlbiCzY2kc0PZmEQH98j4xaT/crDwY7ZOfvEEeNKVlGYlCki2N4X
         TrztxDUOL1B0TOdf/q/3Oj26BQQ7uyEX1r+ayTP9J2tOnerL7qmxhkW256t0r1ukJjc1
         ezdjd5kp2+wFDySKKJF8JE2LkQsNLBF/WPXzGiEjC53Oysdk8wzne0c1yezw2TSTDyGH
         DRPSwBX7avmW/zfrqiAiJyRPuYBP0a5B7NbAcM146WKtCQ9SZGzIw/6GKGIqkrSHRejh
         oU7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :thread-index:content-language:importance;
        bh=8pbdue8dUrWKz0oRfF4FAT+BrLQvH3W/YVWZYNw9KaA=;
        b=MFayEC4+uYlismCV+w2uXLyQEjil/R1x3Cf5EqKa3dougKe75O19SEa+1VUrldwAdX
         S+g/8NPM8uYAXsBoUOVKRSH0zBHsofHtc2iV8vlUz118ygmftV/q/K+pmPf4IRHfRc2I
         +q9EttdriUuO/2hfoHt4Y8Rjzd7GkNCO9Fogi8BkXLRAyi+15X0orVyDhU9fbtGf5ico
         cJmSAeqzswtUUMGvlQOMtGQd3+iLfo1TTCuT/kJEo9D/7Hh1hAe9yFwQNXBcKZ2VhOie
         nWRcMwe58xavfuo/g9jz+Iyol7Rp3kQ3VSSDtH0+ykD/lW3GmttS3yZWVg6JnTjKUFFv
         vL0Q==
X-Gm-Message-State: AOAM532wzc0MJ1/dRYitKzfTrAUy9cUxmEFHO4NcMXze1Bi2Bq9kqFvb
	LwK+7vxCX2PAZqXKTciTf0u9a323qdY=
X-Google-Smtp-Source: ABdhPJzZWFIgr9pu0BD0HgB/SXvYh2eYTv/aZCnTdeI7YIE1mJTWUQjjbCQHHQ9aft463wpgZ79psQ==
X-Received: by 2002:a63:5849:: with SMTP id i9mr247774pgm.271.1606788143071;
        Mon, 30 Nov 2020 18:02:23 -0800 (PST)
Return-Path: <sjolley.yp.pm@gmail.com>
Received: from skjolley (c-71-59-136-149.hsd1.or.comcast.net. [71.59.136.149])
        by smtp.gmail.com with ESMTPSA id b10sm219250pju.27.2020.11.30.18.02.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Nov 2020 18:02:22 -0800 (PST)
From: "Stephen Jolley" <sjolley.yp.pm@gmail.com>
To: <yocto@yoctoproject.org>,
	<openembedded-core@lists.openembedded.org>
Subject: Reminder: Yocto Project Technical Team Meeting @ Monthly from 8am on the first Tuesday (PDT)
Date: Mon, 30 Nov 2020 18:02:22 -0800
Message-ID: <0bd901d6c786$0263ac40$072b04c0$@gmail.com>
MIME-Version: 1.0
X-Priority: 1 (Highest)
X-MSMail-Priority: High
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQIam5ZNuvONMaCjBhMfovCGWsaj0g==
Importance: High
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0BDA_01D6C742.F4426810"
Content-Language: en-us

------=_NextPart_000_0BDA_01D6C742.F4426810
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

All,

 

Just a reminder we will hold the monthly Yocto Project Technical Meeting at
8am PST tomorrow. (12/1)  

 

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

 


------=_NextPart_000_0BDA_01D6C742.F4426810
Content-Type: text/html;
	boundary="----=_NextPart_000_132C_01D6B126.5F3EE7C0";
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
	{font-family:"MS Sans Serif";}
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
PST tomorrow. (12/1)&nbsp; <o:p></o:p></span></p><p class=3DMsoNormal =
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

------=_NextPart_000_0BDA_01D6C742.F4426810--
