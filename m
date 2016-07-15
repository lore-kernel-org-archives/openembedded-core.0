Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9C0CF606D0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jul 2016 15:32:37 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 15 Jul 2016 08:32:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,368,1464678000"; 
	d="scan'208,217";a="995978346"
Received: from swold-mobl2.jf.intel.com ([10.255.93.103])
	by orsmga001.jf.intel.com with ESMTP; 15 Jul 2016 08:32:37 -0700
Message-ID: <1468596746.6912.772.camel@linux.intel.com>
From: Saul Wold <sgw@linux.intel.com>
To: Yocto Discussion <yocto@yoctoproject.org>, OpenEmbedded List
	<openembedded-core@lists.openembedded.org>
Date: Fri, 15 Jul 2016 08:32:26 -0700
X-Mailer: Evolution 3.18.5.2 (3.18.5.2-1.fc23) 
Mime-Version: 1.0
Subject: Yocto Project Status WW29
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
X-List-Received-Date: Fri, 15 Jul 2016 15:32:39 -0000
Content-Type: multipart/alternative; boundary="=-Ab4wBw8eIKnDPNXCXSnh"

--=-Ab4wBw8eIKnDPNXCXSnh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit


Current Dev Position: YP 2.2 M2
Next Deadline: YP 2.2 M2 cut off would
be: 7/18/16 (This coming Monday - 5:00pm GMT)

SWAT team rotation: Paul -> Ross
https://wiki.yoctoproject.org/wiki/Yoct
o_Build_Failure_Swat_Team

Key Status/Updates:
 * Richard has been out this week, so the report will be thin.
 * Performance regressions were narrowed down to the GCC6 Update, movingto GTK3 and the Python3 port. Investigation into how to mitigate thisis ongoing.
 * We’re considering removing uclibc and GCC 5.4 (preferring musl and GCC6) from OE Core 2.2, so if this would impact you please speak up.
 * 2.1.1 Completed QA, but there was a High found to do with supportingFedora 24, which released very soon after 2.1 initially released andshould be a supported build host. This will delay 2.1.1 until after M2QA is completed.
 * Reminder that the M2 cut off is this coming Monday!

Key YP 2.2 Dates:
 * YP 2.2 M1 release would be: 6/24/16
 * YP 2.2 M2 cut off would be: 7/18/16
 * YP 2.2 M2 release would be: 7/29/16
 * YP 2.2 M3 cut off would be: 8/29/16
 * YP 2.2 M3 release would be: 9/9/16
 * YP 2.2 M4 cut off would be: 10/3/16
 * YP 2.2 M4 release would be: 10/28/16

Tracking Metrics:
	WDD 2698 (last week 2747)
(https://wiki.yoctoproject.org/charts/combo.html)

Key Status Links for YP:
https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.2_Status
https://wiki.yoctoproject.org/wiki/Yocto_2.2_Schedule
https://wiki.yoctoproject.org/wiki/Yocto_2.2_Features

[If anyone has suggestions for other information you’d like to see on this weekly status update, let us know!]


--=-Ab4wBw8eIKnDPNXCXSnh
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div><br></div><div><span id=3D"docs-internal-guid=
-f2717342-ef2e-0efe-96ce-f8b96f699fec"><p dir=3D"ltr" style=3D"line-height:=
1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 14.666666=
666666666px; font-family: Arial; color: rgb(0, 0, 0); background-color: tra=
nsparent; vertical-align: baseline; white-space: pre-wrap;">Current Dev Pos=
ition: YP 2.2 M2</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-=
top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 14.666666666666666px;=
 font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; ve=
rtical-align: baseline; white-space: pre-wrap;">Next Deadline: YP 2.2 M2 cu=
t off would be: 7/18/16 (This coming Monday - 5:00pm GMT)</span></p><br><p =
dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><s=
pan style=3D"font-size: 14.666666666666666px; font-family: Arial; color: rg=
b(0, 0, 0); background-color: transparent; vertical-align: baseline; white-=
space: pre-wrap;">SWAT team rotation: Paul -&gt; Ross</span></p><p dir=3D"l=
tr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><a href=3D=
"https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team" style=3D=
"text-decoration:none;"><span style=3D"font-size: 14.666666666666666px; fon=
t-family: Consolas; color: rgb(17, 85, 204); background-color: transparent;=
 text-decoration: underline; vertical-align: baseline; white-space: pre-wra=
p;">https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team</span>=
</a></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-=
bottom:0pt;"><span style=3D"font-size: 14.666666666666666px; font-family: A=
rial; color: rgb(0, 0, 0); background-color: transparent; vertical-align: b=
aseline; white-space: pre-wrap;">Key Status/Updates:</span></p><ul style=3D=
"margin-top:0pt;margin-bottom:0pt;"><li dir=3D"ltr" style=3D"list-style-typ=
e: disc; font-size: 14.666666666666666px; font-family: Arial; color: rgb(0,=
 0, 0); background-color: transparent; vertical-align: baseline;"><p dir=3D=
"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span st=
yle=3D"font-size: 14.666666666666666px; background-color: transparent; vert=
ical-align: baseline; white-space: pre-wrap;">Richard has been out this wee=
k, so the report will be thin.</span></p></li><li dir=3D"ltr" style=3D"list=
-style-type: disc; font-size: 14.666666666666666px; font-family: Arial; col=
or: rgb(0, 0, 0); background-color: transparent; vertical-align: baseline;"=
><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;=
"><span style=3D"font-size: 14.666666666666666px; background-color: transpa=
rent; vertical-align: baseline; white-space: pre-wrap;">Performance regress=
ions were narrowed down to the GCC6 Update, moving to GTK3 and the Python3 =
port. Investigation into how to mitigate this is ongoing.</span></p></li><l=
i dir=3D"ltr" style=3D"list-style-type: disc; font-size: 14.666666666666666=
px; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent;=
 vertical-align: baseline;"><p dir=3D"ltr" style=3D"line-height:1.38;margin=
-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 14.666666666666666px=
; background-color: transparent; vertical-align: baseline; white-space: pre=
-wrap;">We=E2=80=99re considering removing uclibc and GCC 5.4 (preferring m=
usl and GCC 6) from OE Core 2.2, so if this would impact you please speak u=
p.</span></p></li><li dir=3D"ltr" style=3D"list-style-type: disc; font-size=
: 14.666666666666666px; font-family: Arial; color: rgb(0, 0, 0); background=
-color: transparent; vertical-align: baseline;"><p dir=3D"ltr" style=3D"lin=
e-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: =
14.666666666666666px; background-color: transparent; vertical-align: baseli=
ne; white-space: pre-wrap;">2.1.1 Completed QA, but there was a High found =
to do with supporting Fedora 24, which released very soon after 2.1 initial=
ly released and should be a supported build host. This will delay 2.1.1 unt=
il after M2 QA is completed.</span></p></li><li dir=3D"ltr" style=3D"list-s=
tyle-type: disc; font-size: 14.666666666666666px; font-family: Arial; color=
: rgb(0, 0, 0); background-color: transparent; vertical-align: baseline;"><=
p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;">=
<span style=3D"font-size: 14.666666666666666px; background-color: transpare=
nt; vertical-align: baseline; white-space: pre-wrap;">Reminder that the M2 =
cut off is this coming Monday!</span></p></li></ul><br><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font=
-size: 14.666666666666666px; font-family: Arial; color: rgb(0, 0, 0); backg=
round-color: transparent; vertical-align: baseline; white-space: pre-wrap;"=
>Key YP 2.2 Dates:</span></p><ul style=3D"margin-top:0pt;margin-bottom:0pt;=
"><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 14.66666666666=
6666px; font-family: Arial; color: rgb(0, 0, 0); background-color: transpar=
ent; vertical-align: baseline;"><p dir=3D"ltr" style=3D"line-height:1.38;ma=
rgin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 14.6666666666666=
66px; background-color: transparent; vertical-align: baseline; white-space:=
 pre-wrap;">YP 2.2 M1 release would be: 6/24/16</span></p></li><li dir=3D"l=
tr" style=3D"list-style-type: disc; font-size: 14.666666666666666px; font-f=
amily: Arial; color: rgb(0, 0, 0); background-color: transparent; vertical-=
align: baseline;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;m=
argin-bottom:0pt;"><span style=3D"font-size: 14.666666666666666px; backgrou=
nd-color: transparent; vertical-align: baseline; white-space: pre-wrap;">YP=
 2.2 M2 cut off would be: 7/18/16</span></p></li><li dir=3D"ltr" style=3D"l=
ist-style-type: disc; font-size: 14.666666666666666px; font-family: Arial; =
color: rgb(0, 0, 0); background-color: transparent; vertical-align: baselin=
e;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0=
pt;"><span style=3D"font-size: 14.666666666666666px; background-color: tran=
sparent; vertical-align: baseline; white-space: pre-wrap;">YP 2.2 M2 releas=
e would be: 7/29/16</span></p></li><li dir=3D"ltr" style=3D"list-style-type=
: disc; font-size: 14.666666666666666px; font-family: Arial; color: rgb(0, =
0, 0); background-color: transparent; vertical-align: baseline;"><p dir=3D"=
ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span sty=
le=3D"font-size: 14.666666666666666px; background-color: transparent; verti=
cal-align: baseline; white-space: pre-wrap;">YP 2.2 M3 cut off would be: 8/=
29/16</span></p></li><li dir=3D"ltr" style=3D"list-style-type: disc; font-s=
ize: 14.666666666666666px; font-family: Arial; color: rgb(0, 0, 0); backgro=
und-color: transparent; vertical-align: baseline;"><p dir=3D"ltr" style=3D"=
line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-siz=
e: 14.666666666666666px; background-color: transparent; vertical-align: bas=
eline; white-space: pre-wrap;">YP 2.2 M3 release would be: 9/9/16</span></p=
></li><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 14.6666666=
66666666px; font-family: Arial; color: rgb(0, 0, 0); background-color: tran=
sparent; vertical-align: baseline;"><p dir=3D"ltr" style=3D"line-height:1.3=
8;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 14.666666666=
666666px; background-color: transparent; vertical-align: baseline; white-sp=
ace: pre-wrap;">YP 2.2 M4 cut off would be: 10/3/16</span></p></li><li dir=
=3D"ltr" style=3D"list-style-type: disc; font-size: 14.666666666666666px; f=
ont-family: Arial; color: rgb(0, 0, 0); background-color: transparent; vert=
ical-align: baseline;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:=
0pt;margin-bottom:0pt;"><span style=3D"font-size: 14.666666666666666px; bac=
kground-color: transparent; vertical-align: baseline; white-space: pre-wrap=
;">YP 2.2 M4 release would be: 10/28/16</span></p></li></ul><br><p dir=3D"l=
tr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span styl=
e=3D"font-size: 14.666666666666666px; font-family: Arial; color: rgb(0, 0, =
0); background-color: transparent; vertical-align: baseline; white-space: p=
re-wrap;">Tracking Metrics:</span></p><p dir=3D"ltr" style=3D"line-height:1=
.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 14.6666666=
66666666px; font-family: Arial; color: rgb(0, 0, 0); background-color: tran=
sparent; vertical-align: baseline; white-space: pre-wrap;"><span class=3D"A=
pple-tab-span" style=3D"white-space:pre;">	</span></span><span style=3D"fon=
t-size: 14.666666666666666px; font-family: Arial; color: rgb(0, 0, 0); back=
ground-color: transparent; vertical-align: baseline; white-space: pre-wrap;=
">WDD 2698 (last week 2747)</span></p><p dir=3D"ltr" style=3D"line-height:1=
.38;margin-top:0pt;margin-bottom:0pt;text-indent: 36pt;"><span style=3D"fon=
t-size: 14.666666666666666px; font-family: Consolas; color: rgb(0, 0, 0); b=
ackground-color: transparent; vertical-align: baseline; white-space: pre-wr=
ap;">(</span><a href=3D"https://wiki.yoctoproject.org/charts/combo.html" st=
yle=3D"text-decoration:none;"><span style=3D"font-size: 14.666666666666666p=
x; font-family: Arial; color: rgb(17, 85, 204); background-color: transpare=
nt; text-decoration: underline; vertical-align: baseline; white-space: pre-=
wrap;">https://wiki.yoctoproject.org/charts/combo.html</span></a><span styl=
e=3D"font-size: 14.666666666666666px; font-family: Consolas; color: rgb(0, =
0, 0); background-color: transparent; vertical-align: baseline; white-space=
: pre-wrap;">)</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margi=
n-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 14.666666666666666p=
x; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; =
vertical-align: baseline; white-space: pre-wrap;">Key Status Links for YP:<=
/span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bo=
ttom:0pt;"><a href=3D"https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.2=
_Status" style=3D"text-decoration:none;"><span style=3D"font-size: 14.66666=
6666666666px; font-family: Consolas; color: rgb(17, 85, 204); background-co=
lor: transparent; text-decoration: underline; vertical-align: baseline; whi=
te-space: pre-wrap;">https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.2_=
Status</span></a></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0p=
t;margin-bottom:0pt;"><a href=3D"https://wiki.yoctoproject.org/wiki/Yocto_2=
.2_Schedule" style=3D"text-decoration:none;"><span style=3D"font-size: 14.6=
66666666666666px; font-family: Consolas; color: rgb(17, 85, 204); backgroun=
d-color: transparent; text-decoration: underline; vertical-align: baseline;=
 white-space: pre-wrap;">https://wiki.yoctoproject.org/wiki/Yocto_2.2_Sched=
ule</span></a></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;m=
argin-bottom:0pt;"><a href=3D"https://wiki.yoctoproject.org/wiki/Yocto_2.2_=
Features" style=3D"text-decoration:none;"><span style=3D"font-size: 14.6666=
66666666666px; font-family: Consolas; color: rgb(17, 85, 204); background-c=
olor: transparent; text-decoration: underline; vertical-align: baseline; wh=
ite-space: pre-wrap;">https://wiki.yoctoproject.org/wiki/Yocto_2.2_Features=
</span></a></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;=
margin-bottom:0pt;"><span style=3D"font-size: 14.666666666666666px; font-fa=
mily: Arial; color: rgb(0, 0, 0); background-color: transparent; vertical-a=
lign: baseline; white-space: pre-wrap;">[If anyone has suggestions for othe=
r information you=E2=80=99d like to see on this weekly status update, let u=
s know!]</span></p><br></span></div><div></div></body></html>

--=-Ab4wBw8eIKnDPNXCXSnh--
