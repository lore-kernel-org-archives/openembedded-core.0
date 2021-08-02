Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web09.2334.1627947495822225684
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Aug 2021 16:38:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Nc1jrIIC;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: sjolley.yp.pm@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id c16so21524875plh.7
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Aug 2021 16:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version:thread-index
         :content-language:importance;
        bh=7Uyl1tj0Zk/Yz881Ar3eu6rchaHdBgJKaCisH/Bmoro=;
        b=Nc1jrIICtbB1gmM7D45ANLEKjKGuZeqNW4bvc5pyIDLe02XPaoZOEgiseSKr+ykVXy
         TsfRNlub4ZKk7r8Nc7wMUIB5BPQGldeYfabIX3IfEfsemIDmCzvIGzeCurfUeUv8K//s
         5NJD/FUNganfd3q5/l3j4A4HiRX7XHKj67PydJrGVw4bUWJnW7gGlHy83PN3uNaZ1gEU
         DGIyEOkmF4/+iPzuP2IfiWEdxGjECGIhqWP4wLU6Q/rG53QENQ3KrBhUUMDNaxlSg6KS
         bio4FwyTjkXltpMJdd5NZmTTyOzOOWgRbVlrSSJRP6uKVkiHq/U4MiC4FvPdD3D5gPRI
         eW6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :thread-index:content-language:importance;
        bh=7Uyl1tj0Zk/Yz881Ar3eu6rchaHdBgJKaCisH/Bmoro=;
        b=A4/qZmm6fWOQ0d8MDablBjbu16xXpn56axM9FdnMVHPK/RHMNXoWm9cB+GF2XV4H7s
         O1fbKFVTn5pdKN99SLvqjg+UQKEpnivEcnCu9iL/BdiLGscK5IwGHcTa70KrlibEvuAc
         LmAlsc5fRiBKhXuoxlfI4dy0WBCheGb4Epw23XitR5ZCqrikgbxTQVBennW0gt5PbayH
         GQanUQCNJpZJ0F2g8UqFabvUcpXuZHverO2Nd98EoT2dn+NS29Nc11106xYSIuk19n1o
         Gm+hOI7BX+NID1Po8Oi1OcQq9TRF+m2sjnNx4PFyL9zEoSeGRBBnxZq+1gp01JNYBUQ6
         qZVQ==
X-Gm-Message-State: AOAM533tn5esDxtgPhyvuKQXk+PpXA+pMPDn2veIu2qhzSQ2gweBLP3R
	xoa67EsQpMg3E/8gD+LiIXaiajVD5Q4=
X-Google-Smtp-Source: ABdhPJztxgflNm6615cLhSGh4n/iJtqmJjdtlTtZGAmeLeq3hStaTP0HSPnZeyEl6w6i95sY6v0zmQ==
X-Received: by 2002:a65:6441:: with SMTP id s1mr4609387pgv.214.1627947495142;
        Mon, 02 Aug 2021 16:38:15 -0700 (PDT)
Return-Path: <sjolley.yp.pm@gmail.com>
Received: from skjolley ([2600:8800:1d98:5b00:ac14:3ef3:9d9b:956b])
        by smtp.gmail.com with ESMTPSA id g7sm7861151pfv.66.2021.08.02.16.38.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Aug 2021 16:38:14 -0700 (PDT)
From: "Stephen Jolley" <sjolley.yp.pm@gmail.com>
To: <yocto@yoctoproject.org>,
	<openembedded-core@lists.openembedded.org>
Subject: Reminder: Yocto Project Technical Team Meeting @ Monthly from 8am on the first Tuesday (PDT)
Date: Mon, 2 Aug 2021 16:38:14 -0700
Message-ID: <061201d787f7$7738ec10$65aac430$@gmail.com>
MIME-Version: 1.0
X-Priority: 1 (Highest)
X-MSMail-Priority: High
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHrGAlvi/D59k9A4KKz/99QhsCkLQ==
Importance: High
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0613_01D787BC.CADBE8D0"
Content-Language: en-us

------=_NextPart_000_0613_01D787BC.CADBE8D0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

All,

 

Just a reminder we will hold the monthly Yocto Project Technical Meeting at
8am PST tomorrow. (8/3)  

 

Yocto Project Technical Team Meeting: We encourage people attending the
meeting to logon and announce themselves on the Yocto Project IRC chancel
during the meeting (optional):

Yocto IRC: https://web.libera.chat/#yocto 

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

 


------=_NextPart_000_0613_01D787BC.CADBE8D0
Content-Type: text/html;
	boundary="----=_NextPart_000_1003_01D77701.77467DA0";
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
PST tomorrow. (8/3)&nbsp; <o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'text-autospace:none'><span =
style=3D'color:#1F497D'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal =
style=3D'text-autospace:none'><span style=3D'color:#1F497D'>Yocto =
Project Technical Team Meeting: We encourage people attending the =
meeting to logon and announce themselves on the Yocto Project IRC =
chancel during the meeting (optional):</span><span =
style=3D'font-size:12.0pt;font-family:"Times New =
Roman",serif'><o:p></o:p></span></p><p><span =
style=3D'color:#1F497D'>Yocto IRC: </span><a =
href=3D"https://web.libera.chat/#yocto">https://web.libera.chat/#yocto</a=
><span style=3D'color:#1F497D'>&nbsp;</span><o:p></o:p></p><p =
class=3DMsoNormal style=3D'text-autospace:none'><span =
style=3D'color:#1F497D'>Wiki: </span><a =
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
Serif",serif;color:teal'>&nbsp;&nbsp;&nbsp; </span><b><span =
style=3D'font-size:8.0pt;font-family:"Comic Sans =
MS";color:teal'>Cell</span></b><span =
style=3D'font-size:9.0pt;font-family:"MS Sans =
Serif",serif;color:teal'>:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span><span =
style=3D'font-size:9.0pt;font-family:"MS Sans Serif",serif'>(208) =
244-4460<span style=3D'color:black'><o:p></o:p></span></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:9.0pt;font-family:Wingdings'>* </span><b><span =
lang=3DFR style=3D'font-size:8.0pt;font-family:"Comic Sans =
MS";color:teal'>Email</span></b><span lang=3DFR =
style=3D'font-size:9.0pt;font-family:"MS Sans =
Serif",serif;color:teal'>:</span><span lang=3DFR =
style=3D'font-size:9.0pt;font-family:"MS Sans =
Serif",serif'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;<u><span style=3D'color:blue'><a =
href=3D"mailto:sjolley.yp.pm@gmail.com">sjolley.yp.pm@gmail.com</a></span=
></u></span><span lang=3DFR =
style=3D'font-size:12.0pt;font-family:"Arial",sans-serif'><o:p></o:p></sp=
an></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p></div></body></html>

------=_NextPart_000_0613_01D787BC.CADBE8D0--
