Received: from mail1.bemta3.messagelabs.com ([195.245.230.166])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nick.lewis@usa.g4s.com>) id 1UV2SY-0002hv-J5
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 18:22:18 +0200
Received: from [85.158.137.19:28796] by server-6.bemta-3.messagelabs.com id
	A9/F8-11048-D0108715; Wed, 24 Apr 2013 15:58:05 +0000
X-Env-Sender: nick.lewis@usa.g4s.com
X-Msg-Ref: server-4.tower-39.messagelabs.com!1366819084!14861557!1
X-Originating-IP: [89.206.228.155]
X-StarScan-Received: 
X-StarScan-Version: 6.8.6.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29556 invoked from network); 24 Apr 2013 15:58:05 -0000
Received: from unallocated.star.net.uk (HELO gbtwk10s037.Technology.local)
	(89.206.228.155)
	by server-4.tower-39.messagelabs.com with RC4-SHA encrypted SMTP;
	24 Apr 2013 15:58:05 -0000
Received: from GBTWK10E001.Technology.local ([10.234.1.29]) by
	gbtwk10s037.Technology.local ([10.234.1.39]) with mapi; Wed, 24 Apr 2013
	16:58:04 +0100
From: "Lewis, Nick" <nick.lewis@usa.g4s.com>
To: "'openembedded-core@lists.openembedded.org'"
	<openembedded-core@lists.openembedded.org>
Date: Wed, 24 Apr 2013 16:58:03 +0100
Thread-Topic: Problems with PACKAGE_CLASSES = "package_tar"
Thread-Index: Ac5BBId+DytEcH4tRSmwV/oknaE//w==
Message-ID: <AAE0766F5AF36B46BAB7E0EFB927320630E4A540CC@GBTWK10E001.Technology.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Problems with PACKAGE_CLASSES = "package_tar"
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Apr 2013 16:22:18 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_AAE0766F5AF36B46BAB7E0EFB927320630E4A540CCGBTWK10E001Te_"

--_000_AAE0766F5AF36B46BAB7E0EFB927320630E4A540CCGBTWK10E001Te_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I am seeing problems when using PACKAGE_CLASSES =3D "package_tar"



There are many warnings about python indents and there are errors regarding=
 missing populate_sdk_tar.bbclass and rootfs_tar.bbclass



--

Nick


Nick Lewis
nick.lewis@usa.g4s.com<mailto:nick.lewis@usa.g4s.com>
+44 1684 277137<tel:+441684277137>
www.g4stechnology.com<http://www.g4stechnology.com/>
New Challenge House, International Drive, Tewkesbury, Gloucestershire, GL20=
 8UQ, UK

P Please consider the environment before printing this email


________________________________
The details of this company are as follows:
G4S Technology Limited, Registered Office: Challenge House, International D=
rive, Tewkesbury, Gloucestershire GL20 8UQ, Registered in England No. 23823=
38.

This communication may contain information which is confidential, personal =
and/or privileged.

It is for the exclusive use of the intended recipient(s).
If you are not the intended recipient(s), please note that any distribution=
, forwarding, copying or use of this communication or the information in it=
 is strictly prohibited.

Any personal views expressed in this e-mail are those of the individual sen=
der and the company does not endorse or accept responsibility for them.

Prior to taking any action based upon this e-mail message, you should seek =
appropriate confirmation of its authenticity.

This e-mail has been scanned for all viruses by MessageLabs.

--_000_AAE0766F5AF36B46BAB7E0EFB927320630E4A540CCGBTWK10E001Te_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 12 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
@font-face
	{font-family:Webdings;
	panose-1:5 3 1 2 1 5 9 6 7 3;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:10.5pt;
	font-family:Consolas;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:Consolas;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-GB" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoPlainText">I am seeing problems when using PACKAGE_CLASSES =
=3D &quot;package_tar&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">There are many warnings about python indents and =
there are errors regarding missing populate_sdk_tar.bbclass and rootfs_tar.=
bbclass<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">-- <o:p></o:p></p>
<p class=3D"MsoPlainText">Nick<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Arial&quot;,&quot;sans-serif&quot;;color:black">Nick Lewis<o:p></o:p></spa=
n></b></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,&quot;sans-serif&quot;;color:black"><a href=3D"mailto:nick.lewis@=
usa.g4s.com">nick.lewis@usa.g4s.com</a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,&quot;sans-serif&quot;;color:black"><a href=3D"tel:&#43;441684277=
137">&#43;44 1684 277137</a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><a href=3D"http://www.g4stechnology.com/">www.g4stec=
hnology.com</a><o:p></o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#1F497D">New Cha=
llenge House, International Drive, Tewkesbury, Gloucestershire, GL20 8UQ, U=
K<o:p></o:p></span></p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:Webdi=
ngs;color:#00B050"><o:p>&nbsp;</o:p></span></b></p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:Webdi=
ngs;color:#00B050">P</span></b><b><span style=3D"font-size:10.0pt;font-fami=
ly:&quot;Arial&quot;,&quot;sans-serif&quot;;color:#00B050"> Please consider=
 the environment before printing this email</span></b><b><span style=3D"fon=
t-family:&quot;Arial&quot;,&quot;sans-serif&quot;;color:#00B050"><o:p></o:p=
></span></b></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<br>
<hr>
<font face=3D"Arial" color=3D"Gray" size=3D"1">The details of this company =
are as follows:<br>
G4S Technology Limited, Registered Office: Challenge House, International D=
rive, Tewkesbury, Gloucestershire GL20 8UQ, Registered in England No. 23823=
38.<br>
<br>
This communication may contain information which is confidential, personal =
and/or privileged.<br>
<br>
It is for the exclusive use of the intended recipient(s).<br>
If you are not the intended recipient(s), please note that any distribution=
, forwarding, copying or use of this communication or the information in it=
 is strictly prohibited.<br>
<br>
Any personal views expressed in this e-mail are those of the individual sen=
der and the company does not endorse or accept responsibility for them.<br>
<br>
Prior to taking any action based upon this e-mail message, you should seek =
appropriate confirmation of its authenticity.<br>
<br>
This e-mail has been scanned for all viruses by MessageLabs.<br>
</font>
</body>
</html>

--_000_AAE0766F5AF36B46BAB7E0EFB927320630E4A540CCGBTWK10E001Te_--
