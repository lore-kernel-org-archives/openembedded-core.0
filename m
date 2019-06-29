Return-Path: <sjolley.yp.pm@gmail.com>
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
	[209.85.160.172])
	by mail.openembedded.org (Postfix) with ESMTP id 1DAED7BD9A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jun 2019 16:11:49 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id d17so9886554qtj.8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Jun 2019 09:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version:content-language
	:thread-index; bh=J3AOLSgYvP0SILIttafbLD2KMeZgBlDm5BNwHd5tpjw=;
	b=uaJJSnRC4GjE1FJPj8bIZ7hUuUnFwNt/RV9s1FQG27XkB+FMxqwJ+LZAbQjNmbHaji
	WeBJTKupksvZuchVzE7Zz8LqXdJmHO1diERPcgsRBl9h8Ov4XCGkiw7WD7z0Q1aUPTIr
	n+DOEl9BMO2Q6dV2KM9PdB52DsBNpQlCk7wheEhpHOlbRDYvaqddrFvLpuFEQoNg1oyc
	HUSMmBaX0QgcJR6RxGrStIJZLM0mB0V9E2w1QOgYyVxH5Rse8eXKSx2Fwe7BjiaKWmqh
	Sq97a7duqFAqX+27w4j6UeMLS2Y619sYhpDDC02lNSX3ji+J+qS3z0qSj57xUYTOam+P
	mwYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-language:thread-index;
	bh=J3AOLSgYvP0SILIttafbLD2KMeZgBlDm5BNwHd5tpjw=;
	b=tdSBZr8aODJvAnFAgObZjchc6SphPMA7HDAj3q7YKu/4rc88KOh64IQh/OUseGbOVF
	aeJCJe7/rc3tZWvaSqSceKX8iqn4bQfN42Oqua2EoFcqPiIdrK0edlQ1rmvz75642z4d
	nsgVLvBTk7Rgax7S24Cb4bopELT4S0BT9wIeulx4enXT9kq/JuIWE+u90jvLogHCNPPV
	KwU+L+Nl8CGIUmpm4aWYm5vjCUHNPZ3x70KWYHvi3swfunfCEVM6PfAkqoZbBiY3r/9m
	iieGn9pejX7HjKvhCxEDmnSEv+YHMIS+W5cQFrl8PWe6Es/aP7U0MeChKBLOL0DTP7Wi
	ocdg==
X-Gm-Message-State: APjAAAUlaWxsp23z1nhhVv2dTZGHcJ9AKxqgqsEzkLhGMIBNDHQWH4lk
	a3Wm4LKi5E5954g92DGu2JcfhZAC
X-Google-Smtp-Source: APXvYqwhlO3HZMpCXuZGOUpqiPMgf4FuVLHdOiKJUm88XdTXKrvHMI5QQWMk6SyahdXAHHtpGL3lEQ==
X-Received: by 2002:ac8:34c5:: with SMTP id x5mr12562360qtb.91.1561824710843; 
	Sat, 29 Jun 2019 09:11:50 -0700 (PDT)
Received: from sjolley ([96.79.126.57]) by smtp.gmail.com with ESMTPSA id
	z12sm2354824qkf.20.2019.06.29.09.11.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 29 Jun 2019 09:11:50 -0700 (PDT)
From: <sjolley.yp.pm@gmail.com>
To: <yocto@yoctoproject.org>,
	<openembedded-core@lists.openembedded.org>
Date: Sat, 29 Jun 2019 09:11:48 -0700
Message-ID: <0aa501d52e95$5bd1ab50$137501f0$@gmail.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdUulHiMDOJvjny5Q4CWfv36gSkFtQ==
Subject: Meetings next week.
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
X-List-Received-Date: Sat, 29 Jun 2019 16:11:50 -0000
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0AA6_01D52E5A.AF734880"
Content-Language: en-us

------=_NextPart_000_0AA6_01D52E5A.AF734880
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

All,

 

Due to the 4th of July holiday next week.  Some meetings will be changed.

 

Triage will be canceled on the 4th..  Next Bug Triage meeting Thursday will
be July 11th at 7:30am PDT (https://zoom.us/j/454367603)

Monthly Project Meeting will still be Tuesday July 2nd at 8am PDT (
<https://zoom.us/j/990892712> https://zoom.us/j/990892712) 

 

Thanks,

 

Stephen K. Jolley

Yocto Project Project Manager

*    Cell:                (208) 244-4460

* Email:               <mailto:sjolley.yp.pm@gmail.com>
sjolley.yp.pm@gmail.com

 


------=_NextPart_000_0AA6_01D52E5A.AF734880
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:o=3D"urn:schemas-microsoft-com:office:office" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" =
xmlns=3D"http://www.w3.org/TR/REC-html40"><head><META =
HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
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
	{font-family:"MS Sans Serif";
	panose-1:0 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Comic Sans MS";
	panose-1:3 15 7 2 3 3 2 2 2 4;}
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
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:2072726791;
	mso-list-template-ids:-1990839192;}
@list l0:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US =
link=3D"#0563C1" vlink=3D"#954F72"><div class=3DWordSection1><p =
class=3DMsoNormal><span =
style=3D'font-family:"Arial",sans-serif;color:black'>All,<o:p></o:p></spa=
n></p><p class=3DMsoNormal><span =
style=3D'font-family:"Arial",sans-serif;color:black'><o:p>&nbsp;</o:p></s=
pan></p><p class=3DMsoNormal><span =
style=3D'font-family:"Arial",sans-serif;color:black'>Due to the 4th of =
July holiday next week.&nbsp; Some meetings will be =
changed.<o:p></o:p></span></p><p class=3DMsoNormal><span =
style=3D'font-family:"Arial",sans-serif;color:black'><o:p>&nbsp;</o:p></s=
pan></p><p class=3DMsoNormal><span =
style=3D'font-family:"Arial",sans-serif;color:black'>Triage will be =
canceled on the 4<sup>th</sup>..&nbsp; Next Bug Triage meeting Thursday =
will be July 11th at 7:30am PDT (<a =
href=3D"https://zoom.us/j/454367603">https://zoom.us/j/454367603</a>)<o:p=
></o:p></span></p><p =
style=3D'margin:0in;margin-bottom:.0001pt;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif;color:black'>Monthly Project =
Meeting will still be Tuesday July 2nd at 8am PDT (<a =
href=3D"https://zoom.us/j/990892712"><span =
style=3D'color:#1155CC'>https://zoom.us/j/990892712)</span></a>&nbsp;<o:p=
></o:p></span></p><p =
style=3D'margin:0in;margin-bottom:.0001pt;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif;color:black'><o:p>&nbsp;</o:p></s=
pan></p><p =
style=3D'margin:0in;margin-bottom:.0001pt;vertical-align:baseline'><span =
style=3D'font-family:"Arial",sans-serif;color:black'>Thanks,<o:p></o:p></=
span></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal =
style=3D'page-break-after:avoid;text-autospace:none'><b><i><span =
style=3D'font-size:16.0pt;font-family:"Times New =
Roman",serif;color:purple'>Stephen K. Jolley</span></i></b><b><i><span =
style=3D'font-size:16.0pt;font-family:"Tahoma",sans-serif;color:purple'><=
o:p></o:p></span></i></b></p><p class=3DMsoNormal><b><span =
style=3D'font-size:8.0pt;font-family:"Courier New";color:blue'>Yocto =
Project Project Manager<o:p></o:p></span></b></p><p =
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
244-4460</span><span style=3D'font-size:9.0pt;font-family:"MS Sans =
Serif",serif;color:black'><o:p></o:p></span></p><p =
class=3DMsoNormal><span =
style=3D'font-size:9.0pt;font-family:Wingdings'>* </span><b><span =
lang=3DFR style=3D'font-size:8.0pt;font-family:"Comic Sans =
MS";color:teal'>Email</span></b><span lang=3DFR =
style=3D'font-size:9.0pt;font-family:"MS Sans =
Serif",serif;color:teal'>:</span><span lang=3DFR =
style=3D'font-size:9.0pt;font-family:"MS Sans =
Serif",serif'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;<u><span style=3D'color:blue'><a =
href=3D"mailto:sjolley.yp.pm@gmail.com"><span =
style=3D'color:#0563C1'>sjolley.yp.pm@gmail.com</span></a></span></u></sp=
an><span lang=3DFR =
style=3D'font-size:12.0pt;font-family:"Arial",sans-serif'><o:p></o:p></sp=
an></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p></div></body></html>

------=_NextPart_000_0AA6_01D52E5A.AF734880--
