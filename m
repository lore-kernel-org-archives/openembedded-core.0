Return-Path: <praveenreddy.p@hcl.com>
X-Greylist: delayed 646 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 30 Jun 2016 05:08:33 UTC
Received: from GWS07.hcl.com (gws07.hcl.com [192.8.186.130])
	by mail.openembedded.org (Postfix) with ESMTP id F3E2160290
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jun 2016 05:08:33 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.26,550,1459794600"; d="scan'208,217";a="52467190"
Received: from unknown (HELO CHN-CORP-HT01.CORP.HCL.IN) ([10.249.2.33])
	by GWS07.hcl.com with ESMTP/TLS/AES128-SHA; 30 Jun 2016 10:27:41 +0530
Received: from CHN-HCLT-CSHT05.HCLT.CORP.HCL.IN (10.150.12.30) by
	CHN-CORP-HT01.CORP.HCL.IN (10.249.2.33) with Microsoft SMTP Server
	(TLS) id 14.3.235.1; Thu, 30 Jun 2016 10:26:32 +0530
Received: from CHN-HCLT-MBS04.HCLT.CORP.HCL.IN ([10.150.12.19]) by
	CHN-HCLT-CSHT05.HCLT.CORP.HCL.IN ([::1]) with mapi id 14.03.0294.000;
	Thu, 30 Jun 2016 10:26:32 +0530
From: Praveenreddy Padamati <praveenreddy.p@hcl.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: Yocto installation problem
Thread-Index: AdHSinZQ0FO6U7OCTrOhQ7Z8l9H55w==
Date: Thu, 30 Jun 2016 04:56:31 +0000
Message-ID: <09856974BCEE6F48AB378E52E4CAA73C230FDAAF@chn-hclt-mbs04.HCLT.CORP.HCL.IN>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.151.34.14]
MIME-Version: 1.0
Cc: Phani Kara <phani.k@hcl.com>
Subject: Reg: Yocto installation problem
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
X-List-Received-Date: Thu, 30 Jun 2016 05:08:35 -0000
X-Groupsio-MsgNum: 83979
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_002_09856974BCEE6F48AB378E52E4CAA73C230FDAAFchnhcltmbs04HCL_"

--_002_09856974BCEE6F48AB378E52E4CAA73C230FDAAFchnhcltmbs04HCL_
Content-Type: text/html; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style id=3D"owaParaStyle" type=3D"text/css">P {margin-top:0;margin-bottom:=
0;}</style>
</head>
<body ocsi=3D"0" fpstyle=3D"1">
<div style=3D"direction: ltr;font-family: Tahoma;color: #000000;font-size: =
10pt;">Hi all,<br>
<br>
I am installing the yocto in ubuntu version 14. Installtion is aborted inte=
rmediately. It comes out with the error<br>
<br>
&quot;ERROR: Task 984 (/home/kumarn/imx6_build/fsl-release-bsp/sources/poky=
/meta/recipes-devtools/perl/perl-native_5.22.0.bb, do_configure) failed wit=
h exit code '1'&quot;.<br>
<br>
Please find the log file in the attachment.<br>
<br>
Thanks<br>
Praveen Reddy P<br>
9989642159<br>
</div>
<span style=3D"FONT-FAMILY: 'Arial','sans-serif'; COLOR: gray; FONT-SIZE: 7=
.5pt; mso-fareast-font-family: 'Times New Roman'">
<P style=3D"MARGIN: 0in 0in 0pt" class=3DMsoNormal><br><br><font style=3D"F=
ONT-FAMILY: 'Arial','sans-serif'; COLOR: gray; FONT-SIZE: 9px">::DISCLAIMER=
::<br>---------------------------------------------------------------------=
---------------------------------------------------------------------------=
----</font></P>
<P style=3D"MARGIN: 0in 0in 0pt" class=3DMsoNormal><font style=3D"FONT-FAMI=
LY: 'Arial','sans-serif'; COLOR: gray; FONT-SIZE: 11px">The contents of thi=
s e-mail and any attachment(s) are confidential and intended for the named =
recipient(s) only.<br>E-mail transmission is not guaranteed to be secure or=
 error-free as information could be intercepted, corrupted, <br>lost, destr=
oyed, arrive late or incomplete, or may contain viruses in transmission. Th=
e e mail and its contents <br>(with or without referred errors) shall there=
fore not attach any liability on the originator or HCL or its affiliates. <=
br>Views or opinions, if any, presented in this email are solely those of t=
he author and may not necessarily reflect the <br>views or opinions of HCL =
or its affiliates. Any form of reproduction, dissemination, copying, disclo=
sure, modification, <br>distribution and / or publication of this message w=
ithout the prior written consent of authorized representative of <br>HCL is=
 strictly prohibited. If you have received this email in error please delet=
e it and notify the sender immediately. <br>Before opening any email and/or=
 attachments, please check them for viruses and other defects.</font></P>
<P style=3D"MARGIN: 0in 0in 0pt" class=3DMsoNormal><font style=3D"FONT-FAMI=
LY: 'Arial','sans-serif'; COLOR: gray; FONT-SIZE: 11px">-------------------=
---------------------------------------------------------------------------=
------------------------------------------------------</font></span></P></b=
ody>
</html>

--_002_09856974BCEE6F48AB378E52E4CAA73C230FDAAFchnhcltmbs04HCL_
Content-Type: application/octet-stream; name="log.do_configure.10604"
Content-Description: log.do_configure.10604
Content-Disposition: attachment; filename="log.do_configure.10604"; size=5755;
	creation-date="Thu, 30 Jun 2016 04:55:21 GMT";
	modification-date="Thu, 30 Jun 2016 04:55:21 GMT"
Content-Transfer-Encoding: base64

REVCVUc6IEV4ZWN1dGluZyBweXRob24gZnVuY3Rpb24gc3lzcm9vdF9jbGVhbnNzdGF0ZQpERUJV
RzogUHl0aG9uIGZ1bmN0aW9uIHN5c3Jvb3RfY2xlYW5zc3RhdGUgZmluaXNoZWQKREVCVUc6IEV4
ZWN1dGluZyBzaGVsbCBmdW5jdGlvbiBkb19jb25maWd1cmUKRmlyc3QgbGV0J3MgbWFrZSBzdXJl
IHlvdXIga2l0IGlzIGNvbXBsZXRlLiAgQ2hlY2tpbmcuLi4KV291bGQgeW91IGxpa2UgdG8gc2Vl
IHRoZSBpbnN0cnVjdGlvbnM/IFtuXSAgCkxvY2F0aW5nIGNvbW1vbiBwcm9ncmFtcy4uLgpDaGVj
a2luZyBjb21wYXRpYmlsaXR5IGJldHdlZW4gL2Jpbi9lY2hvIGFuZCBidWlsdGluIGVjaG8gKGlm
IGFueSkuLi4KU3ltYm9saWMgbGlua3MgYXJlIHN1cHBvcnRlZC4KQ2hlY2tpbmcgaG93IHRvIHRl
c3QgZm9yIHN5bWJvbGljIGxpbmtzLi4uCllvdSBjYW4gdGVzdCBmb3Igc3ltYm9saWMgbGlua3Mg
d2l0aCAndGVzdCAtaCcuCkNoZWNraW5nIGZvciBjcm9zcy1jb21waWxlCk5vIHRhcmdldGhvc3Qg
Zm9yIHJ1bm5pbmcgY29tcGlsZXIgdGVzdHMgYWdhaW5zdCBkZWZpbmVkLCBydW5uaW5nIGxvY2Fs
bHkKR29vZCwgeW91ciB0ciBzdXBwb3J0cyBbOmxvd2VyOl0gYW5kIFs6dXBwZXI6XSB0byBjb252
ZXJ0IGNhc2UuClVzaW5nIFs6dXBwZXI6XSBhbmQgWzpsb3dlcjpdIHRvIGNvbnZlcnQgY2FzZS4K
YWl4ICAgCSAgICAgIGRyYWdvbmZseSAgICAgICBpcml4XzQgICAJCW5vbnN0b3B1eCAgICAgc3Rl
bGxhciAgIAphaXhfMyAgICAgICAgIGR5bml4ICAgCSAgICAgIGlyaXhfNSAgIAkJb3BlbmJzZCAg
ICAgICBzdW5vc180XzAgICAKYWl4XzQgICAgICAgICBkeW5peHB0eCAgICAgICAgaXJpeF82ICAg
CQlvcHVzICAgICAgICAgIHN1bm9zXzRfMSAgIAphbHRvczQ4NiAgICAgIGVwaXggICAJICAgICAg
aXJpeF82XzAgICAJb3MyICAgCSAgICAgIHN1cGVyLXV4ICAgCmFtaWdhb3MgICAgICAgZXNpeDQg
ICAJICAgICAgaXJpeF82XzEgICAJb3MzOTAgICAgICAgICBzdnI0ICAgCmF0aGVvcyAgICAgICAg
ZnBzICAgCSAgICAgIGlzYyAgIAkJb3M0MDAgICAgICAgICBzdnI1ICAgCmF1eF8zICAgICAgICAg
ZnJlZWJzZCAgICAgICAgIGlzY18yICAgCQlwb3NpeC1iYyAgICAgIHRpMTUwMCAgIApiaXRyaWcg
ICAgICAgIGZyZWVtaW50ICAgICAgICBsaW51eC1hbmRyb2lkICAgCXBvd2VydXggICAgICAgdWx0
cml4XzQgICAKYnNkb3MgICAgICAgICBnZW5peCAgIAkgICAgICBsaW51eCAgIAkJcW54ICAgCSAg
ICAgIHVtaXBzICAgCmNhdGFtb3VudCAgICAgZ251ICAgCSAgICAgIGx5bnhvcyAgIAkJcmlzY29z
ICAgICAgICB1bmljb3MgICAKY29udmV4b3MgICAgICBnbnVrZnJlZWJzZCAgICAgbWlkbmlnaHRi
c2QgICAJc2NvICAgCSAgICAgIHVuaWNvc21rICAgCmN4dXggICAgICAgICAgZ251a25ldGJzZCAg
ICAgIG1pcHMgICAJCXNjb18yXzNfMCAgICAgdW5pc3lzZHluaXggICAKY3lnd2luICAgICAgICBn
cmVlbmhpbGxzICAgICAgbWlyYnNkICAgCQlzY29fMl8zXzEgICAgIHV0ZWt2ICAgCmRhcndpbiAg
ICAgICAgaGFpa3UgICAJICAgICAgbXBjICAgCQlzY29fMl8zXzIgICAgIHV3aW4gICAKZGNvc3gg
ICAgICAgICBocHV4ICAgCSAgICAgIG5jcl90b3dlciAgIAlzY29fMl8zXzMgICAgIHZvcyAgIApk
ZWNfb3NmICAgICAgIGkzODYgICAJICAgICAgbmV0YnNkICAgCQlzY29fMl8zXzQgICAKZG9zX2Rq
Z3BwICAgICBpbnRlcml4ICAgICAgICAgbmV3c29zNCAgIAlzb2xhcmlzXzIgICAKV2hpY2ggb2Yg
dGhlc2UgYXBwbHksIGlmIGFueT8gW2xpbnV4XSAgCgpZb3UgYXBwZWFyIHRvIGhhdmUgRUxGIHN1
cHBvcnQuICBJJ2xsIHRyeSB0byB1c2UgaXQgZm9yIGR5bmFtaWMgbG9hZGluZy4KSWYgZHluYW1p
YyBsb2FkaW5nIGRvZXNuJ3Qgd29yaywgcmVhZCBoaW50cy9saW51eC5zaCBmb3IgZnVydGhlciBp
bmZvcm1hdGlvbi4KT3BlcmF0aW5nIHN5c3RlbSBuYW1lPyBbbGludXhdICAKT3BlcmF0aW5nIHN5
c3RlbSB2ZXJzaW9uPyBbMy4xNi4wLTcwLWdlbmVyaWNdICAKSW5zdGFsbGF0aW9uIHByZWZpeCB0
byB1c2U/ICh+bmFtZSBvaykKWy9ob21lL2t1bWFybi9pbXg2X2J1aWxkL2ZzbC1yZWxlYXNlLWJz
cC9CdWlsZC90bXAvc3lzcm9vdHMveDg2XzY0LWxpbnV4L3Vzcl0gIApBRlMgZG9lcyBub3Qgc2Vl
bSB0byBiZSBydW5uaW5nLi4uCldoYXQgaW5zdGFsbGF0aW9uIHByZWZpeCBzaG91bGQgSSB1c2Ug
Zm9yIGluc3RhbGxpbmcgZmlsZXM/ICh+bmFtZSBvaykKWy9ob21lL2t1bWFybi9pbXg2X2J1aWxk
L2ZzbC1yZWxlYXNlLWJzcC9CdWlsZC90bXAvc3lzcm9vdHMveDg2XzY0LWxpbnV4L3Vzcl0gIApH
ZXR0aW5nIHRoZSBjdXJyZW50IHBhdGNobGV2ZWwuLi4KQnVpbGQgYSB0aHJlYWRpbmcgUGVybD8g
W3ldICAKVXNlIHdoaWNoIEMgY29tcGlsZXI/IFtnY2MgXSAgCkNoZWNraW5nIGZvciBHTlUgY2Mg
aW4gZGlzZ3Vpc2UgYW5kL29yIGl0cyB2ZXJzaW9uIG51bWJlci4uLgpOb3csIGhvdyBjYW4gd2Ug
ZmVlZCBzdGFuZGFyZCBpbnB1dCB0byB5b3VyIEMgcHJlcHJvY2Vzc29yLi4uCkRpcmVjdG9yaWVz
IHRvIHVzZSBmb3IgbGlicmFyeSBzZWFyY2hlcz8KWy91c3IvbG9jYWwvbGliIC91c3IvbGliL2dj
Yy94ODZfNjQtbGludXgtZ251LzQuOC9pbmNsdWRlLWZpeGVkIC91c3IvaW5jbHVkZS94ODZfNjQt
bGludXgtZ251IC91c3IvbGliIC9saWIveDg2XzY0LWxpbnV4LWdudSAvbGliLy4uL2xpYiAvdXNy
L2xpYi94ODZfNjQtbGludXgtZ251IC91c3IvbGliLy4uL2xpYiAvbGliIC9saWI2NF0gIApXaGF0
IGlzIHRoZSBmaWxlIGV4dGVuc2lvbiB1c2VkIGZvciBzaGFyZWQgbGlicmFyaWVzPyBbc29dICAK
TWFrZSBzaGFyZWQgbGlicmFyeSBiYXNlbmFtZXMgdW5pcXVlPyBbbl0gIApCdWlsZCBQZXJsIGZv
ciBTT0NLUz8gW25dICAKVHJ5IHRvIHVzZSBsb25nIGRvdWJsZXMgaWYgYXZhaWxhYmxlPyBbbl0g
IApDaGVja2luZyBmb3Igb3B0aW9uYWwgbGlicmFyaWVzLi4uCldoYXQgbGlicmFyaWVzIHRvIHVz
ZT8gWy1scHRocmVhZCAtbG5zbCAtbGRsIC1sbSAtbGNyeXB0IC1sdXRpbCAtbGMgLWxwb3NpeF0g
IApXaGF0IG9wdGltaXplci9kZWJ1Z2dlciBmbGFnIHNob3VsZCBiZSB1c2VkPyBbLU8yXSAgCkFu
eSBhZGRpdGlvbmFsIGNjIGZsYWdzPwpbLURfUkVFTlRSQU5UIC1EX0dOVV9TT1VSQ0UgLWZ3cmFw
diAtZm5vLXN0cmljdC1hbGlhc2luZyAtcGlwZSAtZnN0YWNrLXByb3RlY3RvciAtSS91c3IvbG9j
YWwvaW5jbHVkZV0gIApMZXQgbWUgZ3Vlc3Mgd2hhdCB0aGUgcHJlcHJvY2Vzc29yIGZsYWdzIGFy
ZS4uLgpBbnkgYWRkaXRpb25hbCBsZCBmbGFncyAoTk9UIGluY2x1ZGluZyBsaWJyYXJpZXMpPwpb
LUwvaG9tZS9rdW1hcm4vaW14Nl9idWlsZC9mc2wtcmVsZWFzZS1ic3AvQnVpbGQvdG1wL3N5c3Jv
b3RzL3g4Nl82NC1saW51eC91c3IvbGliIC1ML2hvbWUva3VtYXJuL2lteDZfYnVpbGQvZnNsLXJl
bGVhc2UtYnNwL0J1aWxkL3RtcC9zeXNyb290cy94ODZfNjQtbGludXgvbGliIC1XbCwtcnBhdGgt
bGluaywvaG9tZS9rdW1hcm4vaW14Nl9idWlsZC9mc2wtcmVsZWFzZS1ic3AvQnVpbGQvdG1wL3N5
c3Jvb3RzL3g4Nl82NC1saW51eC91c3IvbGliIC1XbCwtcnBhdGgtbGluaywvaG9tZS9rdW1hcm4v
aW14Nl9idWlsZC9mc2wtcmVsZWFzZS1ic3AvQnVpbGQvdG1wL3N5c3Jvb3RzL3g4Nl82NC1saW51
eC9saWIgLVdsLC1ycGF0aCwvaG9tZS9rdW1hcm4vaW14Nl9idWlsZC9mc2wtcmVsZWFzZS1ic3Av
QnVpbGQvdG1wL3N5c3Jvb3RzL3g4Nl82NC1saW51eC91c3IvbGliIC1XbCwtcnBhdGgsL2hvbWUv
a3VtYXJuL2lteDZfYnVpbGQvZnNsLXJlbGVhc2UtYnNwL0J1aWxkL3RtcC9zeXNyb290cy94ODZf
NjQtbGludXgvbGliIC1XbCwtTzEgLWZzdGFjay1wcm90ZWN0b3IgLUwvdXNyL2xvY2FsL2xpYl0g
IApDaGVja2luZyB5b3VyIGNob2ljZSBvZiBDIGNvbXBpbGVyIGFuZCBmbGFncyBmb3IgY29oZXJl
bmN5Li4uCkkndmUgdHJpZWQgdG8gY29tcGlsZSBhbmQgcnVuIHRoZSBmb2xsb3dpbmcgc2ltcGxl
IHByb2dyYW06CgojaW5jbHVkZSA8c3RkaW8uaD4KaW50IG1haW4oKSB7IHByaW50ZigiT2tcbiIp
OyByZXR1cm4oMCk7IH0KCkkgdXNlZCB0aGUgY29tbWFuZDoKCglnY2MgLW8gdHJ5IC1PMiAtRF9S
RUVOVFJBTlQgLURfR05VX1NPVVJDRSAtZndyYXB2IC1mbm8tc3RyaWN0LWFsaWFzaW5nIC1waXBl
IC1mc3RhY2stcHJvdGVjdG9yIC1JL3Vzci9sb2NhbC9pbmNsdWRlIC1ML2hvbWUva3VtYXJuL2lt
eDZfYnVpbGQvZnNsLXJlbGVhc2UtYnNwL0J1aWxkL3RtcC9zeXNyb290cy94ODZfNjQtbGludXgv
dXNyL2xpYiAtTC9ob21lL2t1bWFybi9pbXg2X2J1aWxkL2ZzbC1yZWxlYXNlLWJzcC9CdWlsZC90
bXAvc3lzcm9vdHMveDg2XzY0LWxpbnV4L2xpYiAtV2wsLXJwYXRoLWxpbmssL2hvbWUva3VtYXJu
L2lteDZfYnVpbGQvZnNsLXJlbGVhc2UtYnNwL0J1aWxkL3RtcC9zeXNyb290cy94ODZfNjQtbGlu
dXgvdXNyL2xpYiAtV2wsLXJwYXRoLWxpbmssL2hvbWUva3VtYXJuL2lteDZfYnVpbGQvZnNsLXJl
bGVhc2UtYnNwL0J1aWxkL3RtcC9zeXNyb290cy94ODZfNjQtbGludXgvbGliIC1XbCwtcnBhdGgs
L2hvbWUva3VtYXJuL2lteDZfYnVpbGQvZnNsLXJlbGVhc2UtYnNwL0J1aWxkL3RtcC9zeXNyb290
cy94ODZfNjQtbGludXgvdXNyL2xpYiAtV2wsLXJwYXRoLC9ob21lL2t1bWFybi9pbXg2X2J1aWxk
L2ZzbC1yZWxlYXNlLWJzcC9CdWlsZC90bXAvc3lzcm9vdHMveDg2XzY0LWxpbnV4L2xpYiAtV2ws
LU8xIC1mc3RhY2stcHJvdGVjdG9yIC1ML3Vzci9sb2NhbC9saWIgdHJ5LmMgLWxwdGhyZWFkIC1s
bnNsIC1sZGwgLWxtIC1sY3J5cHQgLWx1dGlsIC1sYyAtbHBvc2l4CgkgLi90cnkKCmFuZCBJIGdv
dCB0aGUgZm9sbG93aW5nIG91dHB1dDoKCi91c3IvYmluL2xkOiBza2lwcGluZyBpbmNvbXBhdGli
bGUgL3Vzci9saWIvZ2NjL3g4Nl82NC1saW51eC1nbnUvNC44Ly4uLy4uLy4uLy4uL2xpYi9saWJw
b3NpeC5zbyB3aGVuIHNlYXJjaGluZyBmb3IgLWxwb3NpeAovdXNyL2Jpbi9sZDogc2tpcHBpbmcg
aW5jb21wYXRpYmxlIC91c3IvbGliLy4uL2xpYi9saWJwb3NpeC5zbyB3aGVuIHNlYXJjaGluZyBm
b3IgLWxwb3NpeAovdXNyL2Jpbi9sZDogc2tpcHBpbmcgaW5jb21wYXRpYmxlIC91c3IvbGliL2dj
Yy94ODZfNjQtbGludXgtZ251LzQuOC8uLi8uLi8uLi9saWJwb3NpeC5zbyB3aGVuIHNlYXJjaGlu
ZyBmb3IgLWxwb3NpeAovdXNyL2Jpbi9sZDogc2tpcHBpbmcgaW5jb21wYXRpYmxlIC8vdXNyL2xp
Yi9saWJwb3NpeC5zbyB3aGVuIHNlYXJjaGluZyBmb3IgLWxwb3NpeAovdXNyL2Jpbi9sZDogY2Fu
bm90IGZpbmQgLWxwb3NpeApjb2xsZWN0MjogZXJyb3I6IGxkIHJldHVybmVkIDEgZXhpdCBzdGF0
dXMKSSBjYW4ndCBjb21waWxlIHRoZSB0ZXN0IHByb2dyYW0uCllvdSBoYXZlIGEgQklHIHByb2Js
ZW0uICBTaGFsbCBJIGFib3J0IENvbmZpZ3VyZSBbeV0gIApPay4gIFN0b3BwaW5nIENvbmZpZ3Vy
ZS4KV0FSTklORzogZXhpdCBjb2RlIDEgZnJvbSBhIHNoZWxsIGNvbW1hbmQuCkVSUk9SOiBGdW5j
dGlvbiBmYWlsZWQ6IGRvX2NvbmZpZ3VyZSAobG9nIGZpbGUgaXMgbG9jYXRlZCBhdCAvaG9tZS9r
dW1hcm4vaW14Nl9idWlsZC9mc2wtcmVsZWFzZS1ic3AvQnVpbGQvdG1wL3dvcmsveDg2XzY0LWxp
bnV4L3BlcmwtbmF0aXZlLzUuMjIuMC1yMC90ZW1wL2xvZy5kb19jb25maWd1cmUuMTA2MDQpCg==

--_002_09856974BCEE6F48AB378E52E4CAA73C230FDAAFchnhcltmbs04HCL_--
