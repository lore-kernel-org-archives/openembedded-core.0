Received: from dub0-omc3-s2.dub0.hotmail.com ([157.55.2.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric_edwin@hotmail.com>) id 1UZUgB-0000TN-9Q
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 01:18:47 +0200
Received: from DUB112-W40 ([157.55.2.7]) by dub0-omc3-s2.dub0.hotmail.com with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 6 May 2013 15:59:45 -0700
X-EIP: [kEOoCU73rhaPPPLtnQnAhlPxdupjmziS]
X-Originating-Email: [eric_edwin@hotmail.com]
Message-ID: <DUB112-W40816E341A40E20F3C2375FCB90@phx.gbl>
From: Eric Edwin <eric_edwin@hotmail.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Mon, 6 May 2013 22:59:45 +0000
Importance: Normal
MIME-Version: 1.0
X-OriginalArrivalTime: 06 May 2013 22:59:45.0625 (UTC)
	FILETIME=[66E2A490:01CE4AAD]
Subject: Error gettext_0.18.2, spitz
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 May 2013 23:18:48 -0000
Content-Type: multipart/alternative;
	boundary="_2b05b4f2-7916-45ca-a87d-9dff9854dfdb_"

--_2b05b4f2-7916-45ca-a87d-9dff9854dfdb_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi=2CI'd appreciate any help=3B I have git pull the latest oe-core reposito=
ries this afternoon & tried to build core-image-minimal over the past week =
but ' gettext_0.18.2.bb=2C do_compile) failed with exit code '1' '
Details are=3Bbblayers.conf   http://pastebin.com/1ktExTLi error log       =
    http://pastebin.com/Gys0wHLi console log       http://pastebin.com/6UYs=
4e3y$ bitbake core-image-minimal
Build Configuration:
BB_VERSION        =3D "1.19.0"BUILD_SYS         =3D "x86_64-linux"NATIVELSB=
STRING   =3D "Ubuntu-12.04"TARGET_SYS        =3D "arm-oe-linux-gnueabi"MACH=
INE           =3D "spitz"DISTRO_VERSION    =3D "oe-core.0"TUNE_FEATURES    =
 =3D "armv5 thumb dsp"TARGET_FPU        =3D "soft"meta              =3D "ma=
ster:3472c1f7ab409cd91c1d4782d9e00880b84e3ae8"meta-handheld     =3D "master=
:8a120feba14249321ad51829f281180f3b62e041"meta-initramfs    =3D "master:a8b=
96b69bd418b74f48dc4d111caac676ae667f5"

Summary: 1 task failed:  virtual:native:/home/eric/oe-core/meta/recipes-cor=
e/gettext/gettext_0.18.2.bb=2C do_compileSummary: There was 1 ERROR message=
 shown=2C returning a non-zero exit code.
Thanks in advance=2C Eric=20

 		 	   		  =

--_2b05b4f2-7916-45ca-a87d-9dff9854dfdb_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<style><!--
.hmmessage P
{
margin:0px=3B
padding:0px
}
body.hmmessage
{
font-size: 12pt=3B
font-family:Calibri
}
--></style></head>
<body class=3D'hmmessage'><div dir=3D'ltr'><span style=3D"color: rgb(68=2C =
68=2C 68)=3B font-size: 15px=3B line-height: 21px=3B">Hi=2C</span><br style=
=3D"line-height: 21px=3B color: rgb(68=2C 68=2C 68)=3B font-size: 15px=3B">=
<span style=3D"color: rgb(68=2C 68=2C 68)=3B font-size: 15px=3B line-height=
: 21px=3B">I'd appreciate any help=3B I have git pull the latest oe-core re=
positories this afternoon &amp=3B tried to build core-image-minimal over th=
e past week but '&nbsp=3B</span><span style=3D"font-size: 12pt=3B">gettext_=
0.18.2.bb=2C do_compile) failed with exit code '1' '</span><div><br><span s=
tyle=3D"color: rgb(68=2C 68=2C 68)=3B font-size: 15px=3B line-height: 21px=
=3B">Details are=3B</span><br style=3D"line-height: 21px=3B color: rgb(68=
=2C 68=2C 68)=3B font-size: 15px=3B"><br style=3D"line-height: 21px=3B colo=
r: rgb(68=2C 68=2C 68)=3B font-size: 15px=3B"><span style=3D"color: rgb(68=
=2C 68=2C 68)=3B font-size: 15px=3B line-height: 21px=3B">bblayers.conf&nbs=
p=3B&nbsp=3B http://pastebin.com/1ktExTLi&nbsp=3B</span><br style=3D"line-h=
eight: 21px=3B color: rgb(68=2C 68=2C 68)=3B font-size: 15px=3B"><span styl=
e=3D"color: rgb(68=2C 68=2C 68)=3B font-size: 15px=3B line-height: 21px=3B"=
>error log &nbsp=3B &nbsp=3B &nbsp=3B &nbsp=3B &nbsp=3B&nbsp=3B</span><a hr=
ef=3D"http://pastebin.com/Gys0wHLi">http://pastebin.com/Gys0wHLi</a><span s=
tyle=3D"color: rgb(68=2C 68=2C 68)=3B font-size: 15px=3B line-height: 21px=
=3B">&nbsp=3B</span><br style=3D"line-height: 21px=3B color: rgb(68=2C 68=
=2C 68)=3B font-size: 15px=3B"><span style=3D"color: rgb(68=2C 68=2C 68)=3B=
 font-size: 15px=3B line-height: 21px=3B">console log &nbsp=3B &nbsp=3B &nb=
sp=3B&nbsp=3B</span><a href=3D"http://pastebin.com/6UYs4e3y">http://pastebi=
n.com/6UYs4e3y</a><br style=3D"line-height: 21px=3B color: rgb(68=2C 68=2C =
68)=3B font-size: 15px=3B"><br style=3D"line-height: 21px=3B color: rgb(68=
=2C 68=2C 68)=3B font-size: 15px=3B"><blockquote><font color=3D"#444444"><s=
pan style=3D"font-size: 15px=3B line-height: 21px=3B">$ bitbake core-image-=
minimal</span></font></blockquote><blockquote><div><br></div><div class=3D"=
ecxde1"><span style=3D"font-size: 15px=3B line-height: 21px=3B color: rgb(6=
8=2C 68=2C 68)=3B">Build Configuration:</span><br><div class=3D"ecxde1"><fo=
nt color=3D"#444444"><span style=3D"font-size: 15px=3B line-height: 21px=3B=
">BB_VERSION &nbsp=3B &nbsp=3B &nbsp=3B &nbsp=3B=3D "1.19.0"</span></font><=
/div><div class=3D"ecxde1"><font color=3D"#444444"><span style=3D"font-size=
: 15px=3B line-height: 21px=3B">BUILD_SYS &nbsp=3B &nbsp=3B &nbsp=3B &nbsp=
=3B =3D "x86_64-linux"</span></font></div><div class=3D"ecxde1"><font color=
=3D"#444444"><span style=3D"font-size: 15px=3B line-height: 21px=3B">NATIVE=
LSBSTRING &nbsp=3B =3D "Ubuntu-12.04"</span></font></div><div class=3D"ecxd=
e1"><font color=3D"#444444"><span style=3D"font-size: 15px=3B line-height: =
21px=3B">TARGET_SYS &nbsp=3B &nbsp=3B &nbsp=3B &nbsp=3B=3D "arm-oe-linux-gn=
ueabi"</span></font></div><div class=3D"ecxde1"><font color=3D"#444444"><sp=
an style=3D"font-size: 15px=3B line-height: 21px=3B">MACHINE &nbsp=3B &nbsp=
=3B &nbsp=3B &nbsp=3B &nbsp=3B =3D "spitz"</span></font></div><div class=3D=
"ecxde1"><font color=3D"#444444"><span style=3D"font-size: 15px=3B line-hei=
ght: 21px=3B">DISTRO_VERSION &nbsp=3B &nbsp=3B=3D "oe-core.0"</span></font>=
</div><div class=3D"ecxde1"><font color=3D"#444444"><span style=3D"font-siz=
e: 15px=3B line-height: 21px=3B">TUNE_FEATURES &nbsp=3B &nbsp=3B =3D "armv5=
 thumb dsp"</span></font></div><div class=3D"ecxde1"><font color=3D"#444444=
"><span style=3D"font-size: 15px=3B line-height: 21px=3B">TARGET_FPU &nbsp=
=3B &nbsp=3B &nbsp=3B &nbsp=3B=3D "soft"</span></font></div><div class=3D"e=
cxde1"><font color=3D"#444444"><span style=3D"font-size: 15px=3B line-heigh=
t: 21px=3B">meta &nbsp=3B &nbsp=3B &nbsp=3B &nbsp=3B &nbsp=3B &nbsp=3B &nbs=
p=3B=3D "master:3472c1f7ab409cd91c1d4782d9e00880b84e3ae8"</span></font></di=
v><div class=3D"ecxde1"><font color=3D"#444444"><span style=3D"font-size: 1=
5px=3B line-height: 21px=3B">meta-handheld &nbsp=3B &nbsp=3B =3D "master:8a=
120feba14249321ad51829f281180f3b62e041"</span></font></div><div class=3D"ec=
xde1"><font color=3D"#444444"><span style=3D"font-size: 15px=3B line-height=
: 21px=3B">meta-initramfs &nbsp=3B &nbsp=3B=3D "master:a8b96b69bd418b74f48d=
c4d111caac676ae667f5"</span></font></div><div style=3D"color: rgb(68=2C 68=
=2C 68)=3B font-size: 15px=3B line-height: 21px=3B"><br></div></div><br><di=
v class=3D"ecxde2"><div class=3D"ecxde2"><font color=3D"#444444"><span styl=
e=3D"font-size: 15px=3B line-height: 21px=3B">Summary: 1 task failed:</span=
></font></div><div class=3D"ecxde2"><font color=3D"#444444"><span style=3D"=
font-size: 15px=3B line-height: 21px=3B">&nbsp=3B virtual:native:/home/eric=
/oe-core/meta/recipes-core/gettext/gettext_0.18.2.bb=2C do_compile</span></=
font></div><div class=3D"ecxde2"><font color=3D"#444444"><span style=3D"fon=
t-size: 15px=3B line-height: 21px=3B">Summary: There was 1 ERROR message sh=
own=2C returning a non-zero exit code.</span></font></div><div style=3D"col=
or: rgb(68=2C 68=2C 68)=3B font-size: 15px=3B line-height: 21px=3B"><br></d=
iv></div></blockquote>Thanks in advance=2C&nbsp=3B</div><div>Eric&nbsp=3B<b=
r><br></div> 		 	   		  </div></body>
</html>=

--_2b05b4f2-7916-45ca-a87d-9dff9854dfdb_--
