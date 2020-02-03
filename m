Return-Path: <sjolley.yp.pm@gmail.com>
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 1E96C610A8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2020 17:37:38 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id j15so1139266pgm.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Feb 2020 09:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version:content-language
	:thread-index; bh=ju5sZ33SsJcW8/IwlGQwy9IQySfAOSttrGqkv2goKN4=;
	b=eM/9BsbYKd2aWIU64IOKJmWKylCTVAkoKKUnaXgAJSDLRVPbmdPwII/y8O9cgeewDX
	0ymLAxFSGero4iFlM0A1vR7rqdZQlYXpiQrC5fFRPRo6H6s7ofagvipUCW+QUd7rAAHb
	Vmwr0/U+HTwNAPZgYNO6ufd0zVxUjeyeNVaahLJtrkk/TZD1AzTg+hp5fsuimAc2rJ7R
	TyHcX+7/4Uqatz1pPA9UfwzA/F85E1fQuSZV6wPB15CQeAD2gffQDvf88/jwArC2Xwc8
	m5EJD93+4CXXTMA0PEQPQp9HGOxHra4ToviVuSvPdcnKi2pApUKVPu4C0/3wGazlRx1G
	PfcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-language:thread-index;
	bh=ju5sZ33SsJcW8/IwlGQwy9IQySfAOSttrGqkv2goKN4=;
	b=S1n1qWfbOpZ23qNvG2QRbwTWi2sjydRWTUqxdi/8uU1oJ0csJ4ldliQuUkPdJdXCHj
	aY9mw1Umi2NZ3YIFM7Q+dVUb4VT55VUae2R0DEXJoChZ6kzQXzFqYNYSAv/RyPw3KaGx
	MWqROYnFyXU1VMf1ZsYwpAKRu16/Mu4/gG6QlXiPLwhn8iVlbTn/2dUBHmnx4UsnaGDZ
	gv2aOeZWtywJ9FmbBQhFEbCjQZ9XAOyRGFSX7ODImE0/cxjF6kd2K+3jChKnQoQn5Bcp
	s93L6AlkQgG/gGwJ8XmLItojvzpOI16rgMg4il1UkhdUgqYsq4OfH0awuQMd72u4cqqe
	P9Nw==
X-Gm-Message-State: APjAAAU5Y5Zy2EQe4QUPW0m/qYyjVZxDHSl684Xt7gkEbMnBH5iIfR0T
	yJsKaymBCubYfTS7EsGcX333IRl/
X-Google-Smtp-Source: APXvYqwng+v4uxoeRYnEibJFNJOLlojj2SFUtTxbTeN8IYsbwpagVSLzg4eH4BGZb9AbKaJVwSedCQ==
X-Received: by 2002:a62:3892:: with SMTP id
	f140mr25235248pfa.190.1580751459029; 
	Mon, 03 Feb 2020 09:37:39 -0800 (PST)
Received: from skjolley (c-71-59-136-149.hsd1.or.comcast.net. [71.59.136.149])
	by smtp.gmail.com with ESMTPSA id
	p18sm444909pjo.3.2020.02.03.09.37.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 03 Feb 2020 09:37:38 -0800 (PST)
From: <sjolley.yp.pm@gmail.com>
To: <yocto@yoctoproject.org>,
	<openembedded-core@lists.openembedded.org>
Date: Mon, 3 Feb 2020 09:37:39 -0800
Message-ID: <077f01d5dab8$a17a92a0$e46fb7e0$@gmail.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQILz6eTgk6qpq/KXRMkJ5it/yXVfg==
Subject: Reminder: Yocto Project Technical Team Meeting @ Monthly from 8am on the first Tuesday (PDT)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Feb 2020 17:37:38 -0000
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0780_01D5DA75.935AD510"
Content-Language: en-us

------=_NextPart_000_0780_01D5DA75.935AD510
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

All,

 

Just a reminder we will hold the monthly Yocto Project Technical Meeting at
8am PST tomorrow. (2/4)  

 

Yocto Project Technical Team Meeting: We encourage people attending the
meeting to logon and announce themselves on the Yocto Project IRC chancel
during the meeting (optional):

Yocto IRC: http://webchat.freenode.net/?channels=#yocto

 

Wiki: https://www.yoctoproject.org/public-virtual-meetings/

 

When            Monthly from 8am to 8:30am on the first Tuesday Pacific Time

Where           Zoom Meeting: https://zoom.us/j/990892712 

 

I am tracking the minutes at:
https://docs.google.com/document/d/1Y5IIuE-z0Ykdl-DwuzUJh52flOZuhN_TSAfw2tdU
9pg/edit?ts=5c06b22d  Please request access if you want to assist in editing
them.  The world should have view access. 

 

Thanks,

 

Stephen K. Jolley

Yocto Project Program Manager

*    Cell:                (208) 244-4460

* Email:              sjolley.yp.pm@gmail.com
<mailto:sjolley.yp.pm@gmail.com> 

 


------=_NextPart_000_0780_01D5DA75.935AD510
Content-Type: text/html;
	boundary="----=_NextPart_000_15ED_01D5C470.8B469E60";
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
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:"Comic Sans MS";
	panose-1:3 15 7 2 3 3 2 2 2 4;}
@font-face
	{font-family:"MS Sans Serif";}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
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
link=3D"#0563C1" vlink=3D"#954F72"><div class=3DWordSection1><p =
class=3DMsoNormal style=3D'text-autospace:none'><span =
style=3D'color:#1F497D'>All,</span><span =
style=3D'font-size:12.0pt;font-family:"Times New =
Roman",serif'><o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'text-autospace:none'><span =
style=3D'color:#1F497D'>&nbsp;</span><span =
style=3D'font-size:12.0pt;font-family:"Times New =
Roman",serif'><o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'text-autospace:none'><span style=3D'color:#1F497D'>Just a =
reminder we will hold the monthly Yocto Project Technical Meeting at 8am =
PST tomorrow. (2/4)&nbsp; <o:p></o:p></span></p><p class=3DMsoNormal =
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
sp;&nbsp;&nbsp;&nbsp; Monthly from 8am to 8:30am on the first Tuesday =
Pacific Time</span><span style=3D'font-size:12.0pt;font-family:"Times =
New Roman",serif'><o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'text-autospace:none'><span =
style=3D'color:#1F497D'>Where&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; Zoom Meeting: </span><a =
href=3D"https://zoom.us/j/990892712">https://zoom.us/j/990892712</a><span=
 style=3D'color:#1F497D'> </span><span =
style=3D'font-size:12.0pt;font-family:"Times New =
Roman",serif'><o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'text-autospace:none'><span =
style=3D'color:#1F497D'>&nbsp;</span><span =
style=3D'font-size:12.0pt;font-family:"Times New =
Roman",serif'><o:p></o:p></span></p><p class=3DMsoNormal =
style=3D'text-autospace:none'><span style=3D'color:#1F497D'>I am =
tracking the minutes at: </span><a =
href=3D"https://docs.google.com/document/d/1Y5IIuE-z0Ykdl-DwuzUJh52flOZuh=
N_TSAfw2tdU9pg/edit?ts=3D5c06b22d">https://docs.google.com/document/d/1Y5=
IIuE-z0Ykdl-DwuzUJh52flOZuhN_TSAfw2tdU9pg/edit?ts=3D5c06b22d</a><span =
style=3D'color:#1F497D'>&nbsp; Please request access if you want to =
assist in editing them.&nbsp; The world should have view access. =
</span><span style=3D'font-size:12.0pt;font-family:"Times New =
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

------=_NextPart_000_0780_01D5DA75.935AD510--
