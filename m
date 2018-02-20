Return-Path: <stephen.k.jolley@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9A98E78685
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Feb 2018 16:41:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Feb 2018 08:41:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,540,1511856000"; d="scan'208,217";a="18977757"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
	by fmsmga007.fm.intel.com with ESMTP; 20 Feb 2018 08:41:10 -0800
Received: from fmsmsx121.amr.corp.intel.com (10.18.125.36) by
	FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Tue, 20 Feb 2018 08:41:09 -0800
Received: from fmsmsx111.amr.corp.intel.com ([169.254.12.79]) by
	fmsmsx121.amr.corp.intel.com ([169.254.6.69]) with mapi id
	14.03.0319.002; Tue, 20 Feb 2018 08:41:09 -0800
From: "Jolley, Stephen K" <stephen.k.jolley@intel.com>
To: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: =?Windows-1252?Q?Yocto_Project_Status_WW08=9218?=
Thread-Index: AdOqaZlDzDrckS6fQhGyORwQPxcL8Q==
Date: Tue, 20 Feb 2018 16:41:09 +0000
Message-ID: <9ADD3FDE8B189B4AA2F8A3C711F8155EC725D8FE@fmsmsx111.amr.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.200.107]
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMDk1MTE3ZWYtY2MwNS00MDliLWFkOGEtMTBjYTU1Nzc4OTU3IiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjIuNS4xOCIsIlRydXN0ZWRMYWJlbEhhc2giOiJqZ2IwTzJYbXJoRTIyZThpQ2Z4M2hSUElWMFU1eWtlOGIrVlhWOFdZY0FhTjdzMDVuY0lBOSt5cGRFM2pXSUpyIn0=
dlp-product: dlpe-windows
dlp-version: 11.0.0.116
dlp-reaction: no-action
MIME-Version: 1.0
Subject: =?UTF-8?B?WW9jdG8gUHJvamVjdCBTdGF0dXMgV1cwOOKAmTE4?=
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
X-List-Received-Date: Tue, 20 Feb 2018 16:41:09 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_9ADD3FDE8B189B4AA2F8A3C711F8155EC725D8FEfmsmsx111amrcor_"

--_000_9ADD3FDE8B189B4AA2F8A3C711F8155EC725D8FEfmsmsx111amrcor_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Current Dev Position: YP 2.5 M3 development

Next Deadline: YP 2.5 M3 cut off was 2/19/18

*** FEATURE FREEZE for 2.5 is imminent! ***


SWAT team rotation: Tracy -> Stephano on Feb. 16, 2018.

SWAT team rotation: Stephano -> Maxin John on Feb. 23, 2018

https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team


Key Status/Updates:

  *   YP 2.5 M2 is 97% through QA. See: https://wiki.yoctoproject.org/wiki/=
2.5_QA_Status
  *   YP 2.2.3 is also mostly through QA. See https://wiki.yoctoproject.org=
/wiki/2.2_QA_Status
  *   We build 2.4.2 rc1 however rapidly moving kernel updates combined wit=
h QA not having started on rc1 yet meant we decided to build rc2, pulling i=
n further kernel security fixes (as well as others like openssl). rc2 is cu=
rrently being built and should enter QA today assuming a successful build.
  *   autobuilder.yoctoproject.org continues to be unavailable as we contin=
ue to develop the new autobuilder codebase to replace the current heavily c=
ustomized buildbot one.
  *   We managed to shrink the ltp package size which unblocked some patch =
merging. Bruce has been working on changes to kernel-devsrc to significantl=
y reduce its size.
  *   The glibc change continues to be blocked on locale issues which may p=
rove tricky to resolve and will block M3 as we need the glibc upgrade for v=
arious reasons.
  *   We have some key decisions to make about the conflicting native of pk=
g-conf and pkgconfig. Maxin has a patch series which exposes the issues.
  *   There are problems with the changes to pseudo=92s master branch verse=
s the patches we have against the recipe.
  *   Please note that we are very close to M3 which is feature freeze, tec=
hnically, feature freeze was yesterday. We=92re not in a position to build =
M3 yet but if there are features you expect to see in 2.5, please highlight=
 those patches ASAP. We are drawing up a list of =93must haves=94 for the r=
elease and if we don=92t know about it, it likely won=92t be on it.


Planned upcoming dot releases:

YP 2.4.2 (Rocko) is currently being built and should enter QA today.

YP 2.3.4 (Pyro) will be built when we figure out gcc backports.

YP 2.2.3 (Morty) rc2 is in QA.

YP 2.2.4 (Morty) will be built when we figure out gcc backports.


Key YP 2.5 Dates are:

YP 2.5 M2 cut off is past, it is in QA.

YP 2.5 M2 release of 1/26/18

YP 2.5 M3 cut off of 2/19/18

YP 2.5 M3 release of 3/2/18

YP 2.5 M4 cut off of 4/2/18

YP 2.5 M4 release of 4/27/18


Tracking Metrics:

            WDD 2648 (last week  2610)

(https://wiki.yoctoproject.org/charts/combo.html)


Key Status Links for YP:

https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.5_Status

https://wiki.yoctoproject.org/wiki/Yocto_2.5_Schedule

https://wiki.yoctoproject.org/wiki/Yocto_2.5_Features


The Status reports are now stored on the wiki at: https://wiki.yoctoproject=
.org/wiki/Weekly_Status


[If anyone has suggestions for other information you=92d like to see on thi=
s weekly status update, let us know!]

Thanks,

Stephen K. Jolley
Yocto Project Release Engineer
INTEL, MS JF1-255, 2111 N.E. 25th Avenue, Hillsboro, OR 97124
=95   Work Telephone:       (503) 712-0534
=95    Cell:                (208) 244-4460
=95 Email:                             stephen.k.jolley@intel.com


--_000_9ADD3FDE8B189B4AA2F8A3C711F8155EC725D8FEfmsmsx111amrcor_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
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
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
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
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
p
	{mso-style-priority:99;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:12.0pt;
	font-family:"Times New Roman",serif;}
span.EmailStyle18
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.apple-tab-span
	{mso-style-name:apple-tab-span;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:161700328;
	mso-list-template-ids:-577348530;}
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
@list l1
	{mso-list-id:706876030;
	mso-list-template-ids:608574772;}
@list l1:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l1:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l1:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level9
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
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">Current Dev Position: YP 2.5 M3 dev=
elopment</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">Next Deadline: YP 2.5 M3 cut off wa=
s 2/19/18</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">*** FEATURE FREEZE for 2.5 is immin=
ent! ***</span><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">SWAT team rotation: Tracy -&gt; Ste=
phano on Feb. 16, 2018.</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">SWAT team rotation: Stephano -&gt; =
Maxin John on Feb. 23, 2018</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><a href=3D"https://wiki.yocto=
project.org/wiki/Yocto_Build_Failure_Swat_Team"><span style=3D"font-family:=
Consolas;color:#1155CC">https://wiki.yoctoproject.org/wiki/Yocto_Build_Fail=
ure_Swat_Team</span></a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">Key Status/Updates:</span><o:p></o:=
p></p>
<ul style=3D"margin-top:0in" type=3D"disc">
<li class=3D"MsoNormal" style=3D"color:black;mso-list:l0 level1 lfo3;vertic=
al-align:baseline">
<span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif">Y=
P 2.5 M2 is 97% through QA. See:
<a href=3D"https://wiki.yoctoproject.org/wiki/2.5_QA_Status"><span style=3D=
"color:#1155CC">https://wiki.yoctoproject.org/wiki/2.5_QA_Status</span></a>=
<o:p></o:p></span></li><li class=3D"MsoNormal" style=3D"color:black;mso-lis=
t:l0 level1 lfo3;vertical-align:baseline">
<span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif">Y=
P 2.2.3 is also mostly through QA. See
<a href=3D"https://wiki.yoctoproject.org/wiki/2.2_QA_Status"><span style=3D=
"color:#1155CC">https://wiki.yoctoproject.org/wiki/2.2_QA_Status</span></a>=
<o:p></o:p></span></li><li class=3D"MsoNormal" style=3D"color:black;mso-lis=
t:l0 level1 lfo3;vertical-align:baseline">
<span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif">W=
e build 2.4.2 rc1 however rapidly moving kernel updates combined with QA no=
t having started on rc1 yet meant we decided to build rc2, pulling in furth=
er kernel security fixes (as well as others
 like openssl). rc2 is currently being built and should enter QA today assu=
ming a successful build.<o:p></o:p></span></li><li class=3D"MsoNormal" styl=
e=3D"color:black;mso-list:l0 level1 lfo3;vertical-align:baseline">
<span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif">a=
utobuilder.yoctoproject.org continues to be unavailable as we continue to d=
evelop the new autobuilder codebase to replace the current heavily customiz=
ed buildbot one.<o:p></o:p></span></li><li class=3D"MsoNormal" style=3D"col=
or:black;mso-list:l0 level1 lfo3;vertical-align:baseline">
<span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif">W=
e managed to shrink the ltp package size which unblocked some patch merging=
. Bruce has been working on changes to kernel-devsrc to significantly reduc=
e its size.<o:p></o:p></span></li><li class=3D"MsoNormal" style=3D"color:bl=
ack;mso-list:l0 level1 lfo3;vertical-align:baseline">
<span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif">T=
he glibc change continues to be blocked on locale issues which may prove tr=
icky to resolve and will block M3 as we need the glibc upgrade for various =
reasons.<o:p></o:p></span></li><li class=3D"MsoNormal" style=3D"color:black=
;mso-list:l0 level1 lfo3;vertical-align:baseline">
<span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif">W=
e have some key decisions to make about the conflicting native of pkg-conf =
and pkgconfig. Maxin has a patch series which exposes the issues.<o:p></o:p=
></span></li><li class=3D"MsoNormal" style=3D"color:black;mso-list:l0 level=
1 lfo3;vertical-align:baseline">
<span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif">T=
here are problems with the changes to pseudo=92s master branch verses the p=
atches we have against the recipe.<o:p></o:p></span></li><li class=3D"MsoNo=
rmal" style=3D"color:black;mso-list:l0 level1 lfo3;vertical-align:baseline"=
>
<span style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif">P=
lease note that we are very close to M3 which is feature freeze, technicall=
y, feature freeze was yesterday. We=92re not in a position to build M3 yet =
but if there are features you expect to see in
 2.5, please highlight those patches ASAP. We are drawing up a list of =93m=
ust haves=94 for the release and if we don=92t know about it, it likely won=
=92t be on it.<o:p></o:p></span></li></ul>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">Planned upcoming dot releases:</spa=
n><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">YP 2.4.2 (Rocko) is currently being=
 built and should enter QA today.
</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">YP 2.3.4 (Pyro) will be built when =
we figure out gcc backports.</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">YP 2.2.3 (Morty) rc2 is in QA.</spa=
n><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">YP 2.2.4 (Morty) will be built when=
 we figure out gcc backports.</span><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">Key YP 2.5 Dates are:</span><o:p></=
o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">YP 2.5 M2 cut off is past, it is in=
 QA.</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">YP 2.5 M2 release of 1/26/18</span>=
<o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">YP 2.5 M3 cut off of 2/19/18</span>=
<o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">YP 2.5 M3 release of 3/2/18</span><=
o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">YP 2.5 M4 cut off of 4/2/18</span><=
o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">YP 2.5 M4 release of 4/27/18</span>=
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">Tracking Metrics:</span><o:p></o:p>=
</p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span class=3D"apple-tab-span=
"><span style=3D"font-family:&quot;Arial&quot;,sans-serif;color:black">&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span><span style=3D"font-family:&quot;Arial&quot;,sans-serif;color=
:black">WDD 2648 (last week &nbsp;2610)</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;text-indent:.5in"><span style=
=3D"font-family:Consolas;color:black">(</span><a href=3D"https://wiki.yocto=
project.org/charts/combo.html"><span style=3D"font-family:&quot;Arial&quot;=
,sans-serif;color:#1155CC">https://wiki.yoctoproject.org/charts/combo.html<=
/span></a><span style=3D"font-family:Consolas;color:black">)</span><o:p></o=
:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">Key Status Links for YP:</span><o:p=
></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><a href=3D"https://wiki.yocto=
project.org/wiki/Yocto_Project_v2.5_Status"><span style=3D"font-family:Cons=
olas;color:#1155CC">https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.5_S=
tatus</span></a><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><a href=3D"https://wiki.yocto=
project.org/wiki/Yocto_2.5_Schedule"><span style=3D"font-family:Consolas;co=
lor:#1155CC">https://wiki.yoctoproject.org/wiki/Yocto_2.5_Schedule</span></=
a><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><a href=3D"https://wiki.yocto=
project.org/wiki/Yocto_2.5_Features"><span style=3D"font-family:Consolas;co=
lor:#1155CC">https://wiki.yoctoproject.org/wiki/Yocto_2.5_Features</span></=
a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">The Status reports are now stored o=
n the wiki at:
</span><a href=3D"https://wiki.yoctoproject.org/wiki/Weekly_Status"><span s=
tyle=3D"font-family:&quot;Arial&quot;,sans-serif;color:#1155CC">https://wik=
i.yoctoproject.org/wiki/Weekly_Status</span></a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-family:&q=
uot;Arial&quot;,sans-serif;color:black">[If anyone has suggestions for othe=
r information you=92d like to see on this weekly status update, let us know=
!]</span><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"page-break-after:avoid;text-autospace:none"=
><b><i><span style=3D"font-size:16.0pt;font-family:&quot;Times New Roman&qu=
ot;,serif;color:purple">Stephen K. Jolley</span></i></b><b><i><span style=
=3D"font-size:16.0pt;font-family:&quot;Tahoma&quot;,sans-serif;color:purple=
"><o:p></o:p></span></i></b></p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;;color:blue">Yocto Project Release Engineer<o:p></o:p></sp=
an></b></p>
<p class=3D"MsoNormal" style=3D"page-break-after:avoid;text-autospace:none"=
><b><span style=3D"font-size:10.0pt;font-family:&quot;Courier New&quot;;col=
or:fuchsia">INTEL, MS JF1-255, 2111 N.E. 25th Avenue, Hillsboro, OR 97124
<o:p></o:p></span></b></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Wingdings;color:black">(<=
/span><span style=3D"font-family:&quot;MS Sans Serif&quot;;color:teal">
</span><span style=3D"font-size:8.0pt;font-family:&quot;MS Sans Serif&quot;=
;color:teal">&nbsp;&nbsp;</span><b><span style=3D"font-size:8.0pt;font-fami=
ly:&quot;Comic Sans MS&quot;;color:teal">Work Telephone</span></b><span sty=
le=3D"font-family:&quot;MS Sans Serif&quot;;color:teal">:&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-size:9.0pt;font-family:&quot;MS Sans Serif&quot;=
">(503) 712-0534<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:Wingdings=
;color:black">(</span><span style=3D"font-size:9.0pt;font-family:&quot;MS S=
ans Serif&quot;;color:teal">&nbsp;&nbsp;&nbsp;
</span><b><span style=3D"font-size:8.0pt;font-family:&quot;Comic Sans MS&qu=
ot;;color:teal">Cell</span></b><span style=3D"font-size:9.0pt;font-family:&=
quot;MS Sans Serif&quot;;color:teal">:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-size:9.0pt;font-family:&quot;MS Sans Serif&quot;=
">(208) 244-4460<span style=3D"color:black"><o:p></o:p></span></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:Wingdings=
">* </span>
<b><span lang=3D"FR" style=3D"font-size:8.0pt;font-family:&quot;Comic Sans =
MS&quot;;color:teal">Email</span></b><span lang=3D"FR" style=3D"font-size:9=
.0pt;font-family:&quot;MS Sans Serif&quot;;color:teal">:</span><span lang=
=3D"FR" style=3D"font-size:9.0pt;font-family:&quot;MS Sans Serif&quot;">&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;
<u><span style=3D"color:blue">stephen.k.jolley@intel.com</span></u></span><=
span lang=3D"FR" style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sa=
ns-serif"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_9ADD3FDE8B189B4AA2F8A3C711F8155EC725D8FEfmsmsx111amrcor_--
