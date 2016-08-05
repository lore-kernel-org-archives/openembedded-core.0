Return-Path: <sgw@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id C585D77117
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2016 16:30:50 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 05 Aug 2016 09:30:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,474,1464678000"; 
	d="scan'208,217";a="744708569"
Received: from swold-mobl2.amr.corp.intel.com ([10.255.76.148])
	by FMSMGA003.fm.intel.com with ESMTP; 05 Aug 2016 09:30:52 -0700
Message-ID: <1470414650.3175.420.camel@linux.intel.com>
From: Saul Wold <sgw@linux.intel.com>
To: Yocto Discussion <yocto@yoctoproject.org>, OpenEmbedded List
	<openembedded-core@lists.openembedded.org>
Date: Fri, 05 Aug 2016 09:30:50 -0700
X-Mailer: Evolution 3.20.4 (3.20.4-1.fc24) 
Mime-Version: 1.0
Subject: Yocto Project Status WW32
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
X-List-Received-Date: Fri, 05 Aug 2016 16:30:51 -0000
Content-Type: multipart/alternative; boundary="=-qe0GKr7eaYlxSL0K2z1l"

--=-qe0GKr7eaYlxSL0K2z1l
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit


Current Dev Position: YP 2.2 M3
Next Deadline: YP 2.2 M3 which will be Aug 29th (5:00pm GMT)

SWAT team rotation: Randy -> Leo
https://wiki.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team

Key Status/Updates:
 * We decided to release M2 with known issues. We have a good handle on some of them, there are others which are unknown but there is no one specific cause of the bugs. 
 * We will run another full QA pass before M3 to try and make sure we are dealing with the known bugs.
 * Merging of patches continues to be slow as it is proving hard to work out which patches are causing which breakage. The test matrix continues to increase with people being upset if their personal favourite set of options breaks yet we can’t expect to test and catch every regression. We’re not sure what to do about this, the scope of the testing is greater than it ever has been but it does seem to be slowing things down.
 * A patch for performance issues with pseudo when using xattrs have was merged
 * 2.1.1 is currently in QA and is expected to be completed early next week, this update contains numerous fixes for for a variety of areas including CVEs, GCC 6.x on Host OS and updated SRC_URIs

Key YP 2.2 Dates:
 * YP 2.2 M1 release would be: 6/24/16
 * YP 2.2 M2 cut off would be: 7/18/16
 * YP 2.2 M2 release would be: 7/29/16
 * YP 2.2 M3 cut off would be: 8/29/16
 * YP 2.2 M3 release would be: 9/9/16
 * YP 2.2 M4 cut off would be: 10/3/16
 * YP 2.2 M4 release would be: 10/28/16

Tracking Metrics:
	WDD 2714 (last week 2744)
(https://wiki.yoctoproject.org/charts/combo.html)

Key Status Links for YP:
https://wiki.yoctoproject.org/wiki/Yocto_Project_v2.2_Status
https://wiki.yoctoproject.org/wiki/Yocto_2.2_Schedule
https://wiki.yoctoproject.org/wiki/Yocto_2.2_Features

[If anyone has suggestions for other information you’d like to see on this weekly status update, let us know!]

--=-qe0GKr7eaYlxSL0K2z1l
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div><span id=3D"docs-internal-guid-389028ff-5b89-=
e111-e3f2-266673a74654"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top=
:0pt;margin-bottom:0pt;"><span style=3D"color: rgb(0, 0, 0); font-family: A=
rial; font-size: 14.666666666666666px; white-space: pre-wrap; background-co=
lor: transparent; line-height: 1.38;"><br></span></p><p dir=3D"ltr" style=
=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"colo=
r: rgb(0, 0, 0); font-family: Arial; font-size: 14.666666666666666px; white=
-space: pre-wrap; background-color: transparent; line-height: 1.38;">Curren=
t Dev Position: YP 2.2 M3</span></p><p dir=3D"ltr" style=3D"line-height:1.3=
8;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 14.666666666=
666666px; font-family: Arial; color: rgb(0, 0, 0); background-color: transp=
arent; vertical-align: baseline; white-space: pre-wrap;">Next Deadline: YP =
2.2 M3 which will be Aug 29th (5:00pm GMT)</span></p><br><p dir=3D"ltr" sty=
le=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"fo=
nt-size: 14.666666666666666px; font-family: Arial; color: rgb(0, 0, 0); bac=
kground-color: transparent; vertical-align: baseline; white-space: pre-wrap=
;">SWAT team rotation: Randy -&gt; Leo</span></p><p dir=3D"ltr" style=3D"li=
ne-height:1.38;margin-top:0pt;margin-bottom:0pt;"><a href=3D"https://wiki.y=
octoproject.org/wiki/Yocto_Build_Failure_Swat_Team" style=3D"text-decoratio=
n:none;"><span style=3D"font-size: 14.666666666666666px; font-family: Conso=
las; color: rgb(17, 85, 204); background-color: transparent; text-decoratio=
n: underline; vertical-align: baseline; white-space: pre-wrap;">https://wik=
i.yoctoproject.org/wiki/Yocto_Build_Failure_Swat_Team</span></a></p><br><p =
dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><s=
pan style=3D"font-size: 14.666666666666666px; font-family: Arial; color: rg=
b(0, 0, 0); background-color: transparent; vertical-align: baseline; white-=
space: pre-wrap;">Key Status/Updates:</span></p><ul style=3D"margin-top:0pt=
;margin-bottom:0pt;"><li dir=3D"ltr" style=3D"list-style-type: disc; font-s=
ize: 14.666666666666666px; font-family: Arial; color: rgb(0, 0, 0); backgro=
und-color: transparent; vertical-align: baseline;"><p dir=3D"ltr" style=3D"=
line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-siz=
e: 14.666666666666666px; background-color: transparent; vertical-align: bas=
eline; white-space: pre-wrap;">We decided to release M2 with known issues. =
We have a good handle on some of them, there are others which are unknown b=
ut there is no one specific cause of the bugs. </span></p></li><li dir=3D"l=
tr" style=3D"list-style-type: disc; font-size: 14.666666666666666px; font-f=
amily: Arial; color: rgb(0, 0, 0); background-color: transparent; vertical-=
align: baseline;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;m=
argin-bottom:0pt;"><span style=3D"font-size: 14.666666666666666px; backgrou=
nd-color: transparent; vertical-align: baseline; white-space: pre-wrap;">We=
 will run another full QA pass before M3 to try and make sure we are dealin=
g with the known bugs.</span></p></li><li dir=3D"ltr" style=3D"list-style-t=
ype: disc; font-size: 14.666666666666666px; font-family: Arial; color: rgb(=
0, 0, 0); background-color: transparent; vertical-align: baseline;"><p dir=
=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span=
 style=3D"font-size: 14.666666666666666px; background-color: transparent; v=
ertical-align: baseline; white-space: pre-wrap;">Merging of patches continu=
es to be slow as it is proving hard to work out which patches are causing w=
hich breakage. The test matrix continues to increase with people being upse=
t if their personal favourite set of options breaks yet we can=E2=80=99t ex=
pect to test and catch every regression. We=E2=80=99re not sure what to do =
about this, the scope of the testing is greater than it ever has been but i=
t does seem to be slowing things down.</span></p></li><li dir=3D"ltr" style=
=3D"list-style-type: disc; font-size: 14.666666666666666px; font-family: Ar=
ial; color: rgb(0, 0, 0); background-color: transparent; vertical-align: ba=
seline;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bot=
tom:0pt;"><span style=3D"font-size: 14.666666666666666px; background-color:=
 transparent; vertical-align: baseline; white-space: pre-wrap;">A patch for=
 performance issues with pseudo when using xattrs have was merged</span></p=
></li><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 14.6666666=
66666666px; font-family: Arial; color: rgb(0, 0, 0); background-color: tran=
sparent; vertical-align: baseline;"><p dir=3D"ltr" style=3D"line-height:1.3=
8;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 14.666666666=
666666px; background-color: transparent; vertical-align: baseline; white-sp=
ace: pre-wrap;">2.1.1 is currently in QA and is expected to be completed ea=
rly next week, this update contains numerous fixes for for a variety of are=
as including CVEs, GCC 6.x on Host OS and updated SRC_URIs</span></p></li><=
/ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bott=
om:0pt;"><span style=3D"font-size: 14.666666666666666px; font-family: Arial=
; color: rgb(0, 0, 0); background-color: transparent; vertical-align: basel=
ine; white-space: pre-wrap;">Key YP 2.2 Dates:</span></p><ul style=3D"margi=
n-top:0pt;margin-bottom:0pt;"><li dir=3D"ltr" style=3D"list-style-type: dis=
c; font-size: 14.666666666666666px; font-family: Arial; color: rgb(0, 0, 0)=
; background-color: transparent; vertical-align: baseline;"><p dir=3D"ltr" =
style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D=
"font-size: 14.666666666666666px; background-color: transparent; vertical-a=
lign: baseline; white-space: pre-wrap;">YP 2.2 M1 release would be: 6/24/16=
</span></p></li><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: =
14.666666666666666px; font-family: Arial; color: rgb(0, 0, 0); background-c=
olor: transparent; vertical-align: baseline;"><p dir=3D"ltr" style=3D"line-=
height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 14=
.666666666666666px; background-color: transparent; vertical-align: baseline=
; white-space: pre-wrap;">YP 2.2 M2 cut off would be: 7/18/16</span></p></l=
i><li dir=3D"ltr" style=3D"list-style-type: disc; font-size: 14.66666666666=
6666px; font-family: Arial; color: rgb(0, 0, 0); background-color: transpar=
ent; vertical-align: baseline;"><p dir=3D"ltr" style=3D"line-height:1.38;ma=
rgin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 14.6666666666666=
66px; background-color: transparent; vertical-align: baseline; white-space:=
 pre-wrap;">YP 2.2 M2 release would be: 7/29/16</span></p></li><li dir=3D"l=
tr" style=3D"list-style-type: disc; font-size: 14.666666666666666px; font-f=
amily: Arial; color: rgb(0, 0, 0); background-color: transparent; vertical-=
align: baseline;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;m=
argin-bottom:0pt;"><span style=3D"font-size: 14.666666666666666px; backgrou=
nd-color: transparent; vertical-align: baseline; white-space: pre-wrap;">YP=
 2.2 M3 cut off would be: 8/29/16</span></p></li><li dir=3D"ltr" style=3D"l=
ist-style-type: disc; font-size: 14.666666666666666px; font-family: Arial; =
color: rgb(0, 0, 0); background-color: transparent; vertical-align: baselin=
e;"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0=
pt;"><span style=3D"font-size: 14.666666666666666px; background-color: tran=
sparent; vertical-align: baseline; white-space: pre-wrap;">YP 2.2 M3 releas=
e would be: 9/9/16</span></p></li><li dir=3D"ltr" style=3D"list-style-type:=
 disc; font-size: 14.666666666666666px; font-family: Arial; color: rgb(0, 0=
, 0); background-color: transparent; vertical-align: baseline;"><p dir=3D"l=
tr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span styl=
e=3D"font-size: 14.666666666666666px; background-color: transparent; vertic=
al-align: baseline; white-space: pre-wrap;">YP 2.2 M4 cut off would be: 10/=
3/16</span></p></li><li dir=3D"ltr" style=3D"list-style-type: disc; font-si=
ze: 14.666666666666666px; font-family: Arial; color: rgb(0, 0, 0); backgrou=
nd-color: transparent; vertical-align: baseline;"><p dir=3D"ltr" style=3D"l=
ine-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size=
: 14.666666666666666px; background-color: transparent; vertical-align: base=
line; white-space: pre-wrap;">YP 2.2 M4 release would be: 10/28/16</span></=
p></li></ul><br><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;mar=
gin-bottom:0pt;"><span style=3D"font-size: 14.666666666666666px; font-famil=
y: Arial; color: rgb(0, 0, 0); background-color: transparent; vertical-alig=
n: baseline; white-space: pre-wrap;">Tracking Metrics:</span></p><p dir=3D"=
ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span sty=
le=3D"font-size: 14.666666666666666px; font-family: Arial; color: rgb(0, 0,=
 0); background-color: transparent; vertical-align: baseline; white-space: =
pre-wrap;"><span class=3D"Apple-tab-span" style=3D"white-space:pre;">	</spa=
n></span><span style=3D"font-size: 14.666666666666666px; font-family: Arial=
; color: rgb(0, 0, 0); background-color: transparent; vertical-align: basel=
ine; white-space: pre-wrap;">WDD 2714 (last week 2744)</span></p><p dir=3D"=
ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;text-indent=
: 36pt;"><span style=3D"font-size: 14.666666666666666px; font-family: Conso=
las; color: rgb(0, 0, 0); background-color: transparent; vertical-align: ba=
seline; white-space: pre-wrap;">(</span><a href=3D"https://wiki.yoctoprojec=
t.org/charts/combo.html" style=3D"text-decoration:none;"><span style=3D"fon=
t-size: 14.666666666666666px; font-family: Arial; color: rgb(17, 85, 204); =
background-color: transparent; text-decoration: underline; vertical-align: =
baseline; white-space: pre-wrap;">https://wiki.yoctoproject.org/charts/comb=
o.html</span></a><span style=3D"font-size: 14.666666666666666px; font-famil=
y: Consolas; color: rgb(0, 0, 0); background-color: transparent; vertical-a=
lign: baseline; white-space: pre-wrap;">)</span></p><br><p dir=3D"ltr" styl=
e=3D"line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"fon=
t-size: 14.666666666666666px; font-family: Arial; color: rgb(0, 0, 0); back=
ground-color: transparent; vertical-align: baseline; white-space: pre-wrap;=
">Key Status Links for YP:</span></p><p dir=3D"ltr" style=3D"line-height:1.=
38;margin-top:0pt;margin-bottom:0pt;"><a href=3D"https://wiki.yoctoproject.=
org/wiki/Yocto_Project_v2.2_Status" style=3D"text-decoration:none;"><span s=
tyle=3D"font-size: 14.666666666666666px; font-family: Consolas; color: rgb(=
17, 85, 204); background-color: transparent; text-decoration: underline; ve=
rtical-align: baseline; white-space: pre-wrap;">https://wiki.yoctoproject.o=
rg/wiki/Yocto_Project_v2.2_Status</span></a></p><p dir=3D"ltr" style=3D"lin=
e-height:1.38;margin-top:0pt;margin-bottom:0pt;"><a href=3D"https://wiki.yo=
ctoproject.org/wiki/Yocto_2.2_Schedule" style=3D"text-decoration:none;"><sp=
an style=3D"font-size: 14.666666666666666px; font-family: Consolas; color: =
rgb(17, 85, 204); background-color: transparent; text-decoration: underline=
; vertical-align: baseline; white-space: pre-wrap;">https://wiki.yoctoproje=
ct.org/wiki/Yocto_2.2_Schedule</span></a></p><p dir=3D"ltr" style=3D"line-h=
eight:1.38;margin-top:0pt;margin-bottom:0pt;"><a href=3D"https://wiki.yocto=
project.org/wiki/Yocto_2.2_Features" style=3D"text-decoration:none;"><span =
style=3D"font-size: 14.666666666666666px; font-family: Consolas; color: rgb=
(17, 85, 204); background-color: transparent; text-decoration: underline; v=
ertical-align: baseline; white-space: pre-wrap;">https://wiki.yoctoproject.=
org/wiki/Yocto_2.2_Features</span></a></p><br><p dir=3D"ltr" style=3D"line-=
height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style=3D"font-size: 14=
.666666666666666px; font-family: Arial; color: rgb(0, 0, 0); background-col=
or: transparent; vertical-align: baseline; white-space: pre-wrap;">[If anyo=
ne has suggestions for other information you=E2=80=99d like to see on this =
weekly status update, let us know!]</span></p><br></span></div><div></div><=
/body></html>

--=-qe0GKr7eaYlxSL0K2z1l--
