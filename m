Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 15E4E7866D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 01:26:05 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208,217";a="30150373"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 14 Nov 2017 09:26:05 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 7D21441860D4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 09:26:03 +0800 (CST)
Received: from G08CNEXMBPEKD01.g08.fujitsu.local ([10.167.33.81]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0361.001; Tue, 14 Nov 2017 09:26:05 +0800
From: "Zheng, Ruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: do_fetch problem of linux-yocto
Thread-Index: AdNc54bUG0gfh84nS0OHhbVUEWT9fg==
Date: Tue, 14 Nov 2017 01:26:04 +0000
Message-ID: <33D4DBCAC5F2D74E96B07F6E7632BF732EEA18C6@G08CNEXMBPEKD01.g08.fujitsu.local>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.225.116]
MIME-Version: 1.0
X-yoursite-MailScanner-ID: 7D21441860D4.A3642
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Subject: do_fetch problem of linux-yocto
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
X-List-Received-Date: Tue, 14 Nov 2017 01:26:06 -0000
Content-Language: zh-CN
Content-Type: multipart/alternative;
	boundary="_000_33D4DBCAC5F2D74E96B07F6E7632BF732EEA18C6G08CNEXMBPEKD01_"

--_000_33D4DBCAC5F2D74E96B07F6E7632BF732EEA18C6G08CNEXMBPEKD01_
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGkgQWxso7oNCiAgIFdoZW4gSSBiaXRiYWtlIGxpbnV4LXlvY3Rvo6xpdCBj
YW6hr3QgZmV0Y2ggdGhlIGdpdC1yZXBvLiBCdXQgYWN0dWFsbHksIHRoZSBn
aXQtcmVwbyBoYXMgYmVlbiBmZXRjaGVkLg0KRVJST1I6IGxpbnV4LXlvY3Rv
LTQuMTIuMTQrZ2l0QVVUT0lOQytjZWJlMTk4ODcwXzljYzZiMGFlMWEtcjAg
ZG9fZmV0Y2g6IEZldGNoZXIgZmFpbHVyZSBmb3IgVVJMOiAnZ2l0Oi8vZ2l0
LnlvY3RvcHJvamVjdC5vcmcvbGludXgteW9jdG8tNC4xMi5naXQ7bmFtZT1t
YWNoaW5lO2JyYW5jaD1zdGFuZGFyZC9iYXNlOycuIFVuYWJsZSB0byBmZXRj
aCBVUkwgZnJvbSBhbnkgc291cmNlLg0KRVJST1I6IGxpbnV4LXlvY3RvLTQu
MTIuMTQrZ2l0QVVUT0lOQytjZWJlMTk4ODcwXzljYzZiMGFlMWEtcjAgZG9f
ZmV0Y2g6IEZ1bmN0aW9uIGZhaWxlZDogYmFzZV9kb19mZXRjaA0KRVJST1I6
IExvZ2ZpbGUgb2YgZmFpbHVyZSBzdG9yZWQgaW46IC95b2N0by93b3JrMDAx
L2Zuc3QvenJxL2NvbW11bml0eS9idWlsZF9tYXN0ZXIvdG1wL3dvcmsvcWVt
dXg4Ni1wb2t5LWxpbnV4L2xpbnV4LXlvY3RvLzQuMTIuMTQrZ2l0QVVUT0lO
QytjZWJlMTk4ODcwXzljYzZiMGFlMWEtcjAvdGVtcC9sb2cuZG9fZmV0Y2gu
MjQ1MDgNCkVSUk9SOiBUYXNrICgveW9jdG8vd29yazAwMS9mbnN0L3pycS9j
b21tdW5pdHkveW9jdG8vcG9reS9tZXRhL3JlY2lwZXMta2VybmVsL2xpbnV4
L2xpbnV4LXlvY3RvXzQuMTIuYmI6ZG9fZmV0Y2gpIGZhaWxlZCB3aXRoIGV4
aXQgY29kZSAnMScNCg0KICAgJGxzIGRvd25sb2Fkcy9naXQyL2dpdC55b2N0
b3Byb2plY3Qub3JnLmdpdC55b2N0by1rZXJuZWwtdG9vbHMuZ2l0Lw0KYnJh
bmNoZXMgIGNvbmZpZyAgZGVzY3JpcHRpb24gIEhFQUQgIGhvb2tzICBpbmZv
ICBvYmplY3RzICBwYWNrZWQtcmVmcyAgcmVmcw0KDQpBbmQgd2hlbiBJIHJl
IGJpdGJha2UgdGhlIHRhc2ssIGRvX2ZldGNoIHdpbGwgYmUgZG9uZSBhZ2Fp
bi4gZG9lcyBhbnlvbmUga25vd3MgdGhlIHJlYXNvbj8NCg0KYml0YmFrZSBs
aW51eC15b2N0bw0KICAgMjogbGludXgteW9jdG8tNC4xMi4xNCtnaXRBVVRP
SU5DK2NlYmUxOTg4NzBfOWNjNmIwYWUxYS1yMCBkb19mZXRjaCAocGlkIDI4
ODY0KSAgIDAlIHwgICAgICB8IDkyLjVLL3MNCg0KDQoNCg0KLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0K
WmhlbmcgUnVvcWluDQpOYW5qaW5nIEZ1aml0c3UgTmFuZGEgU29mdHdhcmUg
VGVjaC4gQ28uLCBMdGQuKEZOU1QpDQpBRERSLjogTm8uNiBXZW56aHUgUm9h
ZCwgU29mdHdhcmUgQXZlbnVlLA0KICAgICAgIE5hbmppbmcsIDIxMDAxMiwg
Q2hpbmENCk1BSUwgOiB6aGVuZ3JxLmZuc3RAY24uZnVqaXN0dS5jb20NCg0K
Cgo=

--_000_33D4DBCAC5F2D74E96B07F6E7632BF732EEA18C6G08CNEXMBPEKD01_
Content-Type: text/html; charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" xmlns:m=3D"http://schema=
s.microsoft.com/office/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html=
40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dgb2312">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:=CB=CE=CC=E5;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@=CB=CE=CC=E5";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	text-align:justify;
	text-justify:inter-ideograph;
	font-size:10.5pt;
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
/* Page Definitions */
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 90.0pt 72.0pt 90.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"ZH-CN" link=3D"#0563C1" vlink=3D"#954F72" style=3D"text-justi=
fy-trim:punctuation">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi All</span><span style=3D"fon=
t-family:=CB=CE=CC=E5">=A3=BA</span><span lang=3D"EN-US"><o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp; When I bitbake lin=
ux-yocto</span><span style=3D"font-family:=CB=CE=CC=E5">=A3=AC</span><span =
lang=3D"EN-US">it can=A1=AFt fetch the git-repo. But actually, the git-repo=
 has been fetched.
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:21.0pt;mso-para-margin-left:2.0=
gd"><span lang=3D"EN-US">ERROR: linux-yocto-4.12.14&#43;gitAUTOINC&#43;cebe=
198870_9cc6b0ae1a-r0 do_fetch: Fetcher failure for URL: 'git://git.yoctopro=
ject.org/linux-yocto-4.12.git;name=3Dmachine;branch=3Dstandard/base;'.
 Unable to fetch URL from any source.<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:21.0pt;mso-para-margin-left:2.0=
gd"><span lang=3D"EN-US">ERROR: linux-yocto-4.12.14&#43;gitAUTOINC&#43;cebe=
198870_9cc6b0ae1a-r0 do_fetch: Function failed: base_do_fetch<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal" style=3D"margin-left:21.0pt;mso-para-margin-left:2.0=
gd"><span lang=3D"EN-US">ERROR: Logfile of failure stored in: /yocto/work00=
1/fnst/zrq/community/build_master/tmp/work/qemux86-poky-linux/linux-yocto/4=
.12.14&#43;gitAUTOINC&#43;cebe198870_9cc6b0ae1a-r0/temp/log.do_fetch.24508<=
o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-left:21.0pt;mso-para-margin-left:2.0=
gd"><span lang=3D"EN-US">ERROR: Task (/yocto/work001/fnst/zrq/community/yoc=
to/poky/meta/recipes-kernel/linux/linux-yocto_4.12.bb:do_fetch) failed with=
 exit code '1'<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:21.0pt"><span lang=3D"EN-US">&n=
bsp;&nbsp; $ls downloads/git2/git.yoctoproject.org.git.yocto-kernel-tools.g=
it/<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:26.25pt"><span lang=3D"EN-US">b=
ranches&nbsp; config&nbsp; description&nbsp; HEAD&nbsp; hooks&nbsp; info&nb=
sp; objects&nbsp; packed-refs&nbsp; refs<o:p></o:p></span></p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></b>=
</p>
<p class=3D"MsoNormal" style=3D"text-indent:15.75pt"><span lang=3D"EN-US">A=
nd when I re bitbake the task, do_fetch will be done again. does anyone kno=
ws the reason?<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:15.75pt"><span lang=3D"EN-US"><=
o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-indent:15.75pt"><span lang=3D"EN-US">b=
itbake linux-yocto<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&nbsp;&nbsp; 2: linux-yocto-4.1=
2.14&#43;gitAUTOINC&#43;cebe198870_9cc6b0ae1a-r0 do_fetch (pid 28864)&nbsp;=
&nbsp; 0% |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 92.5K/s<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US">----------------------------------------------------<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US">Zheng Ruoqin<o:p></o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US">Nanjing Fujitsu Nanda Software Tech. Co., Ltd.(FNST)<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US">ADDR.: No.6 Wenzhu Road, Software Avenue,<o:p></o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Nanjing, 210012, China<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal" align=3D"left" style=3D"text-align:left"><span lang=
=3D"EN-US">MAIL : zhengrq.fnst@cn.fujistu.com<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_33D4DBCAC5F2D74E96B07F6E7632BF732EEA18C6G08CNEXMBPEKD01_--
