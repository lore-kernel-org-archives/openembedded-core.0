Return-Path: <stephen.k.jolley@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 56E626FEF3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2016 15:32:02 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga105.jf.intel.com with ESMTP; 28 Oct 2016 08:32:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,410,1473145200"; 
	d="scan'208,217";a="1077258248"
Received: from fmsmsx103.amr.corp.intel.com ([10.18.124.201])
	by fmsmga002.fm.intel.com with ESMTP; 28 Oct 2016 08:32:03 -0700
Received: from fmsmsx122.amr.corp.intel.com (10.18.125.37) by
	FMSMSX103.amr.corp.intel.com (10.18.124.201) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Fri, 28 Oct 2016 08:32:01 -0700
Received: from fmsmsx111.amr.corp.intel.com ([169.254.12.12]) by
	fmsmsx122.amr.corp.intel.com ([169.254.5.129]) with mapi id
	14.03.0248.002; Fri, 28 Oct 2016 08:32:01 -0700
From: "Jolley, Stephen K" <stephen.k.jolley@intel.com>
To: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Yocto Project Status WW44
Thread-Index: AdIxMC8MvBfB1+iGRreTMQA0zrM58g==
Date: Fri, 28 Oct 2016 15:32:00 +0000
Message-ID: <9ADD3FDE8B189B4AA2F8A3C711F8155E572A65FB@fmsmsx111.amr.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.200.108]
x-ctpclassification: CTP_IC
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYzQzMjc2NDItMjRlZS00MThiLTkxNmEtN2YxZTE3YzM5MWZhIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX0lDIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE1LjkuNi42IiwiVHJ1c3RlZExhYmVsSGFzaCI6InhXTEpjUGtod29GUGVsclFVV2U2M0VZZTloMXRYZmU3R28wazA5d3d0VTQ9In0=
MIME-Version: 1.0
Subject: Yocto Project Status WW44
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
X-List-Received-Date: Fri, 28 Oct 2016 15:32:04 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_9ADD3FDE8B189B4AA2F8A3C711F8155E572A65FBfmsmsx111amrcor_"

--_000_9ADD3FDE8B189B4AA2F8A3C711F8155E572A65FBfmsmsx111amrcor_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Current Dev Position: YP 2.3 M1

Next Deadline: YP 2.3 M1


SWAT team rotation: Paul -> Ross

https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team


Key Status/Updates:

*        The YP 2.2rc4 QA report looked good and we were nearly able to rel=
ease.

*        The kernel CVE issue meant we rebuilt the release and the rc6 buil=
d is in QA (rc5 was misconfigured).  https://wiki.yoctoproject.org/wiki/2.2=
_QA_Status

*        The rebuild means we are slightly behind our release date but this=
 was preferred to releasing with the kernel CVE issues.

*        2.3 planning is underway and RP will send more thoughts on the pla=
ns for that in the next couple of weeks. Recipe specific sysroots look like=
 one desired feature for multiple reasons and there was good discussion and=
 feedback from OEDEM. If people do have things they're planning to work on =
in the 2.3 cycle, adding them to the bugzilla for tracking purposes would b=
e very helpful.

*        We are going to make a strong effort to load balance things up fro=
nt this time so work is spread over M1-3 rather than the usual 'front loade=
d' everything in M1 approach which is currently how bugzilla looks.


Key YP 2.2 Dates:

*        YP 2.2 M4 release would be: 10/28/16 but should be early next week=
.

Proposed upcoming releases after YP 2.2 are:

Key YP 2.3 Dates:

Milestone


Cutoff


Release


YP 2.0.3


11/7/2016


11/18/2016


YP 2.1.2


11/28/2016


12/9/2016


YP 2.3 M1


12/12/2016


12/23/2016


YP 2.2.1


1/9/2017


1/20/2017


YP 2.3 M2


1/23/2017


2/3/2017


YP 2.3 M3


2/27/2017


3/10/2017


YP 2.3 M4


4/3/2017


4/28/2017


YP 2.3


4/3/2017


4/28/2017


YP 2.1.3


5/8/2017


5/19/2017


YP 2.2.2


5/15/2017


5/30/2017



Tracking Metrics:

            WDD 2394 (last week 2306)

(https://wiki.yoctoproject.org/charts/combo.html)


Key Status Links for YP:

https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.2_Status

https://wiki.yoctoproject.org/wiki/Yocto_2.2_Schedule

https://wiki.yoctoproject.org/wiki/Yocto_2.2_Features

https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.3_Status

https://wiki.yoctoproject.org/wiki/Yocto_2.3_Schedule

https://wiki.yoctoproject.org/wiki/Yocto_2.3_Features

[If anyone has suggestions for other information you'd like to see on this =
weekly status update, let us know!]

Thanks,

Stephen K. Jolley
Yocto Project Program Manager
INTEL, MS JF1-255, 2111 N.E. 25th Avenue, Hillsboro, OR 97124
*   Work Telephone:        (503) 712-0534
*    Cell:               (208) 244-4460
* Email:                            stephen.k.jolley@intel.com


--_000_9ADD3FDE8B189B4AA2F8A3C711F8155E572A65FBfmsmsx111amrcor_
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
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
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
	{mso-list-id:265310024;
	mso-list-template-ids:2039094302;}
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
	{mso-list-id:395707557;
	mso-list-template-ids:-640490192;}
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
@list l2
	{mso-list-id:492071037;
	mso-list-template-ids:2081036632;}
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
@list l3
	{mso-list-id:1328047580;
	mso-list-template-ids:-336292666;}
@list l3:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l3:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l3:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l3:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l3:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l3:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l3:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l3:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l3:level9
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
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Current Dev Positi=
on: YP 2.3 M1</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Next Deadline: YP =
2.3 M1</span><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">SWAT team rotation=
: Paul -&gt; Ross</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><a href=3D"https://wiki.yocto=
project.org/wiki/Yocto_Build_Failure_Swat_Team"><span style=3D"font-size:11=
.0pt;font-family:Consolas;color:#1155CC">https://wiki.yoctoproject.org/wiki=
/Yocto_Build_Failure_Swat_Team</span></a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Key Status/Updates=
:</span><o:p></o:p></p>
<p style=3D"mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margi=
n-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l2 level1 lfo=
5;vertical-align:baseline">
<![if !supportLists]><span style=3D"font-size:10.0pt;font-family:Symbol;col=
or:black"><span style=3D"mso-list:Ignore">&middot;<span style=3D"font:7.0pt=
 &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"font-size:11.0pt;font-family:=
&quot;Arial&quot;,sans-serif;color:black">The YP 2.2rc4 QA report looked go=
od and we were nearly able to release.<o:p></o:p></span></p>
<p style=3D"mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margi=
n-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l2 level1 lfo=
5;vertical-align:baseline">
<![if !supportLists]><span style=3D"font-size:10.0pt;font-family:Symbol;col=
or:black"><span style=3D"mso-list:Ignore">&middot;<span style=3D"font:7.0pt=
 &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"font-size:11.0pt;font-family:=
&quot;Arial&quot;,sans-serif;color:black">The kernel CVE issue meant we reb=
uilt the release and the rc6 build is in QA (rc5 was misconfigured). &nbsp;=
<a href=3D"https://wiki.yoctoproject.org/wiki/2.2_QA_Status"><span style=3D=
"color:#1155CC">https://wiki.yoctoproject.org/wiki/2.2_QA_Status</span></a>=
<o:p></o:p></span></p>
<p style=3D"mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margi=
n-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l2 level1 lfo=
5;vertical-align:baseline">
<![if !supportLists]><span style=3D"font-size:10.0pt;font-family:Symbol;col=
or:black"><span style=3D"mso-list:Ignore">&middot;<span style=3D"font:7.0pt=
 &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"font-size:11.0pt;font-family:=
&quot;Arial&quot;,sans-serif;color:black">The rebuild means we are slightly=
 behind our release date but this was preferred to releasing with the kerne=
l CVE issues.<o:p></o:p></span></p>
<p style=3D"mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margi=
n-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l2 level1 lfo=
5;vertical-align:baseline">
<![if !supportLists]><span style=3D"font-size:10.0pt;font-family:Symbol;col=
or:black"><span style=3D"mso-list:Ignore">&middot;<span style=3D"font:7.0pt=
 &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"font-size:11.0pt;font-family:=
&quot;Arial&quot;,sans-serif;color:black">2.3 planning is underway and RP w=
ill send more thoughts on the plans for that in the next couple of weeks. R=
ecipe specific sysroots look like one desired
 feature for multiple reasons and there was good discussion and feedback fr=
om OEDEM. If people do have things they&#8217;re planning to work on in the=
 2.3 cycle, adding them to the bugzilla for tracking purposes would be very=
 helpful.<o:p></o:p></span></p>
<p style=3D"mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margi=
n-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l2 level1 lfo=
5;vertical-align:baseline">
<![if !supportLists]><span style=3D"font-size:10.0pt;font-family:Symbol;col=
or:black"><span style=3D"mso-list:Ignore">&middot;<span style=3D"font:7.0pt=
 &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"font-size:11.0pt;font-family:=
&quot;Arial&quot;,sans-serif;color:black">We are going to make a strong eff=
ort to load balance things up front this time so work is spread over M1-3 r=
ather than the usual &#8216;front loaded&#8217; everything
 in M1 approach which is currently how bugzilla looks.<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;font-family:&quot;Ti=
mes New Roman&quot;,serif"><o:p>&nbsp;</o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Key YP 2.2 Dates:<=
/span><o:p></o:p></p>
<p style=3D"mso-margin-top-alt:0in;margin-right:0in;margin-bottom:0in;margi=
n-left:.5in;margin-bottom:.0001pt;text-indent:-.25in;mso-list:l3 level1 lfo=
6;vertical-align:baseline">
<![if !supportLists]><span style=3D"font-size:10.0pt;font-family:Symbol;col=
or:black"><span style=3D"mso-list:Ignore">&middot;<span style=3D"font:7.0pt=
 &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span></span></span><![endif]><span style=3D"font-size:11.0pt;font-family:=
&quot;Arial&quot;,sans-serif;color:black">YP 2.2 M4 release would be: 10/28=
/16 but should be early next week.<o:p></o:p></span></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Proposed upcoming =
releases after YP 2.2 are:</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Key YP 2.3 Dates:<=
/span><o:p></o:p></p>
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" style=3D"border-collapse:collapse">
<tbody>
<tr>
<td valign=3D"top" style=3D"border:solid black 1.0pt;padding:5.25pt 5.25pt =
5.25pt 5.25pt">
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Milestone</span><o=
:p></o:p></p>
</td>
<td valign=3D"top" style=3D"border:solid black 1.0pt;border-left:none;paddi=
ng:5.25pt 5.25pt 5.25pt 5.25pt">
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Cutoff</span><o:p>=
</o:p></p>
</td>
<td valign=3D"top" style=3D"border:solid black 1.0pt;border-left:none;paddi=
ng:5.25pt 5.25pt 5.25pt 5.25pt">
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Release</span><o:p=
></o:p></p>
</td>
</tr>
<tr>
<td valign=3D"top" style=3D"border:solid black 1.0pt;border-top:none;paddin=
g:5.25pt 5.25pt 5.25pt 5.25pt">
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP 2.0.3</span><o:=
p></o:p></p>
</td>
<td valign=3D"top" style=3D"border-top:none;border-left:none;border-bottom:=
solid black 1.0pt;border-right:solid black 1.0pt;padding:5.25pt 5.25pt 5.25=
pt 5.25pt">
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">11/7/2016</span><o=
:p></o:p></p>
</td>
<td valign=3D"top" style=3D"border-top:none;border-left:none;border-bottom:=
solid black 1.0pt;border-right:solid black 1.0pt;padding:5.25pt 5.25pt 5.25=
pt 5.25pt">
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">11/18/2016</span><=
o:p></o:p></p>
</td>
</tr>
<tr>
<td valign=3D"top" style=3D"border:solid black 1.0pt;border-top:none;paddin=
g:5.25pt 5.25pt 5.25pt 5.25pt">
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP 2.1.2</span><o:=
p></o:p></p>
</td>
<td valign=3D"top" style=3D"border-top:none;border-left:none;border-bottom:=
solid black 1.0pt;border-right:solid black 1.0pt;padding:5.25pt 5.25pt 5.25=
pt 5.25pt">
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">11/28/2016</span><=
o:p></o:p></p>
</td>
<td valign=3D"top" style=3D"border-top:none;border-left:none;border-bottom:=
solid black 1.0pt;border-right:solid black 1.0pt;padding:5.25pt 5.25pt 5.25=
pt 5.25pt">
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">12/9/2016</span><o=
:p></o:p></p>
</td>
</tr>
<tr>
<td valign=3D"top" style=3D"border:solid black 1.0pt;border-top:none;paddin=
g:5.25pt 5.25pt 5.25pt 5.25pt">
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP 2.3 M1</span><o=
:p></o:p></p>
</td>
<td valign=3D"top" style=3D"border-top:none;border-left:none;border-bottom:=
solid black 1.0pt;border-right:solid black 1.0pt;padding:5.25pt 5.25pt 5.25=
pt 5.25pt">
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">12/12/2016</span><=
o:p></o:p></p>
</td>
<td valign=3D"top" style=3D"border-top:none;border-left:none;border-bottom:=
solid black 1.0pt;border-right:solid black 1.0pt;padding:5.25pt 5.25pt 5.25=
pt 5.25pt">
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">12/23/2016</span><=
o:p></o:p></p>
</td>
</tr>
<tr>
<td valign=3D"top" style=3D"border:solid black 1.0pt;border-top:none;paddin=
g:5.25pt 5.25pt 5.25pt 5.25pt">
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP 2.2.1</span><o:=
p></o:p></p>
</td>
<td valign=3D"top" style=3D"border-top:none;border-left:none;border-bottom:=
solid black 1.0pt;border-right:solid black 1.0pt;padding:5.25pt 5.25pt 5.25=
pt 5.25pt">
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">1/9/2017</span><o:=
p></o:p></p>
</td>
<td valign=3D"top" style=3D"border-top:none;border-left:none;border-bottom:=
solid black 1.0pt;border-right:solid black 1.0pt;padding:5.25pt 5.25pt 5.25=
pt 5.25pt">
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">1/20/2017</span><o=
:p></o:p></p>
</td>
</tr>
<tr>
<td valign=3D"top" style=3D"border:solid black 1.0pt;border-top:none;paddin=
g:5.25pt 5.25pt 5.25pt 5.25pt">
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP 2.3 M2</span><o=
:p></o:p></p>
</td>
<td valign=3D"top" style=3D"border-top:none;border-left:none;border-bottom:=
solid black 1.0pt;border-right:solid black 1.0pt;padding:5.25pt 5.25pt 5.25=
pt 5.25pt">
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">1/23/2017</span><o=
:p></o:p></p>
</td>
<td valign=3D"top" style=3D"border-top:none;border-left:none;border-bottom:=
solid black 1.0pt;border-right:solid black 1.0pt;padding:5.25pt 5.25pt 5.25=
pt 5.25pt">
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">2/3/2017</span><o:=
p></o:p></p>
</td>
</tr>
<tr>
<td valign=3D"top" style=3D"border:solid black 1.0pt;border-top:none;paddin=
g:5.25pt 5.25pt 5.25pt 5.25pt">
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP 2.3 M3</span><o=
:p></o:p></p>
</td>
<td valign=3D"top" style=3D"border-top:none;border-left:none;border-bottom:=
solid black 1.0pt;border-right:solid black 1.0pt;padding:5.25pt 5.25pt 5.25=
pt 5.25pt">
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">2/27/2017</span><o=
:p></o:p></p>
</td>
<td valign=3D"top" style=3D"border-top:none;border-left:none;border-bottom:=
solid black 1.0pt;border-right:solid black 1.0pt;padding:5.25pt 5.25pt 5.25=
pt 5.25pt">
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">3/10/2017</span><o=
:p></o:p></p>
</td>
</tr>
<tr>
<td valign=3D"top" style=3D"border:solid black 1.0pt;border-top:none;paddin=
g:5.25pt 5.25pt 5.25pt 5.25pt">
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP 2.3 M4</span><o=
:p></o:p></p>
</td>
<td valign=3D"top" style=3D"border-top:none;border-left:none;border-bottom:=
solid black 1.0pt;border-right:solid black 1.0pt;padding:5.25pt 5.25pt 5.25=
pt 5.25pt">
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">4/3/2017</span><o:=
p></o:p></p>
</td>
<td valign=3D"top" style=3D"border-top:none;border-left:none;border-bottom:=
solid black 1.0pt;border-right:solid black 1.0pt;padding:5.25pt 5.25pt 5.25=
pt 5.25pt">
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">4/28/2017</span><o=
:p></o:p></p>
</td>
</tr>
<tr>
<td valign=3D"top" style=3D"border:solid black 1.0pt;border-top:none;paddin=
g:5.25pt 5.25pt 5.25pt 5.25pt">
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP 2.3</span><o:p>=
</o:p></p>
</td>
<td valign=3D"top" style=3D"border-top:none;border-left:none;border-bottom:=
solid black 1.0pt;border-right:solid black 1.0pt;padding:5.25pt 5.25pt 5.25=
pt 5.25pt">
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">4/3/2017</span><o:=
p></o:p></p>
</td>
<td valign=3D"top" style=3D"border-top:none;border-left:none;border-bottom:=
solid black 1.0pt;border-right:solid black 1.0pt;padding:5.25pt 5.25pt 5.25=
pt 5.25pt">
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">4/28/2017</span><o=
:p></o:p></p>
</td>
</tr>
<tr>
<td valign=3D"top" style=3D"border:solid black 1.0pt;border-top:none;paddin=
g:5.25pt 5.25pt 5.25pt 5.25pt">
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP 2.1.3</span><o:=
p></o:p></p>
</td>
<td valign=3D"top" style=3D"border-top:none;border-left:none;border-bottom:=
solid black 1.0pt;border-right:solid black 1.0pt;padding:5.25pt 5.25pt 5.25=
pt 5.25pt">
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">5/8/2017</span><o:=
p></o:p></p>
</td>
<td valign=3D"top" style=3D"border-top:none;border-left:none;border-bottom:=
solid black 1.0pt;border-right:solid black 1.0pt;padding:5.25pt 5.25pt 5.25=
pt 5.25pt">
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">5/19/2017</span><o=
:p></o:p></p>
</td>
</tr>
<tr>
<td valign=3D"top" style=3D"border:solid black 1.0pt;border-top:none;paddin=
g:5.25pt 5.25pt 5.25pt 5.25pt">
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">YP 2.2.2</span><o:=
p></o:p></p>
</td>
<td valign=3D"top" style=3D"border-top:none;border-left:none;border-bottom:=
solid black 1.0pt;border-right:solid black 1.0pt;padding:5.25pt 5.25pt 5.25=
pt 5.25pt">
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">5/15/2017</span><o=
:p></o:p></p>
</td>
<td valign=3D"top" style=3D"border-top:none;border-left:none;border-bottom:=
solid black 1.0pt;border-right:solid black 1.0pt;padding:5.25pt 5.25pt 5.25=
pt 5.25pt">
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">5/30/2017</span><o=
:p></o:p></p>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Tracking Metrics:<=
/span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span class=3D"apple-tab-span=
"><span style=3D"font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;=
color:black">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;
</span></span><span style=3D"font-size:11.0pt;font-family:&quot;Arial&quot;=
,sans-serif;color:black">WDD 2394 (last week 2306)</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt;text-indent:.5in"><span style=
=3D"font-size:11.0pt;font-family:Consolas;color:black">(</span><a href=3D"h=
ttps://wiki.yoctoproject.org/charts/combo.html"><span style=3D"font-size:11=
.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#1155CC">https://wiki.y=
octoproject.org/charts/combo.html</span></a><span style=3D"font-size:11.0pt=
;font-family:Consolas;color:black">)</span><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><span style=3D"font-size:11.0=
pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Key Status Links f=
or YP:</span><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><a href=3D"https://wiki.yocto=
project.org/wiki/Yocto_Project_v2.2_Status"><span style=3D"font-size:11.0pt=
;font-family:Consolas;color:#1155CC">https://wiki.yoctoproject.org/wiki/Yoc=
to_Project_v2.2_Status</span></a><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><a href=3D"https://wiki.yocto=
project.org/wiki/Yocto_2.2_Schedule"><span style=3D"font-size:11.0pt;font-f=
amily:Consolas;color:#1155CC">https://wiki.yoctoproject.org/wiki/Yocto_2.2_=
Schedule</span></a><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><a href=3D"https://wiki.yocto=
project.org/wiki/Yocto_2.2_Features"><span style=3D"font-size:11.0pt;font-f=
amily:Consolas;color:#1155CC">https://wiki.yoctoproject.org/wiki/Yocto_2.2_=
Features</span></a><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><a href=3D"https://wiki.yocto=
project.org/wiki/Yocto_Project_v2.3_Status"><span style=3D"font-size:11.0pt=
;font-family:Consolas;color:#1155CC">https://wiki.yoctoproject.org/wiki/Yoc=
to_Project_v2.3_Status</span></a><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><a href=3D"https://wiki.yocto=
project.org/wiki/Yocto_2.3_Schedule"><span style=3D"font-size:11.0pt;font-f=
amily:Consolas;color:#1155CC">https://wiki.yoctoproject.org/wiki/Yocto_2.3_=
Schedule</span></a><o:p></o:p></p>
<p style=3D"margin:0in;margin-bottom:.0001pt"><a href=3D"https://wiki.yocto=
project.org/wiki/Yocto_2.3_Features"><span style=3D"font-size:11.0pt;font-f=
amily:Consolas;color:#1155CC">https://wiki.yoctoproject.org/wiki/Yocto_2.3_=
Features</span></a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,sans-se=
rif;color:black">[If anyone has suggestions for other information you&#8217=
;d like to see on this weekly status update, let us know!]<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,sans-se=
rif;color:black"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,sans-se=
rif;color:black">Thanks,</span><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"page-break-after:avoid;text-autospace:none"=
><b><i><span style=3D"font-size:16.0pt;font-family:&quot;Times New Roman&qu=
ot;,serif;color:purple">Stephen K. Jolley</span></i></b><b><i><span style=
=3D"font-size:16.0pt;font-family:&quot;Tahoma&quot;,sans-serif;color:purple=
"><o:p></o:p></span></i></b></p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:8.0pt;font-family:&quot;=
Courier New&quot;;color:blue">Yocto Project Program Manager<o:p></o:p></spa=
n></b></p>
<p class=3D"MsoNormal" style=3D"page-break-after:avoid;text-autospace:none"=
><b><span style=3D"font-size:10.0pt;font-family:&quot;Courier New&quot;;col=
or:fuchsia">INTEL, MS JF1-255, 2111 N.E. 25th Avenue, Hillsboro, OR 97124
<o:p></o:p></span></b></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Wingdings;color:black">(<=
/span><span style=3D"font-family:&quot;MS Sans Serif&quot;,serif;color:teal=
">
</span><span style=3D"font-size:8.0pt;font-family:&quot;MS Sans Serif&quot;=
,serif;color:teal">&nbsp;&nbsp;</span><b><span style=3D"font-size:8.0pt;fon=
t-family:&quot;Comic Sans MS&quot;;color:teal">Work Telephone</span></b><sp=
an style=3D"font-family:&quot;MS Sans Serif&quot;,serif;color:teal">:&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-size:9.0pt;font-family:&quot;MS Sans Serif&quot;=
,serif">(503) 712-0534<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:Wingdings=
;color:black">(</span><span style=3D"font-size:9.0pt;font-family:&quot;MS S=
ans Serif&quot;,serif;color:teal">&nbsp;&nbsp;&nbsp;
</span><b><span style=3D"font-size:8.0pt;font-family:&quot;Comic Sans MS&qu=
ot;;color:teal">Cell</span></b><span style=3D"font-size:9.0pt;font-family:&=
quot;MS Sans Serif&quot;,serif;color:teal">:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</span><span style=3D"font-size:9.0pt;font-family:&quot;MS Sans Serif&quot;=
,serif">(208) 244-4460<span style=3D"color:black"><o:p></o:p></span></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:9.0pt;font-family:Wingdings=
">* </span>
<b><span lang=3D"FR" style=3D"font-size:8.0pt;font-family:&quot;Comic Sans =
MS&quot;;color:teal">Email</span></b><span lang=3D"FR" style=3D"font-size:9=
.0pt;font-family:&quot;MS Sans Serif&quot;,serif;color:teal">:</span><span =
lang=3D"FR" style=3D"font-size:9.0pt;font-family:&quot;MS Sans Serif&quot;,=
serif">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;
<u><span style=3D"color:blue">stephen.k.jolley@intel.com</span></u></span><=
span lang=3D"FR" style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sa=
ns-serif"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_9ADD3FDE8B189B4AA2F8A3C711F8155E572A65FBfmsmsx111amrcor_--
