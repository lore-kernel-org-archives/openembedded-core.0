Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 56C1C6C233
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2018 19:59:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 6461C18514;
	Tue, 13 Nov 2018 20:59:31 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id o4wHevVVyQ7J; Tue, 13 Nov 2018 20:59:29 +0100 (CET)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 7530618512;
	Tue, 13 Nov 2018 20:59:29 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 353A21E07E;
	Tue, 13 Nov 2018 20:59:29 +0100 (CET)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1FF981E07D;
	Tue, 13 Nov 2018 20:59:29 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Tue, 13 Nov 2018 20:59:29 +0100 (CET)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by thoth.se.axis.com (Postfix) with ESMTP id 137E62CFF;
	Tue, 13 Nov 2018 20:59:29 +0100 (CET)
Received: from XBOX04.axis.com (10.0.5.18) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Tue, 13 Nov 2018 20:59:28 +0100
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1365.000; Tue, 13 Nov 2018 20:59:28 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "Jolley, Stephen K" <stephen.k.jolley@intel.com>, "yocto@yoctoproject.org"
	<yocto@yoctoproject.org>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: =?Windows-1252?Q?Yocto_Project_Status_WW46=9218?=
Thread-Index: AdR7aDZ3RgqcEfU9TQG89BIMFq3TZAAIodwg
Date: Tue, 13 Nov 2018 19:59:28 +0000
Message-ID: <9cccb7ca2a004e0a83f41863f8600727@XBOX04.axis.com>
References: <9ADD3FDE8B189B4AA2F8A3C711F8155ECFD42715@fmsmsx124.amr.corp.intel.com>
In-Reply-To: <9ADD3FDE8B189B4AA2F8A3C711F8155ECFD42715@fmsmsx124.amr.corp.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: =?UTF-8?B?UmU6IFlvY3RvIFByb2plY3QgU3RhdHVzIFdXNDbigJkxOA==?=
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
X-List-Received-Date: Tue, 13 Nov 2018 19:59:32 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_9cccb7ca2a004e0a83f41863f8600727XBOX04axiscom_"

--_000_9cccb7ca2a004e0a83f41863f8600727XBOX04axiscom_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

From the updates below:


  *   Patches for the thud point release are queuing on the branch.

On what branch? The thud-next branch is behind the thud branch, and the mas=
ter-next branch contains a lot of recipe updates that do not seem suitable =
for Thud.

//Peter

From: openembedded-core-bounces@lists.openembedded.org <openembedded-core-b=
ounces@lists.openembedded.org> On Behalf Of Jolley, Stephen K
Sent: den 13 november 2018 16:48
To: yocto@yoctoproject.org; openembedded-core@lists.openembedded.org
Subject: [OE-core] Yocto Project Status WW46=9218


Current Dev Position: YP 2.6 M4 is in preparing for release.

Next Deadline: YP 2.6 M4 Release Target was Oct. 26, 2018


SWAT Team Rotation:

  *   SWAT lead is currently: Armin
  *   SWAT team rotation: Armin -> Paul on Nov. 16, 2018
  *   SWAT team rotation: Paul -> Ross on Nov. 23, 2018
  *   https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team


Key Status/Updates:

  *   YP 2.6 M4 rc1 has in completed QA and should release this week.  See =
the  QA Report: https://wiki.yoctoproject.org/wiki/WW44_-_2018-10-30_-_Full=
_Test_Cycle_2.6_M4_RC1

and the Release Criteria: https://wiki.yoctoproject.org/wiki/Yocto_Project_=
v2.6_Status#Milestone_4.2FFinal_-_Target_Oct._26.2C_2018

  *   YP 2.4.4 (Rocko) is in QA and 65% complete.  See: https://wiki.yoctop=
roject.org/wiki/2.4_QA_Status
  *   A summary of changes to the Yocto Project QA process in 2.7 was sent =
out to the openembedded-architecture list: http://lists.openembedded.org/pi=
permail/openembedded-architecture/2018-November/001577.html This will be on=
e of the topics for discussion in the 2.7 planning call on Tuesday 27th. Ar=
min has entered a number of bugs into bugzilla for the items which are rela=
ted to this.
  *   Patches for the thud point release are queuing on the branch.
  *   Patches are also going to start merging to master which will diverge =
from thud imminently.


Planned Releases for YP 2.7:

  *   YP 2.6 M4 Release Target was Oct. 26, 2018
  *   YP 2.7 M1 Cutoff is Dec. 10, 2018
  *   YP 2.7 M1 Release Target is Dec. 21, 2018
  *   YP 2.7 M2 Cutoff is Jan. 21, 2019
  *   YP 2.7 M2 Release Target is Feb. 1, 2019
  *   YP 2.7 M3 Cutoff is Feb. 25, 2019
  *   YP 2.7 M3 Release Target is Mar. 8, 2019
  *   YP 2.7 M4 Cutoff is Apr. 1, 2019
  *   YP 2.7 M4 Release Target is Apr. 26, 2019


Planned upcoming dot releases:

  *   YP 2.4.4 (Rocko) is in QA. See: https://wiki.yoctoproject.org/wiki/2.=
4_QA_Status
  *   YP 2.5.2 (Sumo) will be targeted after YP 2.4.4 is done.
  *   YP 2.6.1 (Thud) will be targeted after YP 2.7 M1 is done.
  *   YP 2.5.3 (Sumo) will be targeted after YP 2.7 M4 is done.
  *   YP 2.6.2 (Thud) will be targeted after YP 2.5.3 is done.


Tracking Metrics:

  *   WDD 2402 (last week 2369) (https://wiki.yoctoproject.org/charts/combo=
.html)
  *   Poky Patch Metrics

     *   Total patches found: 1716 (last week 1692)
     *   Percentage of patches in the Pending State: 739 (43%) [last week 7=
39 (44%)]


Key Status Links for YP:

https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.6_Status

https://wiki.yoctoproject.org/wiki/Yocto_2.6_Schedule

https://wiki.yoctoproject.org/wiki/Yocto_2.6_Features

https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.7_Status

https://wiki.yoctoproject.org/wiki/Yocto_2.7_Schedule

https://wiki.yoctoproject.org/wiki/Yocto_2.7_Features


The Status reports are now stored on the wiki at: https://wiki.yoctoproject=
.org/wiki/Weekly_Status


[If anyone has suggestions for other information you=92d like to see on thi=
s weekly status update, let us know!]

Thanks,

Stephen K. Jolley
Yocto Project Program Manager
INTEL, MS JF1-255, 2111 N.E. 25th Avenue, Hillsboro, OR 97124
=95    Cell:                (208) 244-4460
=95 Email:                             stephen.k.jolley@intel.com<mailto:st=
ephen.k.jolley@intel.com>


--_000_9cccb7ca2a004e0a83f41863f8600727XBOX04axiscom_
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
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:"Comic Sans MS";
	panose-1:3 15 7 2 3 3 2 2 2 4;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
@font-face
	{font-family:"MS Sans Serif";
	panose-1:0 0 0 0 0 0 0 0 0 0;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
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
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-style-priority:99;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:12.0pt;
	font-family:"Times New Roman",serif;}
span.EmailStyle19
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.EmailStyle21
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:#943634;
	font-weight:normal;
	font-style:normal;
	text-decoration:none none;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:238906914;
	mso-list-type:hybrid;
	mso-list-template-ids:-273388658 -1889086336 69009411 69009413 69009409 69=
009411 69009413 69009409 69009411 69009413;}
@list l0:level1
	{mso-level-start-at:0;
	mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;
	mso-fareast-font-family:Calibri;
	mso-bidi-font-family:Arial;}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l1
	{mso-list-id:664356204;
	mso-list-template-ids:-157679358;}
@list l1:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:36.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l1:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:72.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l1:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:108.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:144.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:180.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:216.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:252.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:288.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l1:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:324.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l2
	{mso-list-id:986324228;
	mso-list-template-ids:-1444272270;}
@list l2:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:36.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l2:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:72.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l2:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:108.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l2:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:144.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l2:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:180.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l2:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:216.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l2:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:252.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l2:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:288.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l2:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:324.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l3
	{mso-list-id:1031802238;
	mso-list-template-ids:-1744159168;}
@list l3:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:36.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l3:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:72.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l3:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:108.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l3:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:144.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l3:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:180.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l3:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:216.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l3:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:252.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l3:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:288.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l3:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:324.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l4
	{mso-list-id:1130899402;
	mso-list-template-ids:1347448702;}
@list l4:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:36.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l4:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:72.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l4:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:108.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l4:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:144.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l4:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:180.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l4:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:216.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l4:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:252.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l4:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:288.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l4:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:324.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l5
	{mso-list-id:1618632779;
	mso-list-template-ids:-1382536596;}
@list l5:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:36.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l5:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:72.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l5:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:108.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l5:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:144.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l5:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:180.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l5:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:216.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l5:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:252.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l5:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:288.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l5:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:324.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l6
	{mso-list-id:1660770028;
	mso-list-template-ids:-1502478070;}
@list l6:level1
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:36.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Symbol;}
@list l6:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:72.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:"Courier New";
	mso-bidi-font-family:"Times New Roman";}
@list l6:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:108.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l6:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:144.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l6:level5
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:180.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l6:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:216.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l6:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:252.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l6:level8
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:288.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
@list l6:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:324.0pt;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	mso-ansi-font-size:10.0pt;
	font-family:Wingdings;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"SV" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634;mso-fare=
ast-language:EN-US">From the updates below:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634;mso-fare=
ast-language:EN-US"><o:p>&nbsp;</o:p></span></p>
<ul style=3D"margin-top:0cm" type=3D"disc">
<li style=3D"color:black;margin-top:0cm;margin-bottom:0cm;margin-bottom:.00=
01pt;mso-list:l0 level1 lfo13;vertical-align:baseline">
<span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Arial&quot=
;,sans-serif">Patches for the thud point release are queuing on the branch.=
<o:p></o:p></span></li></ul>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634;mso-fare=
ast-language:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634;mso-fare=
ast-language:EN-US">On what branch? The thud-next branch is behind the thud=
 branch, and the master-next branch contains a lot of recipe updates that d=
o not seem suitable for Thud.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634;mso-fare=
ast-language:EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634;mso-fare=
ast-language:EN-US">//Peter<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#943634;mso-fare=
ast-language:EN-US"><o:p>&nbsp;</o:p></span></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0cm 0cm 0cm =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">From:</span></b><span lang=
=3D"EN-US"> openembedded-core-bounces@lists.openembedded.org &lt;openembedd=
ed-core-bounces@lists.openembedded.org&gt;
<b>On Behalf Of </b>Jolley, Stephen K<br>
<b>Sent:</b> den 13 november 2018 16:48<br>
<b>To:</b> yocto@yoctoproject.org; openembedded-core@lists.openembedded.org=
<br>
<b>Subject:</b> [OE-core] Yocto Project Status WW46=9218<o:p></o:p></span><=
/p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p style=3D"margin:0cm;margin-bottom:.0001pt"><span lang=3D"EN-US" style=3D=
"font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Cur=
rent Dev Position: YP 2.6 M4 is in preparing for release.
</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p style=3D"margin:0cm;margin-bottom:.0001pt"><span lang=3D"EN-US" style=3D=
"font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Nex=
t Deadline: YP 2.6 M4 Release Target was Oct. 26, 2018</span><span lang=3D"=
EN-US"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p style=3D"margin:0cm;margin-bottom:.0001pt"><span lang=3D"EN-US" style=3D=
"font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">SWA=
T Team Rotation:</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<ul style=3D"margin-top:0cm" type=3D"disc">
<li style=3D"color:black;margin-top:0cm;margin-bottom:0cm;margin-bottom:.00=
01pt;mso-list:l3 level1 lfo2;vertical-align:baseline">
<span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Arial&quot=
;,sans-serif">SWAT lead is currently: Armin<o:p></o:p></span></li><li style=
=3D"color:black;margin-top:0cm;margin-bottom:0cm;margin-bottom:.0001pt;mso-=
list:l3 level1 lfo2;vertical-align:baseline">
<span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Arial&quot=
;,sans-serif">SWAT team rotation: Armin -&gt; Paul on Nov. 16, 2018<o:p></o=
:p></span></li><li style=3D"color:black;margin-top:0cm;margin-bottom:0cm;ma=
rgin-bottom:.0001pt;mso-list:l3 level1 lfo2;vertical-align:baseline">
<span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Arial&quot=
;,sans-serif">SWAT team rotation: Paul -&gt; Ross on Nov. 23, 2018<o:p></o:=
p></span></li><li style=3D"color:black;margin-top:0cm;margin-bottom:0cm;mar=
gin-bottom:.0001pt;mso-list:l3 level1 lfo2;vertical-align:baseline">
<span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:Consolas"><a hre=
f=3D"https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team"><spa=
n style=3D"color:#1155CC">https://wiki.yoctoproject.org/wiki/Yocto_Build_Fa=
ilure_Swat_Team</span></a><o:p></o:p></span></li></ul>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;font-=
family:&quot;Times New Roman&quot;,serif"><o:p>&nbsp;</o:p></span></p>
<p style=3D"margin:0cm;margin-bottom:.0001pt"><span lang=3D"EN-US" style=3D=
"font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Key=
 Status/Updates:</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<ul style=3D"margin-top:0cm" type=3D"disc">
<li style=3D"color:black;margin-top:0cm;margin-bottom:0cm;margin-bottom:.00=
01pt;mso-list:l2 level1 lfo4;vertical-align:baseline">
<span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Arial&quot=
;,sans-serif">YP 2.6 M4 rc1 has in completed QA and should release this wee=
k. &nbsp;See the&nbsp; QA Report:<a href=3D"https://wiki.yoctoproject.org/w=
iki/WW44_-_2018-10-30_-_Full_Test_Cycle_2.6_M4_RC1"><span style=3D"color:bl=
ack;text-decoration:none">
</span><span style=3D"color:#1155CC">https://wiki.yoctoproject.org/wiki/WW4=
4_-_2018-10-30_-_Full_Test_Cycle_2.6_M4_RC1</span></a><o:p></o:p></span></l=
i></ul>
<p style=3D"mso-margin-top-alt:0cm;margin-right:0cm;margin-bottom:0cm;margi=
n-left:36.0pt;margin-bottom:.0001pt">
<span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Arial&quot=
;,sans-serif;color:black">and the Release Criteria:</span><span lang=3D"EN-=
US"><a href=3D"https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.6_Status=
#Milestone_4.2FFinal_-_Target_Oct._26.2C_2018"><span style=3D"font-size:11.=
0pt;font-family:&quot;Arial&quot;,sans-serif;color:black;text-decoration:no=
ne">
</span><span style=3D"font-size:11.0pt;font-family:&quot;Arial&quot;,sans-s=
erif;color:#1155CC">https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.6_S=
tatus#Milestone_4.2FFinal_-_Target_Oct._26.2C_2018</span></a><o:p></o:p></s=
pan></p>
<ul style=3D"margin-top:0cm" type=3D"disc">
<li style=3D"color:black;margin-top:0cm;margin-bottom:0cm;margin-bottom:.00=
01pt;mso-list:l4 level1 lfo6;vertical-align:baseline">
<span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Arial&quot=
;,sans-serif">YP 2.4.4 (Rocko) is in QA and 65% complete. &nbsp;See:
<a href=3D"https://wiki.yoctoproject.org/wiki/2.4_QA_Status"><span style=3D=
"color:#1155CC">https://wiki.yoctoproject.org/wiki/2.4_QA_Status</span></a>=
<o:p></o:p></span></li><li style=3D"color:black;margin-top:0cm;margin-botto=
m:0cm;margin-bottom:.0001pt;mso-list:l4 level1 lfo6;vertical-align:baseline=
">
<span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Arial&quot=
;,sans-serif">A summary of changes to the Yocto Project QA process in 2.7 w=
as sent out to the openembedded-architecture list:
<a href=3D"http://lists.openembedded.org/pipermail/openembedded-architectur=
e/2018-November/001577.html">
<span style=3D"color:#1155CC">http://lists.openembedded.org/pipermail/opene=
mbedded-architecture/2018-November/001577.html</span></a> This will be one =
of the topics for discussion in the 2.7 planning call on Tuesday 27th. Armi=
n has entered a number of bugs into
 bugzilla for the items which are related to this.<o:p></o:p></span></li><l=
i style=3D"color:black;margin-top:0cm;margin-bottom:0cm;margin-bottom:.0001=
pt;mso-list:l4 level1 lfo6;vertical-align:baseline">
<span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Arial&quot=
;,sans-serif">Patches for the thud point release are queuing on the branch.=
<o:p></o:p></span></li><li style=3D"color:black;margin-top:0cm;margin-botto=
m:0cm;margin-bottom:.0001pt;mso-list:l4 level1 lfo6;vertical-align:baseline=
">
<span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Arial&quot=
;,sans-serif">Patches are also going to start merging to master which will =
diverge from thud imminently.<o:p></o:p></span></li></ul>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;font-=
family:&quot;Times New Roman&quot;,serif"><o:p>&nbsp;</o:p></span></p>
<p style=3D"margin:0cm;margin-bottom:.0001pt"><span lang=3D"EN-US" style=3D=
"font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Pla=
nned Releases for YP 2.7:</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<ul style=3D"margin-top:0cm" type=3D"disc">
<li style=3D"color:black;margin-top:0cm;margin-bottom:0cm;margin-bottom:.00=
01pt;mso-list:l5 level1 lfo8;vertical-align:baseline">
<span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Arial&quot=
;,sans-serif">YP 2.6 M4 Release Target was Oct. 26, 2018<o:p></o:p></span><=
/li><li style=3D"color:black;margin-top:0cm;margin-bottom:0cm;margin-bottom=
:.0001pt;mso-list:l5 level1 lfo8;vertical-align:baseline">
<span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Arial&quot=
;,sans-serif">YP 2.7 M1 Cutoff is Dec. 10, 2018<o:p></o:p></span></li><li s=
tyle=3D"color:black;margin-top:0cm;margin-bottom:0cm;margin-bottom:.0001pt;=
mso-list:l5 level1 lfo8;vertical-align:baseline">
<span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Arial&quot=
;,sans-serif">YP 2.7 M1 Release Target is Dec. 21, 2018<o:p></o:p></span></=
li><li style=3D"color:black;margin-top:0cm;margin-bottom:0cm;margin-bottom:=
.0001pt;mso-list:l5 level1 lfo8;vertical-align:baseline">
<span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Arial&quot=
;,sans-serif">YP 2.7 M2 Cutoff is Jan. 21, 2019<o:p></o:p></span></li><li s=
tyle=3D"color:black;margin-top:0cm;margin-bottom:0cm;margin-bottom:.0001pt;=
mso-list:l5 level1 lfo8;vertical-align:baseline">
<span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Arial&quot=
;,sans-serif">YP 2.7 M2 Release Target is Feb. 1, 2019<o:p></o:p></span></l=
i><li style=3D"color:black;margin-top:0cm;margin-bottom:0cm;margin-bottom:.=
0001pt;mso-list:l5 level1 lfo8;vertical-align:baseline">
<span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Arial&quot=
;,sans-serif">YP 2.7 M3 Cutoff is Feb. 25, 2019<o:p></o:p></span></li><li s=
tyle=3D"color:black;margin-top:0cm;margin-bottom:0cm;margin-bottom:.0001pt;=
mso-list:l5 level1 lfo8;vertical-align:baseline">
<span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Arial&quot=
;,sans-serif">YP 2.7 M3 Release Target is Mar. 8, 2019<o:p></o:p></span></l=
i><li style=3D"color:black;margin-top:0cm;margin-bottom:0cm;margin-bottom:.=
0001pt;mso-list:l5 level1 lfo8;vertical-align:baseline">
<span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Arial&quot=
;,sans-serif">YP 2.7 M4 Cutoff is Apr. 1, 2019<o:p></o:p></span></li><li st=
yle=3D"color:black;margin-top:0cm;margin-bottom:0cm;margin-bottom:.0001pt;m=
so-list:l5 level1 lfo8;vertical-align:baseline">
<span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Arial&quot=
;,sans-serif">YP 2.7 M4 Release Target is Apr. 26, 2019<o:p></o:p></span></=
li></ul>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;font-=
family:&quot;Times New Roman&quot;,serif"><o:p>&nbsp;</o:p></span></p>
<p style=3D"margin:0cm;margin-bottom:.0001pt"><span lang=3D"EN-US" style=3D=
"font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Pla=
nned upcoming dot releases:</span><span lang=3D"EN-US"><o:p></o:p></span></=
p>
<ul style=3D"margin-top:0cm" type=3D"disc">
<li style=3D"color:black;margin-top:0cm;margin-bottom:0cm;margin-bottom:.00=
01pt;mso-list:l6 level1 lfo10;vertical-align:baseline">
<span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Arial&quot=
;,sans-serif">YP 2.4.4 (Rocko) is in QA. See:
<a href=3D"https://wiki.yoctoproject.org/wiki/2.4_QA_Status"><span style=3D=
"color:#1155CC">https://wiki.yoctoproject.org/wiki/2.4_QA_Status</span></a>=
<o:p></o:p></span></li><li style=3D"color:black;margin-top:0cm;margin-botto=
m:0cm;margin-bottom:.0001pt;mso-list:l6 level1 lfo10;vertical-align:baselin=
e">
<span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Arial&quot=
;,sans-serif">YP 2.5.2 (Sumo) will be targeted after YP 2.4.4 is done.<o:p>=
</o:p></span></li><li style=3D"color:black;margin-top:0cm;margin-bottom:0cm=
;margin-bottom:.0001pt;mso-list:l6 level1 lfo10;vertical-align:baseline">
<span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Arial&quot=
;,sans-serif">YP 2.6.1 (Thud) will be targeted after YP 2.7 M1 is done.<o:p=
></o:p></span></li><li style=3D"color:black;margin-top:0cm;margin-bottom:0c=
m;margin-bottom:.0001pt;mso-list:l6 level1 lfo10;vertical-align:baseline">
<span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Arial&quot=
;,sans-serif">YP 2.5.3 (Sumo) will be targeted after YP 2.7 M4 is done.<o:p=
></o:p></span></li><li style=3D"color:black;margin-top:0cm;margin-bottom:0c=
m;margin-bottom:.0001pt;mso-list:l6 level1 lfo10;vertical-align:baseline">
<span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Arial&quot=
;,sans-serif">YP 2.6.2 (Thud) will be targeted after YP 2.5.3 is done.<o:p>=
</o:p></span></li></ul>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;font-=
family:&quot;Times New Roman&quot;,serif"><o:p>&nbsp;</o:p></span></p>
<p style=3D"margin:0cm;margin-bottom:.0001pt"><span lang=3D"EN-US" style=3D=
"font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Tra=
cking Metrics:</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<ul style=3D"margin-top:0cm" type=3D"disc">
<li style=3D"color:black;margin-top:0cm;margin-bottom:0cm;margin-bottom:.00=
01pt;mso-list:l1 level1 lfo12;vertical-align:baseline">
<span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Arial&quot=
;,sans-serif">WDD 2402 (last week 2369)</span><span lang=3D"EN-US" style=3D=
"font-size:11.0pt;font-family:Consolas"> (</span><span lang=3D"EN-US" style=
=3D"font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif"><a href=3D"h=
ttps://wiki.yoctoproject.org/charts/combo.html"><span style=3D"color:#1155C=
C">https://wiki.yoctoproject.org/charts/combo.html</span></a></span><span l=
ang=3D"EN-US" style=3D"font-size:11.0pt;font-family:Consolas">)</span><span=
 lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Arial&quot;,san=
s-serif"><o:p></o:p></span></li><li style=3D"color:black;margin-top:0cm;mar=
gin-bottom:0cm;margin-bottom:.0001pt;mso-list:l1 level1 lfo12;vertical-alig=
n:baseline">
<span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Arial&quot=
;,sans-serif">Poky Patch Metrics &nbsp;</span><span lang=3D"EN-US" style=3D=
"font-size:11.0pt;font-family:Consolas"><o:p></o:p></span></li></ul>
<ul style=3D"margin-top:0cm" type=3D"disc">
<ul style=3D"margin-top:0cm" type=3D"circle">
<li style=3D"color:black;margin-top:0cm;margin-bottom:0cm;margin-bottom:.00=
01pt;mso-list:l1 level2 lfo12;vertical-align:baseline">
<span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Arial&quot=
;,sans-serif">Total patches found: 1716 (last week 1692)<o:p></o:p></span><=
/li><li style=3D"color:black;margin-top:0cm;margin-bottom:0cm;margin-bottom=
:.0001pt;mso-list:l1 level2 lfo12;vertical-align:baseline">
<span lang=3D"EN-US" style=3D"font-size:11.0pt;font-family:&quot;Arial&quot=
;,sans-serif">Percentage of patches in the Pending State: 739 (43%) [last w=
eek 739 (44%)]</span><span lang=3D"EN-US" style=3D"font-size:11.0pt;font-fa=
mily:Consolas"><o:p></o:p></span></li></ul>
</ul>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:12.0pt;font-=
family:&quot;Times New Roman&quot;,serif"><o:p>&nbsp;</o:p></span></p>
<p style=3D"margin:0cm;margin-bottom:.0001pt"><span lang=3D"EN-US" style=3D=
"font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">Key=
 Status Links for YP:</span><span lang=3D"EN-US"><o:p></o:p></span></p>
<p style=3D"margin:0cm;margin-bottom:.0001pt"><span lang=3D"EN-US"><a href=
=3D"https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.6_Status"><span sty=
le=3D"font-size:11.0pt;font-family:Consolas;color:#1155CC">https://wiki.yoc=
toproject.org/wiki/Yocto_Project_v2.6_Status</span></a><o:p></o:p></span></=
p>
<p style=3D"margin:0cm;margin-bottom:.0001pt"><span lang=3D"EN-US"><a href=
=3D"https://wiki.yoctoproject.org/wiki/Yocto_2.6_Schedule"><span style=3D"f=
ont-size:11.0pt;font-family:Consolas;color:#1155CC">https://wiki.yoctoproje=
ct.org/wiki/Yocto_2.6_Schedule</span></a><o:p></o:p></span></p>
<p style=3D"margin:0cm;margin-bottom:.0001pt"><span lang=3D"EN-US"><a href=
=3D"https://wiki.yoctoproject.org/wiki/Yocto_2.6_Features"><span style=3D"f=
ont-size:11.0pt;font-family:Consolas;color:#1155CC">https://wiki.yoctoproje=
ct.org/wiki/Yocto_2.6_Features</span></a><o:p></o:p></span></p>
<p style=3D"margin:0cm;margin-bottom:.0001pt"><span lang=3D"EN-US"><a href=
=3D"https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.7_Status"><span sty=
le=3D"font-size:11.0pt;font-family:Consolas;color:#1155CC">https://wiki.yoc=
toproject.org/wiki/Yocto_Project_v2.7_Status</span></a><o:p></o:p></span></=
p>
<p style=3D"margin:0cm;margin-bottom:.0001pt"><span lang=3D"EN-US"><a href=
=3D"https://wiki.yoctoproject.org/wiki/Yocto_2.7_Schedule"><span style=3D"f=
ont-size:11.0pt;font-family:Consolas;color:#1155CC">https://wiki.yoctoproje=
ct.org/wiki/Yocto_2.7_Schedule</span></a><o:p></o:p></span></p>
<p style=3D"margin:0cm;margin-bottom:.0001pt"><span lang=3D"EN-US"><a href=
=3D"https://wiki.yoctoproject.org/wiki/Yocto_2.7_Features"><span style=3D"f=
ont-size:11.0pt;font-family:Consolas;color:#1155CC">https://wiki.yoctoproje=
ct.org/wiki/Yocto_2.7_Features</span></a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p style=3D"margin:0cm;margin-bottom:.0001pt"><span lang=3D"EN-US" style=3D=
"font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">The=
 Status reports are now stored on the wiki at:
</span><span lang=3D"EN-US"><a href=3D"https://wiki.yoctoproject.org/wiki/W=
eekly_Status"><span style=3D"font-size:11.0pt;font-family:&quot;Arial&quot;=
,sans-serif;color:#1155CC">https://wiki.yoctoproject.org/wiki/Weekly_Status=
</span></a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p style=3D"margin:0cm;margin-bottom:.0001pt"><span lang=3D"EN-US" style=3D=
"font-size:11.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black">[If=
 anyone has suggestions for other information you=92d like to see on this w=
eekly status update, let us know!]</span><span lang=3D"EN-US"><o:p></o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Aria=
l&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-family:&quot;Aria=
l&quot;,sans-serif">Thanks,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"page-break-after:avoid;text-autospace:none"=
><b><i><span lang=3D"EN-US" style=3D"font-size:16.0pt;font-family:&quot;Tim=
es New Roman&quot;,serif;color:purple">Stephen K. Jolley</span></i></b><b><=
i><span lang=3D"EN-US" style=3D"font-size:16.0pt;font-family:&quot;Tahoma&q=
uot;,sans-serif;color:purple"><o:p></o:p></span></i></b></p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"font-size:8.0pt;fon=
t-family:&quot;Courier New&quot;;color:blue">Yocto Project Program Manager<=
o:p></o:p></span></b></p>
<p class=3D"MsoNormal" style=3D"page-break-after:avoid;text-autospace:none"=
><b><span lang=3D"EN-US" style=3D"font-size:10.0pt;font-family:&quot;Courie=
r New&quot;;color:fuchsia">INTEL, MS JF1-255, 2111 N.E. 25th Avenue, Hillsb=
oro, OR 97124
<o:p></o:p></span></b></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:9.0pt;font-f=
amily:Wingdings;color:black">(</span><span lang=3D"EN-US" style=3D"font-siz=
e:9.0pt;font-family:&quot;MS Sans Serif&quot;;color:teal">&nbsp;&nbsp;&nbsp=
;
</span><b><span lang=3D"EN-US" style=3D"font-size:8.0pt;font-family:&quot;C=
omic Sans MS&quot;;color:teal">Cell</span></b><span lang=3D"EN-US" style=3D=
"font-size:9.0pt;font-family:&quot;MS Sans Serif&quot;;color:teal">:&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;
</span><span lang=3D"EN-US" style=3D"font-size:9.0pt;font-family:&quot;MS S=
ans Serif&quot;">(208) 244-4460<span style=3D"color:black"><o:p></o:p></spa=
n></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:9.0pt;font-f=
amily:Wingdings">*
</span><b><span lang=3D"FR" style=3D"font-size:8.0pt;font-family:&quot;Comi=
c Sans MS&quot;;color:teal">Email</span></b><span lang=3D"FR" style=3D"font=
-size:9.0pt;font-family:&quot;MS Sans Serif&quot;;color:teal">:</span><span=
 lang=3D"FR" style=3D"font-size:9.0pt;font-family:&quot;MS Sans Serif&quot;=
">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;
<u><span style=3D"color:blue"><a href=3D"mailto:stephen.k.jolley@intel.com"=
>stephen.k.jolley@intel.com</a></span></u></span><span lang=3D"FR" style=3D=
"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif"><o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</div>
</body>
</html>

--_000_9cccb7ca2a004e0a83f41863f8600727XBOX04axiscom_--
