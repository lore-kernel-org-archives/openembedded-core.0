Return-Path: <andyblac@icloud.com>
Received: from st11p00mm-asmtp004.mac.com (unknown [17.172.81.3])
	by mail.openembedded.org (Postfix) with ESMTP id 6C97F601A0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 May 2014 10:05:55 +0000 (UTC)
MIME-version: 1.0
Received: from macmuppets.DiskStation.me
	(host86-167-70-74.range86-167.btcentralplus.com [86.167.70.74])
	by st11p00mm-asmtp004.mac.com
	(Oracle Communications Messaging Server 7u4-27.08(7.0.4.27.7) 64bit
	(built Aug
	22 2013)) with ESMTPSA id <0N5G00JT8HDUMF30@st11p00mm-asmtp004.mac.com>
	for openembedded-core@lists.openembedded.org;
	Mon, 12 May 2014 10:05:56 +0000 (GMT)
Received: from [192.168.1.31]
	(host86-167-70-74.range86-167.btcentralplus.com [86.167.70.74])
	(Authenticated sender: andyblac)	by macmuppets.DiskStation.me (Postfix)
	with ESMTPSA id CAD5DB31117	for
	<openembedded-core@lists.openembedded.org>; 
	Mon, 12 May 2014 11:05:46 +0100 (IST)
From: Andrew Blackburn <andyblac@icloud.com>
Message-id: <D6AFE305-EC4A-46FD-AF51-9714F2AE1FDE@icloud.com>
Date: Mon, 12 May 2014 11:05:43 +0100
References: <874B01E8-8A61-442E-981C-3FCE0763854E@icloud.com>
	<CAMKF1so70jmiMNdfT_sBvnfHRd5zQNS-6LL3JufMs5H__+765A@mail.gmail.com>
	<1E758580-2234-4832-B3F7-2848343DFA89@icloud.com>
	<CAMKF1srUPfNFCVNVunUTbyzx1B3te3WVnCsUkTncgrc-p3Fh7w@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
In-reply-to: <CAMKF1srUPfNFCVNVunUTbyzx1B3te3WVnCsUkTncgrc-p3Fh7w@mail.gmail.com>
X-Mailer: Apple Mail (2.1874)
X-Spam-Status: No
X-MANTSH: 1TEIXWV4bG1oaGkdHB0lGUkdDRl5PWBoaGREKTEMXGx0EGx0YBBIZBBsTEBseGh8
	aEQpYTRdLEQptfhcaEQpMWRcbGhsbEQpZSRcRClleF2hjZhEKQ04XSxseGmJCH2lvHXV4GXhzB
	x5pGxoaH14fEQpYXBcZBBoEGxsHTU4fGBgYGUsFGx0EGx0YBBIZBBsTEBseGh8bEQpeWRdhWkF
	tTxEKTEYXbGtrEQpDWhcSHAQbHB0EHRoEHR4RCkJeFxsRCkJGF2BicmtBYG1bcntfEQpCRRdtQ
	WBPQ01wYRp+YREKQk4Xa0UaUlAeQ1xZXGgRCkJMF2UcekZwQENgeRMSEQpCbBdrUxx/GB1Hblh
	sUBEKQkAXYU9hR29tQEhrH0wRCkJYF2hDeGceQXpgXBtSEQpwZxdmXUtIbkdDHUF/bREKcGgXZ
	B1tEkIFe2VhYwERCnBoF2Ecb2BfEkZNHl4TEQpwaBdgZRx/bWVEe1BkTBEKcGgXYGNYRW1wcEl
	IGmcRCnBoF2hzEhlueG9yS0sBEQpwfxdoWgFrE31MTlx+cBEKcF8Xel5fb0B9bGhcUAURCnBfF
	2xLZ19ESUlOTGxbEQpwZxdhQV1nTm4aRx8baREKcH8XZUxeeEN4fUBHYAERCnBfF2ZsX1sbfG5
	tYVxpEQpwfxdvchIBTXpJXGZPWxEKcH8XbUVQHWNBYhxGGhgRCnBsF2BYSF5oc0x6f28YEQ==
X-CLX-Spam: false
X-CLX-Score: 1011
X-Proofpoint-Virus-Version: vendor=fsecure
	engine=2.50.10432:5.11.96,1.0.14,0.0.0000
	definitions=2014-05-11_03:2014-05-09, 2014-05-11,
	1970-01-01 signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
	suspectscore=48 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0
	reason=mlx scancount=1 engine=7.0.1-1402240000
	definitions=main-1405120137
X-MailScanner-ID: CAD5DB31117.ACCEE
X-MailScanner: Found to be clean
X-MailScanner-From: andyblac@icloud.com
Subject: Re: talloc build error
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
X-List-Received-Date: Mon, 12 May 2014 10:05:59 -0000
Content-type: multipart/alternative;
	boundary="Boundary_(ID_F2WjKIUBBITrvQihhjznNA)"

--Boundary_(ID_F2WjKIUBBITrvQihhjznNA)
Content-type: text/plain; charset=windows-1252
Content-transfer-encoding: quoted-printable

hi,=20

sure, here you go.

andy.

diff --git a/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb =
b/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
index 501e40a..7e3581b 100644
--- a/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
+++ b/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb
@@ -3,11 +3,11 @@ SECTION =3D "base"
 LICENSE =3D "GPL-2.0"
 LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D0636e73ff0215e8d672dc4c32c317bb3"
=20
-PR =3D "r6"
+PR =3D "r7"
=20
 DEPENDS +=3D "libtirpc flex-native bison-native"
=20
-inherit autotools systemd
+inherit autotools-brokensep systemd
=20
 SRC_URI =3D =
"${KERNELORG_MIRROR}/linux/daemons/autofs/v5/autofs-${PV}.tar.bz2 \
            file://autofs-5.0.7-fix-nobind-sun-escaped-map-entries.patch =
\
diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb =
b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
index 00df2b8..55e3092 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
@@ -4,6 +4,8 @@ SUMMARY =3D "WvStreams is a network programming library =
in C++"
 LICENSE =3D "LGPLv2"
 LIC_FILES_CHKSUM =3D =
"file://LICENSE;md5=3D55ca817ccb7d5b5b66355690e9abc605"
=20
+PR =3D "r1"
+
 DEPENDS =3D "zlib openssl (>=3D 0.9.8)"
=20
 SRC_URI =3D "http://${PN}.googlecode.com/files/${PN}-${PV}.tar.gz \
@@ -16,7 +18,7 @@ SRC_URI =3D =
"http://${PN}.googlecode.com/files/${PN}-${PV}.tar.gz \
 SRC_URI[md5sum] =3D "2760dac31a43d452a19a3147bfde571c"
 SRC_URI[sha256sum] =3D =
"8403f5fbf83aa9ac0c6ce15d97fd85607488152aa84e007b7d0621b8ebc07633"
=20
-inherit autotools pkgconfig
+inherit autotools-brokensep pkgconfig
=20
 PARALLEL_MAKE =3D ""
=20
diff --git a/meta-oe/recipes-support/talloc/talloc_2.0.1.bb =
b/meta-oe/recipes-support/talloc/talloc_2.0.1.bb
index 6b7e4f1..b6bf2cd 100644
--- a/meta-oe/recipes-support/talloc/talloc_2.0.1.bb
+++ b/meta-oe/recipes-support/talloc/talloc_2.0.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE =3D "http://talloc.samba.org"
 LICENSE =3D "LGPL-3.0"
 LIC_FILES_CHKSUM =3D "file://NEWS;md5=3D5fe776b23a711c9153ee94bc87e47334"=

=20
-inherit autotools pkgconfig
+inherit autotools-brokensep pkgconfig
=20
 SRC_URI =3D "http://samba.org/ftp/${BPN}/${BPN}-${PV}.tar.gz \
            file://install-swig-interface-in-SWINGLIBDIR.patch \
@@ -13,7 +13,7 @@ SRC_URI[sha256sum] =3D =
"5b810527405f29d54f50efd78bf2c89e318f2cd8bed001f22f2a1412fd
=20
 TARGET_CC_ARCH +=3D "${LDFLAGS}"
=20
-PR =3D "r2"
+PR =3D "r3"
=20
 # autoreconf doesn't work well while reconfiguring included libreplace
 do_configure () {


On 12 May 2014, at 06:03, Khem Raj <raj.khem@gmail.com> wrote:

>=20
>=20
> On Sunday, May 11, 2014, Andrew Blackburn <andyblac@icloud.com> wrote:
> cheers guy=92s
>=20
> thats worked using autotools-brokensep instead of autotools, =
=91wvstreams_4.6.1.bb=92 also needed this too.
>=20
>=20
> Care to submit patch ?
> =20
> best regards
>=20
> andy.
>=20
> On 11 May 2014, at 23:46, Khem Raj <raj.khem@gmail.com> wrote:
>=20
> > On Sun, May 11, 2014 at 9:29 AM, Andrew Blackburn =
<andyblac@icloud.com> wrote:
> >> hi all,
> >>
> >> i recently merged =91meta-openembedded=92 master into my branch, =
but i am now getting a build error with tallow, below is the erro i am =
getting, can anyone help on how to fix.
> >
> > It could be that S !=3D B change might be impacting this recipe. Can =
you
> > change the recipe to inherit autotools-brokensep instead of =
autotools
> > class.
> >
> >>
> >>
> >> NOTE: Preparing runqueue
> >> NOTE: Executing SetScene Tasks
> >> NOTE: Executing RunQueue Tasks
> >> ERROR: Function failed: do_configure (log file is located at =
/home/vix/oe-alliance/builds/openvix/tmp/work/mips32el-oe-linux/talloc/tal=
loc-2.0.1-r2/temp/log.do_configure.9168)
> >> ERROR: Logfile of failure stored in: =
/home/vix/oe-alliance/builds/openvix/tmp/work/mips32el-oe-linux/talloc/tal=
loc-2.0.1-r2/temp/log.do_configure.9168
> >> Log data follows:
> >> | DEBUG: Executing python function sysroot_cleansstate
> >> | DEBUG: Python function sysroot_cleansstate finished
> >> | DEBUG: SITE files ['endian-little', 'bit-32', 'mips-common', =
'common-linux', 'common-glibc', 'mipsel-linux', 'common']
> >> | DEBUG: Executing shell function autotools_preconfigure
> >> | DEBUG: Shell function autotools_preconfigure finished
> >> | DEBUG: Executing python function autotools_copy_aclocals
> >> | DEBUG: Python function autotools_copy_aclocals finished
> >> | DEBUG: Executing shell function do_configure
> >> | gnu-configize: 'configure.ac' or 'configure.in' is required
> >> | WARNING: =
/home/vix/oe-alliance/builds/openvix/tmp/work/mips32el-oe-linux/talloc/tal=
loc-2.0.1-r2/temp/run.do_configure.9168:1 exit 1 from
> >> |   gnu-configize
> >> | ERROR: Function failed: do_configure (log file is located at =
/home/vix/oe-alliance/builds/openvix/tmp/work/mips32el-oe-linux/talloc/tal=
loc-2.0.1-r2/temp/log.do_configure.9168)
> >> ERROR: Task 4967 =
(/home/vix/oe-alliance/meta-openembedded/meta-oe/recipes-support/talloc/ta=
lloc_2.0.1.bb, do_configure) failed with exit code =911'
> >>
> >>
> >>
> >> hope someone can help
> >>
> >>
> >> cheers
> >> Andy.
> >> --
> >> _______________________________________________
> >> Openembedded-core mailing list
> >> Openembedded-core@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Boundary_(ID_F2WjKIUBBITrvQihhjznNA)
Content-type: text/html; charset=windows-1252
Content-transfer-encoding: quoted-printable

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dwindows-1252"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: =
after-white-space;">hi,&nbsp;<div><br></div><div>sure, here you =
go.</div><div><br></div><div>andy.</div><div><br></div><div><div>diff =
--git a/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb =
b/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb</div><div>index =
501e40a..7e3581b 100644</div><div>--- =
a/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb</div><div>+++ =
b/meta-networking/recipes-daemons/autofs/autofs_5.0.7.bb</div><div>@@ =
-3,11 +3,11 @@ SECTION =3D "base"</div><div>&nbsp;LICENSE =3D =
"GPL-2.0"</div><div>&nbsp;LIC_FILES_CHKSUM =3D "<a =
href=3D"file:///COPYING;md5=3D0636e73ff0215e8d672dc4c32c317bb3">file://COP=
YING;md5=3D0636e73ff0215e8d672dc4c32c317bb3</a>"</div><div>&nbsp;</div><di=
v>-PR =3D "r6"</div><div>+PR =3D =
"r7"</div><div>&nbsp;</div><div>&nbsp;DEPENDS +=3D "libtirpc flex-native =
bison-native"</div><div>&nbsp;</div><div>-inherit autotools =
systemd</div><div>+inherit autotools-brokensep =
systemd</div><div>&nbsp;</div><div>&nbsp;SRC_URI =3D =
"${KERNELORG_MIRROR}/linux/daemons/autofs/v5/autofs-${PV}.tar.bz2 =
\</div><div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <a =
href=3D"file:///autofs-5.0.7-fix-nobind-sun-escaped-map-entries.patch">fil=
e://autofs-5.0.7-fix-nobind-sun-escaped-map-entries.patch</a> =
\</div><div>diff --git =
a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb =
b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb</div><div>index =
00df2b8..55e3092 100644</div><div>--- =
a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb</div><div>+++ =
b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb</div><div>@@ =
-4,6 +4,8 @@ SUMMARY =3D "WvStreams is a network programming library in =
C++"</div><div>&nbsp;LICENSE =3D =
"LGPLv2"</div><div>&nbsp;LIC_FILES_CHKSUM =3D "<a =
href=3D"file:///LICENSE;md5=3D55ca817ccb7d5b5b66355690e9abc605">file://LIC=
ENSE;md5=3D55ca817ccb7d5b5b66355690e9abc605</a>"</div><div>&nbsp;</div><di=
v>+PR =3D "r1"</div><div>+</div><div>&nbsp;DEPENDS =3D "zlib openssl =
(&gt;=3D 0.9.8)"</div><div>&nbsp;</div><div>&nbsp;SRC_URI =3D "<a =
href=3D"http://${PN}.googlecode.com/files/${PN}-${PV}.tar.gz">http://${PN}=
.googlecode.com/files/${PN}-${PV}.tar.gz</a> \</div><div>@@ -16,7 +18,7 =
@@ SRC_URI =3D "<a =
href=3D"http://${PN}.googlecode.com/files/${PN}-${PV}.tar.gz">http://${PN}=
.googlecode.com/files/${PN}-${PV}.tar.gz</a> =
\</div><div>&nbsp;SRC_URI[md5sum] =3D =
"2760dac31a43d452a19a3147bfde571c"</div><div>&nbsp;SRC_URI[sha256sum] =3D =
"8403f5fbf83aa9ac0c6ce15d97fd85607488152aa84e007b7d0621b8ebc07633"</div><d=
iv>&nbsp;</div><div>-inherit autotools pkgconfig</div><div>+inherit =
autotools-brokensep =
pkgconfig</div><div>&nbsp;</div><div>&nbsp;PARALLEL_MAKE =3D =
""</div><div>&nbsp;</div><div>diff --git =
a/meta-oe/recipes-support/talloc/talloc_2.0.1.bb =
b/meta-oe/recipes-support/talloc/talloc_2.0.1.bb</div><div>index =
6b7e4f1..b6bf2cd 100644</div><div>--- =
a/meta-oe/recipes-support/talloc/talloc_2.0.1.bb</div><div>+++ =
b/meta-oe/recipes-support/talloc/talloc_2.0.1.bb</div><div>@@ -3,7 +3,7 =
@@ HOMEPAGE =3D "<a =
href=3D"http://talloc.samba.org">http://talloc.samba.org</a>"</div><div>&n=
bsp;LICENSE =3D "LGPL-3.0"</div><div>&nbsp;LIC_FILES_CHKSUM =3D "<a =
href=3D"file:///NEWS;md5=3D5fe776b23a711c9153ee94bc87e47334">file://NEWS;m=
d5=3D5fe776b23a711c9153ee94bc87e47334</a>"</div><div>&nbsp;</div><div>-inh=
erit autotools pkgconfig</div><div>+inherit autotools-brokensep =
pkgconfig</div><div>&nbsp;</div><div>&nbsp;SRC_URI =3D "<a =
href=3D"http://samba.org/ftp/${BPN}/${BPN}-${PV}.tar.gz">http://samba.org/=
ftp/${BPN}/${BPN}-${PV}.tar.gz</a> \</div><div>&nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; <a =
href=3D"file:///install-swig-interface-in-SWINGLIBDIR.patch">file://instal=
l-swig-interface-in-SWINGLIBDIR.patch</a> \</div><div>@@ -13,7 +13,7 @@ =
SRC_URI[sha256sum] =3D =
"5b810527405f29d54f50efd78bf2c89e318f2cd8bed001f22f2a1412fd</div><div>&nbs=
p;</div><div>&nbsp;TARGET_CC_ARCH +=3D =
"${LDFLAGS}"</div><div>&nbsp;</div><div>-PR =3D "r2"</div><div>+PR =3D =
"r3"</div><div>&nbsp;</div><div>&nbsp;# autoreconf doesn't work well =
while reconfiguring included libreplace</div><div>&nbsp;do_configure () =
{</div><div><br></div><div><br></div><div><div>On 12 May 2014, at 06:03, =
Khem Raj &lt;<a =
href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; =
wrote:</div><br class=3D"Apple-interchange-newline"><blockquote =
type=3D"cite"><div style=3D"font-family: Helvetica; font-size: 13px; =
font-style: normal; font-variant: normal; font-weight: normal; =
letter-spacing: normal; line-height: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-stroke-width: =
0px;"><br><br>On Sunday, May 11, 2014, Andrew Blackburn &lt;<a =
href=3D"mailto:andyblac@icloud.com">andyblac@icloud.com</a>&gt; =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin: 0px 0px 0px =
0.8ex; border-left-width: 1px; border-left-color: rgb(204, 204, 204); =
border-left-style: solid; padding-left: 1ex; position: static; z-index: =
auto;">cheers guy=92s<br><br>thats worked using autotools-brokensep =
instead of autotools, =91<a href=3D"http://wvstreams_4.6.1.bb/" =
target=3D"_blank">wvstreams_4.6.1.bb</a>=92 also needed this =
too.<br><br></blockquote><div><br></div><div>Care to submit patch =
?</div><div>&nbsp;</div><blockquote class=3D"gmail_quote" style=3D"margin:=
 0px 0px 0px 0.8ex; border-left-width: 1px; border-left-color: rgb(204, =
204, 204); border-left-style: solid; padding-left: 1ex;">best =
regards<br><br>andy.<br><br>On 11 May 2014, at 23:46, Khem Raj =
&lt;<a>raj.khem@gmail.com</a>&gt; wrote:<br><br>&gt; On Sun, May 11, =
2014 at 9:29 AM, Andrew Blackburn &lt;<a>andyblac@icloud.com</a>&gt; =
wrote:<br>&gt;&gt; hi all,<br>&gt;&gt;<br>&gt;&gt; i recently merged =
=91meta-openembedded=92 master into my branch, but i am now getting a =
build error with tallow, below is the erro i am getting, can anyone help =
on how to fix.<br>&gt;<br>&gt; It could be that S !=3D B change might be =
impacting this recipe. Can you<br>&gt; change the recipe to inherit =
autotools-brokensep instead of autotools<br>&gt; =
class.<br>&gt;<br>&gt;&gt;<br>&gt;&gt;<br>&gt;&gt; NOTE: Preparing =
runqueue<br>&gt;&gt; NOTE: Executing SetScene Tasks<br>&gt;&gt; NOTE: =
Executing RunQueue Tasks<br>&gt;&gt; ERROR: Function failed: =
do_configure (log file is located at =
/home/vix/oe-alliance/builds/openvix/tmp/work/mips32el-oe-linux/talloc/tal=
loc-2.0.1-r2/temp/log.do_configure.9168)<br>&gt;&gt; ERROR: Logfile of =
failure stored in: =
/home/vix/oe-alliance/builds/openvix/tmp/work/mips32el-oe-linux/talloc/tal=
loc-2.0.1-r2/temp/log.do_configure.9168<br>&gt;&gt; Log data =
follows:<br>&gt;&gt; | DEBUG: Executing python function =
sysroot_cleansstate<br>&gt;&gt; | DEBUG: Python function =
sysroot_cleansstate finished<br>&gt;&gt; | DEBUG: SITE files =
['endian-little', 'bit-32', 'mips-common', 'common-linux', =
'common-glibc', 'mipsel-linux', 'common']<br>&gt;&gt; | DEBUG: Executing =
shell function autotools_preconfigure<br>&gt;&gt; | DEBUG: Shell =
function autotools_preconfigure finished<br>&gt;&gt; | DEBUG: Executing =
python function autotools_copy_aclocals<br>&gt;&gt; | DEBUG: Python =
function autotools_copy_aclocals finished<br>&gt;&gt; | DEBUG: Executing =
shell function do_configure<br>&gt;&gt; | gnu-configize: '<a =
href=3D"http://configure.ac/" target=3D"_blank">configure.ac</a>' or '<a =
href=3D"http://configure.in/" target=3D"_blank">configure.in</a>' is =
required<br>&gt;&gt; | WARNING: =
/home/vix/oe-alliance/builds/openvix/tmp/work/mips32el-oe-linux/talloc/tal=
loc-2.0.1-r2/temp/run.do_configure.9168:1 exit 1 from<br>&gt;&gt; | =
&nbsp; gnu-configize<br>&gt;&gt; | ERROR: Function failed: do_configure =
(log file is located at =
/home/vix/oe-alliance/builds/openvix/tmp/work/mips32el-oe-linux/talloc/tal=
loc-2.0.1-r2/temp/log.do_configure.9168)<br>&gt;&gt; ERROR: Task 4967 =
(/home/vix/oe-alliance/meta-openembedded/meta-oe/recipes-support/talloc/<a=
 href=3D"http://talloc_2.0.1.bb/" target=3D"_blank">talloc_2.0.1.bb</a>, =
do_configure) failed with exit code =
=911'<br>&gt;&gt;<br>&gt;&gt;<br>&gt;&gt;<br>&gt;&gt; hope someone can =
help<br>&gt;&gt;<br>&gt;&gt;<br>&gt;&gt; cheers<br>&gt;&gt; =
Andy.<br>&gt;&gt; --<br>&gt;&gt; =
_______________________________________________<br>&gt;&gt; =
Openembedded-core mailing list<br>&gt;&gt;<span =
class=3D"Apple-converted-space">&nbsp;</span><a>Openembedded-core@lists.op=
enembedded.org</a><br>&gt;&gt;<span =
class=3D"Apple-converted-space">&nbsp;</span><a =
href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core" =
target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembed=
ded-core</a><br><br>--<br>_______________________________________________<=
br>Openembedded-core mailing list<br><a></a><a =
href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-core=
@lists.openembedded.org</a><br><a =
href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core" =
target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembed=
ded-core</a></blockquote></div></blockquote></div><br></div></body></html>=

--Boundary_(ID_F2WjKIUBBITrvQihhjznNA)--
