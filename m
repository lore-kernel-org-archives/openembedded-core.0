Return-Path: <stephen.k.jolley@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8C11273BB8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 15:14:02 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 25 Sep 2015 08:14:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,587,1437462000"; 
	d="scan'208,217";a="797257244"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
	by fmsmga001.fm.intel.com with ESMTP; 25 Sep 2015 08:14:03 -0700
Received: from FMSMSX110.amr.corp.intel.com (10.18.116.10) by
	FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Fri, 25 Sep 2015 08:14:03 -0700
Received: from fmsmsx111.amr.corp.intel.com ([169.254.12.115]) by
	FMSMSX110.amr.corp.intel.com ([169.254.14.202]) with mapi id
	14.03.0248.002; Fri, 25 Sep 2015 08:14:02 -0700
From: "Jolley, Stephen K" <stephen.k.jolley@intel.com>
To: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Yocto Project Status WW39
Thread-Index: AdD3pMpKgcqhWs2hRWi5gvmvxhYJhg==
Date: Fri, 25 Sep 2015 15:14:02 +0000
Message-ID: <9ADD3FDE8B189B4AA2F8A3C711F8155E5569716F@fmsmsx111.amr.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.200.106]
MIME-Version: 1.0
Subject: Yocto Project Status WW39
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
X-List-Received-Date: Fri, 25 Sep 2015 15:14:04 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_9ADD3FDE8B189B4AA2F8A3C711F8155E5569716Ffmsmsx111amrcor_"

--_000_9ADD3FDE8B189B4AA2F8A3C711F8155E5569716Ffmsmsx111amrcor_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Current Dev Position: YP 2.0 Final
Next Deadline: 2.0 Cut off: Sept. 28, 2015 noon GMT

SWAT team rotation: Paul -> Ross
https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team

Key Status/Updates:

  *   'Random' build failures are continuing to cause issues, we're continu=
ing to try and tackle them
  *   The Milestone 3 build will be released. There were issues but none se=
rious enough to block its release, choosing to concentrate on the final rcs=
 now.
  *   Tracked down the cause of the pixbuf bug, unfortunately the fix cause=
d other regressions, still working on this
  *   There are several multilib issues being worked on
  *   Prelink also appears broken in several cases, patches are in progress
  *   Biggest threat to release are the 'random' systemd issues and the 'ra=
ndom' qemuarm and qemux86 segfaults
  *   Reminder:
     *   We have renamed YP 1.9 to YP 2.0.
     *   The current version that is in development will launch as YP 2.0 i=
n October, 2015.
     *   The release name for YP 2.0 is 'jethro'.

Key YP 1.9/2.0 Dates:
YP 2.0 Final - 2.0 Cut off: Sept. 28, 2015 noon GMT
YP 2.0 final Release Target: Before Oct. 30, 2015

Key Status Links for YP:
https://wiki.yoctoproject.org/wiki/Yocto_Project_v1.9_Status
https://wiki.yoctoproject.org/wiki/Yocto_1.9_Schedule
https://wiki.yoctoproject.org/wiki/Yocto_1.9_Features

Tracking Metrics:
            WDD 2165 (last week 2151 )
(https://wiki.yoctoproject.org/charts/combo.html)

[If anyone has suggestions for other information you'd like to see on this =
weekly status update, let us know!]

Thanks,

Stephen K. Jolley
Yocto Project Program Manager
INTEL, MS JF1-255, 2111 N.E. 25th Avenue, Hillsboro, OR 97124
*   Work Telephone:          (503) 712-0534
*    Cell:                                (208) 244-4460
* Email:                             stephen.k.jolley@intel.com


--_000_9ADD3FDE8B189B4AA2F8A3C711F8155E5569716Ffmsmsx111amrcor_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" xmlns:m=3D"http://schema=
s.microsoft.com/office/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html=
40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
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
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
@font-face
	{font-family:"MS Sans Serif";}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
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
p
	{mso-style-priority:99;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";}
span.EmailStyle18
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
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
	{mso-list-id:305477373;
	mso-list-template-ids:-1443351258;}
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
	{mso-list-id:1339312042;
	mso-list-template-ids:-261212306;}
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
	mso-level-text:\F0B7;
	mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l1:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l1:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l1:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l1:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l1:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l1:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l1:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l2
	{mso-list-id:1630936143;
	mso-list-template-ids:1392942132;}
@list l2:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l2:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l2:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l2:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l2:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l2:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l2:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l2:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l2:level9
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
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">Current Dev Position: YP 2.0 Final
</span><span style=3D"font-size:12.0pt;font-family:&quot;Times New Roman&qu=
ot;,&quot;serif&quot;"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">Next Deadline: 2.0 Cut off: Sept. 28, 2015 noo=
n GMT</span><span style=3D"font-size:12.0pt;font-family:&quot;Times New Rom=
an&quot;,&quot;serif&quot;"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ti=
mes New Roman&quot;,&quot;serif&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">SWAT team rotation: Paul -&gt; Ross</span><spa=
n style=3D"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,&quot;s=
erif&quot;"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ti=
mes New Roman&quot;,&quot;serif&quot;"><a href=3D"https://wiki.yoctoproject=
.org/wiki/Yocto_Build_Failure_Swat_Team"><span style=3D"font-size:11.0pt;fo=
nt-family:Consolas;color:#1155CC">https://wiki.yoctoproject.org/wiki/Yocto_=
Build_Failure_Swat_Team</span></a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ti=
mes New Roman&quot;,&quot;serif&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">Key Status/Updates:</span><span style=3D"font-=
size:12.0pt;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><o:p=
></o:p></span></p>
<ul style=3D"margin-top:0in" type=3D"disc">
<li class=3D"MsoNormal" style=3D"color:black;mso-list:l2 level1 lfo4;vertic=
al-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;">&#8216=
;Random&#8217; build failures are continuing to cause issues, we&#8217;re c=
ontinuing to try and tackle them<o:p></o:p></span></li><li class=3D"MsoNorm=
al" style=3D"color:black;mso-list:l2 level1 lfo4;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;">The Mi=
lestone 3 build will be released. There were issues but none serious enough=
 to block its release, choosing to concentrate on the final rcs now.<o:p></=
o:p></span></li><li class=3D"MsoNormal" style=3D"color:black;mso-list:l2 le=
vel1 lfo4;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;">Tracke=
d down the cause of the pixbuf bug, unfortunately the fix caused other regr=
essions, still working on this<o:p></o:p></span></li><li class=3D"MsoNormal=
" style=3D"color:black;mso-list:l2 level1 lfo4;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;">There =
are several multilib issues being worked on<o:p></o:p></span></li><li class=
=3D"MsoNormal" style=3D"color:black;mso-list:l2 level1 lfo4;vertical-align:=
baseline">
<span style=3D"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;">Prelin=
k also appears broken in several cases, patches are in progress<o:p></o:p><=
/span></li><li class=3D"MsoNormal" style=3D"color:black;mso-list:l2 level1 =
lfo4;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;">Bigges=
t threat to release are the &#8216;random&#8217; systemd issues and the &#8=
216;random&#8217; qemuarm and qemux86 segfaults<o:p></o:p></span></li><li c=
lass=3D"MsoNormal" style=3D"color:black;mso-list:l2 level1 lfo4;vertical-al=
ign:baseline">
<span style=3D"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;">Remind=
er: <o:p></o:p></span>
<ul style=3D"margin-top:0in" type=3D"circle">
<li class=3D"MsoNormal" style=3D"color:black;mso-list:l2 level2 lfo4;vertic=
al-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;">We hav=
e renamed YP 1.9 to YP 2.0. <o:p>
</o:p></span></li><li class=3D"MsoNormal" style=3D"color:black;mso-list:l2 =
level2 lfo4;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;">The cu=
rrent version that is in development will launch as YP 2.0 in October, 2015=
.
<o:p></o:p></span></li><li class=3D"MsoNormal" style=3D"color:black;mso-lis=
t:l2 level2 lfo4;vertical-align:baseline">
<span style=3D"font-family:&quot;Arial&quot;,&quot;sans-serif&quot;">The re=
lease name for YP 2.0 is &#8216;jethro&#8217;.<o:p></o:p></span></li></ul>
</li></ul>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ti=
mes New Roman&quot;,&quot;serif&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">Key YP 1.9/2.0 Dates:</span><span style=3D"fon=
t-size:12.0pt;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><o=
:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Arial&quot;,&quot;sans-serif&quot;;color:black">YP 2.0 Final - 2.0 =
Cut off: Sept. 28, 2015 noon GMT
</span><span style=3D"font-size:12.0pt;font-family:&quot;Times New Roman&qu=
ot;,&quot;serif&quot;"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:.5in"><span style=3D"font-famil=
y:&quot;Arial&quot;,&quot;sans-serif&quot;;color:black">YP 2.0 final Releas=
e Target: Before Oct. 30, 2015</span><span style=3D"font-size:12.0pt;font-f=
amily:&quot;Times New Roman&quot;,&quot;serif&quot;"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ti=
mes New Roman&quot;,&quot;serif&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">Key Status Links for YP:</span><span style=3D"=
font-size:12.0pt;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"=
><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ti=
mes New Roman&quot;,&quot;serif&quot;"><a href=3D"https://wiki.yoctoproject=
.org/wiki/Yocto_Project_v1.9_Status"><span style=3D"font-size:11.0pt;font-f=
amily:Consolas;color:#1155CC">https://wiki.yoctoproject.org/wiki/Yocto_Proj=
ect_v1.9_Status</span></a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ti=
mes New Roman&quot;,&quot;serif&quot;"><a href=3D"https://wiki.yoctoproject=
.org/wiki/Yocto_1.9_Schedule"><span style=3D"font-size:11.0pt;font-family:C=
onsolas;color:#1155CC">https://wiki.yoctoproject.org/wiki/Yocto_1.9_Schedul=
e</span></a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ti=
mes New Roman&quot;,&quot;serif&quot;"><a href=3D"https://wiki.yoctoproject=
.org/wiki/Yocto_1.9_Features"><span style=3D"font-size:11.0pt;font-family:C=
onsolas;color:#1155CC">https://wiki.yoctoproject.org/wiki/Yocto_1.9_Feature=
s</span></a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ti=
mes New Roman&quot;,&quot;serif&quot;"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">Tracking Metrics:</span><span style=3D"font-si=
ze:12.0pt;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; WDD 2165 (last week 2151 )</span><span style=3D"font-s=
ize:12.0pt;font-family:&quot;Times New Roman&quot;,&quot;serif&quot;"><o:p>=
</o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:.5in"><span style=3D"font-famil=
y:Consolas;color:black">(</span><span style=3D"font-size:12.0pt;font-family=
:&quot;Times New Roman&quot;,&quot;serif&quot;"><a href=3D"https://wiki.yoc=
toproject.org/charts/combo.html"><span style=3D"font-size:11.0pt;font-famil=
y:&quot;Arial&quot;,&quot;sans-serif&quot;;color:#1155CC">https://wiki.yoct=
oproject.org/charts/combo.html</span></a></span><span style=3D"font-family:=
Consolas;color:black">)</span><span style=3D"font-size:12.0pt;font-family:&=
quot;Times New Roman&quot;,&quot;serif&quot;"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas;color:black">&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
<span style=3D"font-size:12.0pt;font-family:&quot;Times New Roman&quot;,&qu=
ot;serif&quot;"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">[If anyone has suggestions for other informati=
on you&#8217;d like to see on this weekly status update, let us know!]<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,&quot;s=
ans-serif&quot;;color:black">Thanks,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"page-break-after:avoid;text-autospace:none"=
><b><i><span style=3D"font-size:16.0pt;font-family:&quot;Times New Roman&qu=
ot;,&quot;serif&quot;;color:purple">Stephen K. Jolley</span></i></b><b><i><=
span style=3D"font-size:16.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-se=
rif&quot;;color:purple"><o:p></o:p></span></i></b></p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;;color:blue">Yocto Project Program Manager<o:p></o:p></spa=
n></b></p>
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
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-size:9.0pt;font-family:&quot;MS Sans Serif&quot;=
">(503) 712-0534<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:Wingdings=
;color:black">(</span><span style=3D"font-size:9.0pt;font-family:&quot;MS S=
ans Serif&quot;;color:teal">&nbsp;&nbsp;&nbsp;
</span><b><span style=3D"font-size:8.0pt;font-family:&quot;Comic Sans MS&qu=
ot;;color:teal">Cell</span></b><span style=3D"font-size:9.0pt;font-family:&=
quot;MS Sans Serif&quot;;color:teal">:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
span lang=3D"FR" style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,&q=
uot;sans-serif&quot;"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_9ADD3FDE8B189B4AA2F8A3C711F8155E5569716Ffmsmsx111amrcor_--
