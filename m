Return-Path: <pandey_himanshu80@rediffmail.com>
Received: from f4mail-83-120.rediffmail.com (webmail52.rediffmail.com
	[203.199.83.120])
	by mail.openembedded.org (Postfix) with ESMTP id 9ED306FC4F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Aug 2014 12:53:49 +0000 (UTC)
Received: from rediffmail.com (unknown [10.50.250.70])
	by f4mail-83-119.rediffmail.com (Postfix) with SMTP id AED5E3096D16
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Aug 2014 18:01:45 +0530 (IST)
Received: (qmail 23203 invoked by uid 510); 22 Aug 2014 12:43:30 -0000
Comment: DomainKeys? See http://antispam.yahoo.com/domainkeys
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=redf; d=rediffmail.com;
	b=MBwMTm3/Fh9QBgdsGLFI9TcXT5KW+ufeluQ0DgxjhDpnZzMpHzm0tbuMY0T1c9ARjVAXPxKewLtCcq+bQ6KsDeCBwEstB/g2cwccYoELYJDalluhy586FUPuxQV3tEWDJ8nwJX1zA3da6rUaAqHSl98b5oFO3sZrrGoIBKYvjbs=
	; 
x-m-msg: asd54ad564ad7aa6sd5as6d5; a6da7d6asas6dasd77; 5dad65ad5sd;
X-CTCH-Spam: Unknown
X-CTCH-VOD: Unknown
X-CTCH-Flags: : 0
X-CTCH-RefID: str=0001.0A160208.53F73AF2.0105, ss=1, re=-2.300, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0
X-REDF-OSEN: pandey_himanshu80@rediffmail.com
Date: 22 Aug 2014 12:43:29 -0000
Message-ID: <20140822124329.23077.qmail@f4mail-235-197.rediffmail.com>
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Received: from unknown 103.25.205.2 by rediffmail.com via HTTP;
	22 Aug 2014 12:43:29 -0000
Sender: pandey_himanshu80@rediffmail.com
From: "Himanshu  Pandey" <pandey_himanshu80@rediffmail.com>
Subject: Error
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
X-List-Received-Date: Fri, 22 Aug 2014 12:53:52 -0000
Content-Type: multipart/alternative;
	boundary="=_c9c4c5a3ef7a1898a7f745ce6989b938"

--=_c9c4c5a3ef7a1898a7f745ce6989b938
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="UTF-8"

Hi,
I am constantly getting these errors while compiling my net-snmp receipe. Please find my receipe below.
ERROR: QA Issue: non -staticdev package contains static .a library: net-snmp path '/work/x86_64-poky-linux/net-snmp/1.0-r8/packages-split/net-snmp/opt/net-snmp/lib/libnetsnmpagent.a'ERROR: QA Issue: non -dev/-dbg/-nativesdk package contains symlink .so: net-snmp path '/work/x86_64-poky-linux/net-snmp/1.0-r8/packages-split/net-snmp/opt/net-snmp/lib/libnetsnmp.so'ERROR: QA Issue: non -staticdev package contains static .a library: net-snmp path '/work/x86_64-poky-linux/net-snmp/1.0-r8/packages-split/net-snmp/opt/net-snmp/lib/libnetsnmptrapd.a'ERROR: QA Issue: non -dev/-dbg/-nativesdk package contains symlink .so: net-snmp path '/work/x86_64-poky-linux/net-snmp/1.0-r8/packages-split/net-snmp/opt/net-snmp/lib/libnetsnmptrapd.so'ERROR: QA Issue: non -staticdev package contains static .a library: net-snmp path '/work/x86_64-poky-linux/net-snmp/1.0-r8/packages-split/net-snmp/opt/net-snmp/lib/libnetsnmphelpers.a'ERROR: QA Issue: non -staticdev package contains static .a library: net-s
 nmp path '/work/x86_64-poky-linux/net-snmp/1.0-r8/packages-split/net-snmp/opt/net-snmp/lib/libnetsnmpmibs.a'ERROR: QA Issue: non -dev/-dbg/-nativesdk package contains symlink .so: net-snmp path '/work/x86_64-poky-linux/net-snmp/1.0-r8/packages-split/net-snmp/opt/net-snmp/lib/libnetsnmpagent.so'ERROR: QA Issue: non -dev/-dbg/-nativesdk package contains symlink .so: net-snmp path '/work/x86_64-poky-linux/net-snmp/1.0-r8/packages-split/net-snmp/opt/net-snmp/lib/libnetsnmphelpers.so'ERROR: QA Issue: non -dev/-dbg/-nativesdk package contains symlink .so: net-snmp path '/work/x86_64-poky-linux/net-snmp/1.0-r8/packages-split/net-snmp/opt/net-snmp/lib/libnetsnmpmibs.so'ERROR: QA Issue: non -staticdev package contains static .a library: net-snmp path '/work/x86_64-poky-linux/net-snmp/1.0-r8/packages-split/net-snmp/opt/net-snmp/lib/libnetsnmp.a'ERROR: QA run found fatal errors. Please consider fixing them.ERROR: Function failed: do_package_qaERROR: Logfile of failure stored in: /home/
 yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/net-snmp/1.0-r8/temp/log.do_package.9029ERROR: Task 727 (/home/yocto/poky-dora-10.0.0/meta-msc/recipes-msc/msc/net-snmp.bb, do_package) failed with exit code '1'
My receipe is as follows:
SUMMARY = "Simple Network Management Protocol"HOMEPAGE = "http://www.net-snmp.org/"LICENSE = "CLOSED"PR = "r8"DEPENDS = "openssl libnl pciutils"INHIBIT_PACKAGE_DEBUG_SPLIT = "1"INHIBIT_PACKAGE_STRIP = "1"ALLOW_EMPTY_${PN} = "1"INSANE_SKIP_{PN} = "dev-so"SRC_URI = "http://jaist.dl.sourceforge.net/project/net-snmp/net-snmp/5.7.2.1/net-snmp-5.7.2.1.zip"
SRC_URI[md5sum] = "a2c83518648b0f2a5d378625e45c0e18"SRC_URI[sha256sum] = "ac9105539971f7cfb1456a86d479e18e8a8b3712212595ad40504347ba5843da"
S = "${WORKDIR}/net-snmp-5.7.2.1"inherit autotools
LDFLAGS= "-L/home/yocto/poky-dora-10.0.0/build/tmp/work/genericx86_64-poky-linux/core-image-msc/1.0-r0/rootfs/lib/"
do_configure() {
./configure --build=x86_64-linux --host=x86_64-poky-linux --target=x86_64-poky-linux --prefix=$(D)/opt/net-snmp --exec_prefix=$(D)/opt/net-snmp --bindir=$(D)/opt/net-snmp/bin --sbindir=$(D)/opt/net-snmp/sbin --libexecdir=$(D)/opt/net-snmp/lib/ --datadir=$(D)/opt/net-snmp/share --sysconfdir=$(D)/opt/net-snmp/etc --sharedstatedir=$(D)/com --localstatedir=$(D)/opt/net-snmp/var --libdir=$(D)/opt/net-snmp/lib --mandir=$(D)/opt/net-snmp/share/man --disable-embedded-perl --with-perl-modules=no --disable-manuals --enable-shared&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; oe_runmake}
PACKAGES = "${PN} ${PN}-dbg ${PN}-doc ${PN}-dev ${PN}-staticdev ${PN}-static"FILES_${PN}-dev += "/opt/net-snmp/lib/ ${includedir}"FILES_${PN}-dbg += "/opt/net-snmp/lib/"FILES_${PN} += "/opt/net-snmp/"FILES_${PN}-staticdev += "/opt/net-snmp/lib/"FILES_${PN}-static += "/opt/net-snmp/lib/"BBCLASSEXTEND = "native"
Please help to resolve the issue.
Thanks &amp; Regards,Himanshu Pandey&nbsp;

--=_c9c4c5a3ef7a1898a7f745ce6989b938
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset="UTF-8"

Hi,<div><br></div><div>I am constantly getting these errors while compiling=
 my net-snmp receipe. Please find my receipe below.</div><div><br></div><di=
v>ERROR: QA Issue: non -staticdev package contains static .a library: net-s=
nmp path '/work/x86_64-poky-linux/net-snmp/1.0-r8/packages-split/net-snmp/o=
pt/net-snmp/lib/libnetsnmpagent.a'</div><div>ERROR: QA Issue: non -dev/-dbg=
/-nativesdk package contains symlink .so: net-snmp path '/work/x86_64-poky-=
linux/net-snmp/1.0-r8/packages-split/net-snmp/opt/net-snmp/lib/libnetsnmp.s=
o'</div><div>ERROR: QA Issue: non -staticdev package contains static .a lib=
rary: net-snmp path '/work/x86_64-poky-linux/net-snmp/1.0-r8/packages-split=
/net-snmp/opt/net-snmp/lib/libnetsnmptrapd.a'</div><div>ERROR: QA Issue: no=
n -dev/-dbg/-nativesdk package contains symlink .so: net-snmp path '/work/x=
86_64-poky-linux/net-snmp/1.0-r8/packages-split/net-snmp/opt/net-snmp/lib/l=
ibnetsnmptrapd.so'</div><div>ERROR: QA Issue: non -staticdev package contai=
ns static .a library: net-snmp path '/work/x86_64-poky-linux/net-snmp/1.0-r=
8/packages-split/net-snmp/opt/net-snmp/lib/libnetsnmphelpers.a'</div><div>E=
RROR: QA Issue: non -staticdev package contains static .a library: net-snmp=
 path '/work/x86_64-poky-linux/net-snmp/1.0-r8/packages-split/net-snmp/opt/=
net-snmp/lib/libnetsnmpmibs.a'</div><div>ERROR: QA Issue: non -dev/-dbg/-na=
tivesdk package contains symlink .so: net-snmp path '/work/x86_64-poky-linu=
x/net-snmp/1.0-r8/packages-split/net-snmp/opt/net-snmp/lib/libnetsnmpagent.=
so'</div><div>ERROR: QA Issue: non -dev/-dbg/-nativesdk package contains sy=
mlink .so: net-snmp path '/work/x86_64-poky-linux/net-snmp/1.0-r8/packages-=
split/net-snmp/opt/net-snmp/lib/libnetsnmphelpers.so'</div><div>ERROR: QA I=
ssue: non -dev/-dbg/-nativesdk package contains symlink .so: net-snmp path =
'/work/x86_64-poky-linux/net-snmp/1.0-r8/packages-split/net-snmp/opt/net-sn=
mp/lib/libnetsnmpmibs.so'</div><div>ERROR: QA Issue: non -staticdev package=
 contains static .a library: net-snmp path '/work/x86_64-poky-linux/net-snm=
p/1.0-r8/packages-split/net-snmp/opt/net-snmp/lib/libnetsnmp.a'</div><div>E=
RROR: QA run found fatal errors. Please consider fixing them.</div><div>ERR=
OR: Function failed: do_package_qa</div><div>ERROR: Logfile of failure stor=
ed in: /home/yocto/poky-dora-10.0.0/build/tmp/work/x86_64-poky-linux/net-sn=
mp/1.0-r8/temp/log.do_package.9029</div><div>ERROR: Task 727 (/home/yocto/p=
oky-dora-10.0.0/meta-msc/recipes-msc/msc/net-snmp.bb, do_package) failed wi=
th exit code '1'</div><div><br></div><div>My receipe is as follows:</div><d=
iv><br></div><div><div>SUMMARY =3D "Simple Network Management Protocol"</di=
v><div>HOMEPAGE =3D "http://www.net-snmp.org/"</div><div>LICENSE =3D "CLOSE=
D"</div><div>PR =3D "r8"</div><div>DEPENDS =3D "openssl libnl pciutils"</di=
v><div>INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"</div><div>INHIBIT_PACKAGE_STRIP =
=3D "1"</div><div>ALLOW_EMPTY_${PN} =3D "1"</div><div>INSANE_SKIP_{PN} =3D =
"dev-so"</div><div>SRC_URI =3D "http://jaist.dl.sourceforge.net/project/net=
-snmp/net-snmp/5.7.2.1/net-snmp-5.7.2.1.zip"</div><div><br></div><div>SRC_U=
RI[md5sum] =3D "a2c83518648b0f2a5d378625e45c0e18"</div><div>SRC_URI[sha256s=
um] =3D "ac9105539971f7cfb1456a86d479e18e8a8b3712212595ad40504347ba5843da"<=
/div><div><br></div><div>S =3D "${WORKDIR}/net-snmp-5.7.2.1"</div><div>inhe=
rit autotools</div><div><br></div><div>LDFLAGS=3D "-L/home/yocto/poky-dora-=
10.0.0/build/tmp/work/genericx86_64-poky-linux/core-image-msc/1.0-r0/rootfs=
/lib/"</div><div><br></div><div>do_configure() {</div><div><br></div><div>.=
/configure --build=3Dx86_64-linux --host=3Dx86_64-poky-linux --target=3Dx86=
_64-poky-linux --prefix=3D$(D)/opt/net-snmp --exec_prefix=3D$(D)/opt/net-sn=
mp --bindir=3D$(D)/opt/net-snmp/bin --sbindir=3D$(D)/opt/net-snmp/sbin --li=
bexecdir=3D$(D)/opt/net-snmp/lib/ --datadir=3D$(D)/opt/net-snmp/share --sys=
confdir=3D$(D)/opt/net-snmp/etc --sharedstatedir=3D$(D)/com --localstatedir=
=3D$(D)/opt/net-snmp/var --libdir=3D$(D)/opt/net-snmp/lib --mandir=3D$(D)/o=
pt/net-snmp/share/man --disable-embedded-perl --with-perl-modules=3Dno --di=
sable-manuals --enable-shared</div><div>&nbsp;</div><div>&nbsp; &nbsp; &nbs=
p; &nbsp; oe_runmake</div><div>}</div><div><br></div><div>PACKAGES =3D "${P=
N} ${PN}-dbg ${PN}-doc ${PN}-dev ${PN}-staticdev ${PN}-static"</div><div>FI=
LES_${PN}-dev +=3D "/opt/net-snmp/lib/ ${includedir}"</div><div>FILES_${PN}=
-dbg +=3D "/opt/net-snmp/lib/"</div><div>FILES_${PN} +=3D "/opt/net-snmp/"<=
/div></div><div><div>FILES_${PN}-staticdev +=3D "/opt/net-snmp/lib/"</div><=
div>FILES_${PN}-static +=3D "/opt/net-snmp/lib/"</div><div>BBCLASSEXTEND =
=3D "native"</div></div><div><br></div><div>Please help to resolve the issu=
e.</div><div><br></div><div>Thanks &amp; Regards,</div><div>Himanshu Pandey=
&nbsp;</div><br><A HREF=3D"http://sigads.rediff.com/RealMedia/ads/click_nx.=
ads/www.rediffmail.com/signatureline.htm@Middle?" target=3D"_blank"><IMG SR=
C=3D"http://sigads.rediff.com/RealMedia/ads/adstream_nx.ads/www.rediffmail.=
com/signatureline.htm@Middle"></A><table cellpadding=3D"0" cellspacing=3D"0=
"><tbody><tr><td><div style=3D"font-family: Arial, Helvetica, sans-serif; f=
ont-size:14px">Get your own <span style=3D"padding-bottom: 0px; background-=
color: #cc0000; padding-left: 3px; padding-RIGHT: 3px; font-family: Arial, =
Helvetica, sans-serif; color: #ffffff; font-size: 12px; padding-top: 0px"><=
b>FREE</b></span> website,  <span style=3D"padding-bottom: 0px; background-=
color: #c00; padding-left: 3px; padding-RIGHT: 3px; font-family: Arial, Hel=
vetica, sans-serif; color: #ffffff; font-size: 12px; padding-top: 0px"><b>F=
REE</b></span> domain &amp; <span style=3D"padding-bottom: 0px; background-=
color: #c00; padding-left: 3px; padding-RIGHT: 3px; font-family: Arial, Hel=
vetica, sans-serif; color: #ffffff; font-size: 12px; padding-top: 0px"><b>F=
REE</b></span> mobile app with Company email. &nbsp;</div></td><td><a href=
=3D"http://track.rediff.com/click?url=3D___http://businessemail.rediff.com/=
email-ids-for-companies-with-less-than-50-employees?sc_cid=3Dsign-1-10-13__=
_&cmp=3Dhost&lnk=3Dsign-1-10-13&nsrv1=3Dhost" style=3D"font-family: Arial, =
Helvetica, sans-serif; color: #fff; font-size: 14px; color:#0000cc" target=
=3D"_blank"><b>Know More ></b></a><!-- <in-put type=3D"button" cl-ass=3D"bu=
tton" on-click=3D"parent.location=3D&#39;http://track.rediff.com/click?url=
=3D___http://businessemail.rediff.com/company-email-hosting-services?sc_cid=
=3Dsignature-23-9-13___&amp;cmp=3Dsignature-23-9-13&amp;lnk=3Dmypagelogout&=
amp;nsrv1=3Dhost&#39;" value=3D"Know more &gt;"> </input> --></td></tr></tb=
ody></table>

--=_c9c4c5a3ef7a1898a7f745ce6989b938--
