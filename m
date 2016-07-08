Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id CB27360119
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jul 2016 16:11:09 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 08 Jul 2016 09:11:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,330,1464678000"; 
	d="scan'208,217";a="731485113"
Received: from swold-mobl2.jf.intel.com ([10.254.96.90])
	by FMSMGA003.fm.intel.com with ESMTP; 08 Jul 2016 09:11:09 -0700
Message-ID: <1467994269.6912.374.camel@linux.intel.com>
From: Saul Wold <sgw@linux.intel.com>
To: Yocto Discussion <yocto@yoctoproject.org>, OpenEmbedded List
	<openembedded-core@lists.openembedded.org>
Date: Fri, 08 Jul 2016 09:11:09 -0700
X-Mailer: Evolution 3.18.5.2 (3.18.5.2-1.fc23) 
Mime-Version: 1.0
Subject: Yocto Project Status WW28
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
X-List-Received-Date: Fri, 08 Jul 2016 16:11:10 -0000
Content-Type: multipart/alternative; boundary="=-WIKpIhVZP7+GnimLGfU3"

--=-WIKpIhVZP7+GnimLGfU3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Current Dev Position: YP 2.2 M2
Next Deadline: YP 2.2 M2 cut off would
be: 7/18/16

SWAT team rotation: Bill -> Paul
https://wiki.yoctoproject.org/wiki/Yoct
o_Build_Failure_Swat_Team

Key Status/Updates:
 * M1 QA report is out however there are concerns about performanceregressions which have not been root caused. M1 will continue to bedelayed until we figure out those issues and the fact that medium+ bugsand high bugs are still assigned to M1.
 * M2 patch merging is held up due to the shear volume of regressionswe’re seeing which are basically being left to Ross/RP to triage andfind the patches responsible. 
 * We did upgrade pseudo after various issues which brings in severalxattr fixes and resolves the init problems we were seeing in pseudotowards the end of the last release properly, rather than theworkarounds we put in place.
 * We’ve merged the progress patches from Paul so we get better feedbackduring the build for how various tasks are progressing.
 * We’re looking likely to remove directfb from OE-Core since the projectappears to have died.
 * 2.1.1 is in QA having had a successful build. We are working with areduced capacity QA team due to various changes at Intel/WindRiver sowe will have more limited QA testing of this unfortunately.

Key YP 2.2 Dates:
 * YP 2.2 M1 release would be: 6/24/16
 * YP 2.2 M2 cut off would be: 7/18/16
 * YP 2.2 M2 release would be: 7/29/16
 * YP 2.2 M3 cut off would be: 8/29/16
 * YP 2.2 M3 release would be: 9/9/16
 * YP 2.2 M4 cut off would be: 10/3/16
 * YP 2.2 M4 release would be: 10/28/16

Tracking Metrics:
	WDD 2747 (last week 2718)
(https://wiki.yoctoproject.org/charts/combo.html)

Key Status Links for YP:
https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.2_Status
https://wiki.yoctoproject.org/wiki/Yocto_2.2_Schedule
https://wiki.yoctoproject.org/wiki/Yocto_2.2_Features

[If anyone has suggestions for other information you’d like to see on this weekly status update, let us know!]

--=-WIKpIhVZP7+GnimLGfU3
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div><span id=3D"docs-internal-guid-f2717342-cb44-=
dd2f-4c8b-3a3213588c39"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top=
:0pt;margin-bottom:0pt;"><span style=3D"font-size: 14.666666666666666px; fo=
nt-family: Arial; color: rgb(0, 0, 0); background-color: transparent; verti=
cal-align: baseline; white-space: pre-wrap;">Current Dev Position: YP 2.2 M=
2</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-=
bottom:0pt;"><span style=3D"font-size: 14.666666666666666px; font-family: A=
rial; color: rgb(0, 0, 0); background-color: transparent; vertical-align: b=
aseline; white-space: pre-wrap;">Next Deadline: YP 2.2 M2 cut off would be:=
 7/18/16</span></p><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:=
0pt;margin-bottom:0pt;"><span style=3D"font-size: 14.666666666666666px; fon=
t-family: Arial; color: rgb(0, 0, 0); background-color: transparent; vertic=
al-align: baseline; white-space: pre-wrap;">SWAT team rotation: Bill -&gt; =
Paul</span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;marg=
in-bottom:0pt;"><a href=3D"https://wiki.yoctoproject.org/wiki/Yocto_Build_F=
ailure_Swat_Team" style=3D"text-decoration:none;"><span style=3D"font-size:=
 14.666666666666666px; font-family: Consolas; color: rgb(17, 85, 204); back=
ground-color: transparent; text-decoration: underline; vertical-align: base=
line; white-space: pre-wrap;">https://wiki.yoctoproject.org/wiki/Yocto_Buil=
d_Failure_Swat_Team</span></a></p><br><p dir=3D"ltr" style=3D"line-height:1=
.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 14.6666666=
66666666px; font-family: Arial; color: rgb(0, 0, 0); background-color: tran=
sparent; vertical-align: baseline; white-space: pre-wrap;">Key Status/Updat=
es:</span></p><ul style=3D"margin-top:0pt;margin-bottom:0pt;"><li dir=3D"lt=
r" style=3D"list-style-type: disc; font-size: 14.666666666666666px; font-fa=
mily: Arial; color: rgb(0, 0, 0); background-color: transparent; vertical-a=
lign: baseline;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;ma=
rgin-bottom:0pt;"><span style=3D"font-size: 14.666666666666666px; backgroun=
d-color: transparent; vertical-align: baseline; white-space: pre-wrap;">M1 =
QA report is out however there are concerns about performance regressions w=
hich have not been root caused. M1 will continue to be delayed until we fig=
ure out those issues and the fact that medium+ bugs and high bugs are still=
 assigned to M1.</span></p></li><li dir=3D"ltr" style=3D"list-style-type: d=
isc; font-size: 14.666666666666666px; font-family: Arial; color: rgb(0, 0, =
0); background-color: transparent; vertical-align: baseline;"><p dir=3D"ltr=
" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=
=3D"font-size: 14.666666666666666px; background-color: transparent; vertica=
l-align: baseline; white-space: pre-wrap;">M2 patch merging is held up due =
to the shear volume of regressions we=E2=80=99re seeing which are basically=
 being left to Ross/RP to triage and find the patches responsible. </span><=
/p></li><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 14.66666=
6666666666px; font-family: Arial; color: rgb(0, 0, 0); background-color: tr=
ansparent; vertical-align: baseline;"><p dir=3D"ltr" style=3D"line-height:1=
.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 14.6666666=
66666666px; background-color: transparent; vertical-align: baseline; white-=
space: pre-wrap;">We did upgrade pseudo after various issues which brings i=
n several xattr fixes and resolves the init problems we were seeing in pseu=
do towards the end of the last release properly, rather than the workaround=
s we put in place.</span></p></li><li dir=3D"ltr" style=3D"list-style-type:=
 disc; font-size: 14.666666666666666px; font-family: Arial; color: rgb(0, 0=
, 0); background-color: transparent; vertical-align: baseline;"><p dir=3D"l=
tr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span styl=
e=3D"font-size: 14.666666666666666px; background-color: transparent; vertic=
al-align: baseline; white-space: pre-wrap;">We=E2=80=99ve merged the progre=
ss patches from Paul so we get better feedback during the build for how var=
ious tasks are progressing.</span></p></li><li dir=3D"ltr" style=3D"list-st=
yle-type: disc; font-size: 14.666666666666666px; font-family: Arial; color:=
 rgb(0, 0, 0); background-color: transparent; vertical-align: baseline;"><p=
 dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><=
span style=3D"font-size: 14.666666666666666px; background-color: transparen=
t; vertical-align: baseline; white-space: pre-wrap;">We=E2=80=99re looking =
likely to remove directfb from OE-Core since the project appears to have di=
ed.</span></p></li><li dir=3D"ltr" style=3D"list-style-type: disc; font-siz=
e: 14.666666666666666px; font-family: Arial; color: rgb(0, 0, 0); backgroun=
d-color: transparent; vertical-align: baseline;"><p dir=3D"ltr" style=3D"li=
ne-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size:=
 14.666666666666666px; background-color: transparent; vertical-align: basel=
ine; white-space: pre-wrap;">2.1.1 is in QA having had a successful build. =
We are working with a reduced capacity QA team due to various changes at In=
tel/WindRiver so we will have more limited QA testing of this unfortunately=
.</span></p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-t=
op:0pt;margin-bottom:0pt;"><span style=3D"font-size: 14.666666666666666px; =
font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; ver=
tical-align: baseline; white-space: pre-wrap;">Key YP 2.2 Dates:</span></p>=
<ul style=3D"margin-top:0pt;margin-bottom:0pt;"><li dir=3D"ltr" style=3D"li=
st-style-type: disc; font-size: 14.666666666666666px; font-family: Arial; c=
olor: rgb(0, 0, 0); background-color: transparent; vertical-align: baseline=
;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0p=
t;"><span style=3D"font-size: 14.666666666666666px; background-color: trans=
parent; vertical-align: baseline; white-space: pre-wrap;">YP 2.2 M1 release=
 would be: 6/24/16</span></p></li><li dir=3D"ltr" style=3D"list-style-type:=
 disc; font-size: 14.666666666666666px; font-family: Arial; color: rgb(0, 0=
, 0); background-color: transparent; vertical-align: baseline;"><p dir=3D"l=
tr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span styl=
e=3D"font-size: 14.666666666666666px; background-color: transparent; vertic=
al-align: baseline; white-space: pre-wrap;">YP 2.2 M2 cut off would be: 7/1=
8/16</span></p></li><li dir=3D"ltr" style=3D"list-style-type: disc; font-si=
ze: 14.666666666666666px; font-family: Arial; color: rgb(0, 0, 0); backgrou=
nd-color: transparent; vertical-align: baseline;"><p dir=3D"ltr" style=3D"l=
ine-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size=
: 14.666666666666666px; background-color: transparent; vertical-align: base=
line; white-space: pre-wrap;">YP 2.2 M2 release would be: 7/29/16</span></p=
></li><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 14.6666666=
66666666px; font-family: Arial; color: rgb(0, 0, 0); background-color: tran=
sparent; vertical-align: baseline;"><p dir=3D"ltr" style=3D"line-height:1.3=
8;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 14.666666666=
666666px; background-color: transparent; vertical-align: baseline; white-sp=
ace: pre-wrap;">YP 2.2 M3 cut off would be: 8/29/16</span></p></li><li dir=
=3D"ltr" style=3D"list-style-type: disc; font-size: 14.666666666666666px; f=
ont-family: Arial; color: rgb(0, 0, 0); background-color: transparent; vert=
ical-align: baseline;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:=
0pt;margin-bottom:0pt;"><span style=3D"font-size: 14.666666666666666px; bac=
kground-color: transparent; vertical-align: baseline; white-space: pre-wrap=
;">YP 2.2 M3 release would be: 9/9/16</span></p></li><li dir=3D"ltr" style=
=3D"list-style-type: disc; font-size: 14.666666666666666px; font-family: Ar=
ial; color: rgb(0, 0, 0); background-color: transparent; vertical-align: ba=
seline;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bot=
tom:0pt;"><span style=3D"font-size: 14.666666666666666px; background-color:=
 transparent; vertical-align: baseline; white-space: pre-wrap;">YP 2.2 M4 c=
ut off would be: 10/3/16</span></p></li><li dir=3D"ltr" style=3D"list-style=
-type: disc; font-size: 14.666666666666666px; font-family: Arial; color: rg=
b(0, 0, 0); background-color: transparent; vertical-align: baseline;"><p di=
r=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><spa=
n style=3D"font-size: 14.666666666666666px; background-color: transparent; =
vertical-align: baseline; white-space: pre-wrap;">YP 2.2 M4 release would b=
e: 10/28/16</span></p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.3=
8;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 14.666666666=
666666px; font-family: Arial; color: rgb(0, 0, 0); background-color: transp=
arent; vertical-align: baseline; white-space: pre-wrap;">Tracking Metrics:<=
/span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bo=
ttom:0pt;"><span style=3D"font-size: 14.666666666666666px; font-family: Ari=
al; color: rgb(0, 0, 0); background-color: transparent; vertical-align: bas=
eline; white-space: pre-wrap;"><span class=3D"Apple-tab-span" style=3D"whit=
e-space:pre;">	</span></span><span style=3D"font-size: 14.666666666666666px=
; font-family: Arial; color: rgb(0, 0, 0); background-color: transparent; v=
ertical-align: baseline; white-space: pre-wrap;">WDD 2747 (last week 2718)<=
/span></p><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bo=
ttom:0pt;text-indent: 36pt;"><span style=3D"font-size: 14.666666666666666px=
; font-family: Consolas; color: rgb(0, 0, 0); background-color: transparent=
; vertical-align: baseline; white-space: pre-wrap;">(</span><a href=3D"http=
s://wiki.yoctoproject.org/charts/combo.html" style=3D"text-decoration:none;=
"><span style=3D"font-size: 14.666666666666666px; font-family: Arial; color=
: rgb(17, 85, 204); background-color: transparent; text-decoration: underli=
ne; vertical-align: baseline; white-space: pre-wrap;">https://wiki.yoctopro=
ject.org/charts/combo.html</span></a><span style=3D"font-size: 14.666666666=
666666px; font-family: Consolas; color: rgb(0, 0, 0); background-color: tra=
nsparent; vertical-align: baseline; white-space: pre-wrap;">)</span></p><br=
><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;=
"><span style=3D"font-size: 14.666666666666666px; font-family: Arial; color=
: rgb(0, 0, 0); background-color: transparent; vertical-align: baseline; wh=
ite-space: pre-wrap;">Key Status Links for YP:</span></p><p dir=3D"ltr" sty=
le=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><a href=3D"https:=
//wiki.yoctoproject.org/wiki/Yocto_Project_v2.2_Status" style=3D"text-decor=
ation:none;"><span style=3D"font-size: 14.666666666666666px; font-family: C=
onsolas; color: rgb(17, 85, 204); background-color: transparent; text-decor=
ation: underline; vertical-align: baseline; white-space: pre-wrap;">https:/=
/wiki.yoctoproject.org/wiki/Yocto_Project_v2.2_Status</span></a></p><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><a hr=
ef=3D"https://wiki.yoctoproject.org/wiki/Yocto_2.2_Schedule" style=3D"text-=
decoration:none;"><span style=3D"font-size: 14.666666666666666px; font-fami=
ly: Consolas; color: rgb(17, 85, 204); background-color: transparent; text-=
decoration: underline; vertical-align: baseline; white-space: pre-wrap;">ht=
tps://wiki.yoctoproject.org/wiki/Yocto_2.2_Schedule</span></a></p><p dir=3D=
"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><a href=
=3D"https://wiki.yoctoproject.org/wiki/Yocto_2.2_Features" style=3D"text-de=
coration:none;"><span style=3D"font-size: 14.666666666666666px; font-family=
: Consolas; color: rgb(17, 85, 204); background-color: transparent; text-de=
coration: underline; vertical-align: baseline; white-space: pre-wrap;">http=
s://wiki.yoctoproject.org/wiki/Yocto_2.2_Features</span></a></p><br><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span=
 style=3D"font-size: 14.666666666666666px; font-family: Arial; color: rgb(0=
, 0, 0); background-color: transparent; vertical-align: baseline; white-spa=
ce: pre-wrap;">[If anyone has suggestions for other information you=E2=80=
=99d like to see on this weekly status update, let us know!]</span></p><div=
><span style=3D"font-size: 14.666666666666666px; font-family: Arial; color:=
 rgb(0, 0, 0); background-color: transparent; vertical-align: baseline; whi=
te-space: pre-wrap;"><br></span></div></span></div></body></html>

--=-WIKpIhVZP7+GnimLGfU3--
