Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cristian.iorga@intel.com>) id 1U2cwA-0003AY-Mw
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 08:27:28 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 04 Feb 2013 23:11:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,602,1355126400"; 
	d="scan'208,217";a="282864786"
Received: from irsmsx104.ger.corp.intel.com ([163.33.3.159])
	by fmsmga001.fm.intel.com with ESMTP; 04 Feb 2013 23:11:35 -0800
Received: from irsmsx152.ger.corp.intel.com (163.33.192.66) by
	IRSMSX104.ger.corp.intel.com (163.33.3.159) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Tue, 5 Feb 2013 07:11:34 +0000
Received: from irsmsx102.ger.corp.intel.com ([169.254.2.82]) by
	IRSMSX152.ger.corp.intel.com ([169.254.6.66]) with mapi id
	14.01.0355.002; Tue, 5 Feb 2013 07:11:34 +0000
From: "Iorga, Cristian" <cristian.iorga@intel.com>
To: lei yang <yanglei.fage@gmail.com>
Thread-Topic: [OE-core] [PATCH] net-tools: upgrade to v1.60-24.2
Thread-Index: AQHOAI4PdLN+lulFpkeBYkrJwRybYZhnZ2sAgAIFehCAARtCgIAAViJQ
Date: Tue, 5 Feb 2013 07:11:33 +0000
Message-ID: <969F26A8BAB325438E7EB80D3C3134FB161F3756@IRSMSX102.ger.corp.intel.com>
References: <1359731346-16190-1-git-send-email-cristian.iorga@intel.com>
	<258C02DC-9331-432A-93B2-4173DA69968D@gmail.com>
	<969F26A8BAB325438E7EB80D3C3134FB161F3065@IRSMSX102.ger.corp.intel.com>
	<CAHsH0E-fKH4ZyCPjsi5D9pqZoPfXzswc5Xt_Jm0m87LUoZFfZQ@mail.gmail.com>
In-Reply-To: <CAHsH0E-fKH4ZyCPjsi5D9pqZoPfXzswc5Xt_Jm0m87LUoZFfZQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [163.33.239.180]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] net-tools: upgrade to v1.60-24.2
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
X-List-Received-Date: Tue, 05 Feb 2013 07:27:29 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_969F26A8BAB325438E7EB80D3C3134FB161F3756IRSMSX102gercor_"

--_000_969F26A8BAB325438E7EB80D3C3134FB161F3756IRSMSX102gercor_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello Lei,

Please note that I answered your question, but this patch was sent in for =
review.
Other people might consider your questions as comments, and as such, this =
patch will not get merged.

Regards,
Cristian

From: lei yang [mailto:yanglei.fage@gmail.com]
Sent: Tuesday, February 05, 2013 4:01 AM
To: Iorga, Cristian
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] net-tools: upgrade to v1.60-24.2



On Monday, February 4, 2013, Iorga, Cristian wrote:
See my answers below.

-----Original Message-----
From: Lei Yang [mailto:yanglei.fage@gmail.com<javascript:;>]
Sent: Sunday, February 03, 2013 4:15 AM
To: Iorga, Cristian
Cc: openembedded-core@lists.openembedded.org<javascript:;>
Subject: Re: [OE-core] [PATCH] net-tools: upgrade to v1.60-24.2
On 2013-2-1, at 23:09, Cristian Iorga <cristian.iorga@intel.com<javascript=
:;>> wrote:

> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com<javascript:;>>
> ---
> .../net-tools-config.h                                           |    0
> .../net-tools-config.make                                        |    0
> .../net-tools/{net-tools_1.60-23.bb<http://net-tools_1.60-23.bb> =3D> ne=
t-tools_1.60-24.2.bb<http://net-tools_1.60-24.2.bb>}   |    6 +++---
> 3 files changed, 3 insertions(+), 3 deletions(-) rename
> meta/recipes-extended/net-tools/{net-tools-1.60-23 =3D>
> net-tools-1.60-24.2}/net-tools-config.h (100%) rename
> meta/recipes-extended/net-tools/{net-tools-1.60-23 =3D>
> net-tools-1.60-24.2}/net-tools-config.make (100%) rename
> meta/recipes-extended/net-tools/{net-tools_1.60-23.bb<http://net-tools_1=
.60-23.bb> =3D>
> net-tools_1.60-24.2.bb<http://net-tools_1.60-24.2.bb>} (94%)
>
> diff --git
> a/meta/recipes-extended/net-tools/net-tools-1.60-23/net-tools-config.h
> b/meta/recipes-extended/net-tools/net-tools-1.60-24.2/net-tools-config
> .h
> similarity index 100%
> rename from
> meta/recipes-extended/net-tools/net-tools-1.60-23/net-tools-config.h
> rename to
> meta/recipes-extended/net-tools/net-tools-1.60-24.2/net-tools-config.h
> diff --git
> a/meta/recipes-extended/net-tools/net-tools-1.60-23/net-tools-config.m
> ake
> b/meta/recipes-extended/net-tools/net-tools-1.60-24.2/net-tools-config
> .make
> similarity index 100%
> rename from
> meta/recipes-extended/net-tools/net-tools-1.60-23/net-tools-config.mak
> e rename to
> meta/recipes-extended/net-tools/net-tools-1.60-24.2/net-tools-config.m
> ake diff --git a/meta/recipes-extended/net-tools/net-tools_1.60-23.bb<ht=
tp://net-tools_1.60-23.bb>
> b/meta/recipes-extended/net-tools/net-tools_1.60-24.2.bb<http://net-tool=
s_1.60-24.2.bb>
> similarity index 94%
> rename from meta/recipes-extended/net-tools/net-tools_1.60-23.bb<http://=
net-tools_1.60-23.bb>
> rename to meta/recipes-extended/net-tools/net-tools_1.60-24.2.bb<http://=
net-tools_1.60-24.2.bb>
> index bc61d21..4040e1a 100644
> --- a/meta/recipes-extended/net-tools/net-tools_1.60-23.bb<http://net-to=
ols_1.60-23.bb>
> +++ b/meta/recipes-extended/net-tools/net-tools_1.60-24.2.bb<http://net-=
tools_1.60-24.2.bb>
> @@ -5,7 +5,7 @@ BUGTRACKER =3D "http://bugs.debian.org/net-tools"
> LICENSE =3D "GPLv2+"
> LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8ca43cbc842c2336e835926c2166c=
28b \
>                     file://ifconfig.c;beginline=3D11;endline=3D15;md5=3D=
d1ca372080ad5401e23ca0afc35cf9ba<file:///\\COPYING;md5=3D8ca43cbc842c2336e8=
35926c2166c28b%20\%0b%3e%20=A0%20=A0%20=A0%20=A0%20=A0%20=A0%20=A0%20=A0%20=
=
=A0%20=A0%20file:\ifconfig.c;beginline=3D11;endline=3D15;md5=3Dd1ca372080a=
d5401e23ca0afc35cf9ba>"
> -PR =3D "r3"
> +PR =3D "r0"
>

Is there a reason to change it back to r0
Yes, because an upgrade has been done.

I  thought it should aways bump,seems if we update the PV, it will be rese=
t to r0. Right?

Yes.


Lei

> SRC_URI =3D "${DEBIAN_MIRROR}/main/n/net-tools/net-tools_1.60.orig.tar.g=
z;name=3Dtarball \
>
> ${DEBIAN_MIRROR}/main/n/net-tools/${BPN}_${PV}.diff.gz;apply=3Dno;name=
=3Dp
> atch \

Not sure why it not apply but not remove it.
Sorry, I don't understand your comment.
This package is distributed as a "base" tarball + patches to higher versio=
ns.
Hence, I don't understand your comment.

I mean apply=3Dno, here

Lei


I

Lei

> @@ -17,8 +17,8 @@ S =3D "${WORKDIR}/net-tools-1.60"
> SRC_URI[tarball.md5sum] =3D "ecaf37acb5b5daff4bdda77785fd916d"
> SRC_URI[tarball.sha256sum] =3D "ec67967cf7b1a3a3828a84762fbc013ac50ee5dc=
9aa3095d5c591f302c2de0f5"
>
> -SRC_URI[patch.md5sum] =3D "2412e55c20308d5fbd28bfadd18c075f"
> -SRC_URI[patch.sha256sum] =3D "d678b3ea97d6c7ca548918994642bfc6b5511ab02=
f3a5881dfcca00c88bfd73b"
> +SRC_URI[patch.md5sum] =3D "524658bb8df5ff92c4a991f5edcaf240"
> +SRC_URI[patch.sha256sum] =3D "170cc024fcb34329f4c25fd88b5f160a06be5d6d3=
eaf0bc976650fd1b1a6235d"
>
> inherit gettext
>
> --
> 1.7.10.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org<javascript:;>
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--_000_969F26A8BAB325438E7EB80D3C3134FB161F3756IRSMSX102gercor_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859=
-1">
<meta name=3D"Generator" content=3D"Microsoft Word 12 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.MsoAcetate, li.MsoAcetate, div.MsoAcetate
	{mso-style-priority:99;
	mso-style-link:"Balloon Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:8.0pt;
	font-family:"Tahoma","sans-serif";}
span.BalloonTextChar
	{mso-style-name:"Balloon Text Char";
	mso-style-priority:99;
	mso-style-link:"Balloon Text";
	font-family:"Tahoma","sans-serif";}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;C=
alibri&quot;,&quot;sans-serif&quot;;color:#1F497D">Hello Lei,<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;C=
alibri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;C=
alibri&quot;,&quot;sans-serif&quot;;color:#1F497D">Please note that I answe=
red your question, but this patch was sent in for review.<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;C=
alibri&quot;,&quot;sans-serif&quot;;color:#1F497D">Other people might consi=
der your questions as comments, and as such, this patch will not get merged=
.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;C=
alibri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;C=
alibri&quot;,&quot;sans-serif&quot;;color:#1F497D">Regards,<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;C=
alibri&quot;,&quot;sans-serif&quot;;color:#1F497D">Cristian<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;C=
alibri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span>=
</p>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in=
 0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quo=
t;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-=
size:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> lei yan=
g [mailto:yanglei.fage@gmail.com]
<br>
<b>Sent:</b> Tuesday, February 05, 2013 4:01 AM<br>
<b>To:</b> Iorga, Cristian<br>
<b>Cc:</b> openembedded-core@lists.openembedded.org<br>
<b>Subject:</b> Re: [OE-core] [PATCH] net-tools: upgrade to v1.60-24.2<o:p=
></o:p></span></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><br>
<br>
On Monday, February 4, 2013, Iorga, Cristian wrote:<o:p></o:p></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">See my answers below=
.<br>
<br>
-----Original Message-----<br>
From: Lei Yang [mailto:<a href=3D"javascript:;">yanglei.fage@gmail.com</a>=
]<br>
Sent: Sunday, February 03, 2013 4:15 AM<br>
To: Iorga, Cristian<br>
Cc: <a href=3D"javascript:;">openembedded-core@lists.openembedded.org</a><=
br>
Subject: Re: [OE-core] [PATCH] net-tools: upgrade to v1.60-24.2<br>
<br>
<br>
<br><br>
<br>
On 2013-2-1, at 23:09, Cristian Iorga &lt;<a href=3D"javascript:;">cristia=
n.iorga@intel.com</a>&gt; wrote:<br>
<br>
&gt; Signed-off-by: Cristian Iorga &lt;<a href=3D"javascript:;">cristian.i=
orga@intel.com</a>&gt;<br>
&gt; ---<br>
&gt; .../net-tools-config.h &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; | &nbsp; &nbsp;0<br>
&gt; .../net-tools-config.make &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp;| &nbsp; &nbsp;0<br>
&gt; .../net-tools/{<a href=3D"http://net-tools_1.60-23.bb" target=3D"_bla=
nk">net-tools_1.60-23.bb</a> =3D&gt;
<a href=3D"http://net-tools_1.60-24.2.bb" target=3D"_blank">net-tools_1.60=
-24.2.bb</a>} &nbsp; | &nbsp; &nbsp;6 &#43;&#43;&#43;---<br>
&gt; 3 files changed, 3 insertions(&#43;), 3 deletions(-) rename<br>
&gt; meta/recipes-extended/net-tools/{net-tools-1.60-23 =3D&gt;<br>
&gt; net-tools-1.60-24.2}/net-tools-config.h (100%) rename<br>
&gt; meta/recipes-extended/net-tools/{net-tools-1.60-23 =3D&gt;<br>
&gt; net-tools-1.60-24.2}/net-tools-config.make (100%) rename<br>
&gt; meta/recipes-extended/net-tools/{<a href=3D"http://net-tools_1.60-23.=
bb" target=3D"_blank">net-tools_1.60-23.bb</a> =3D&gt;<br>
&gt; <a href=3D"http://net-tools_1.60-24.2.bb" target=3D"_blank">net-tools=
_1.60-24.2.bb</a>} (94%)<br>
&gt;<br>
&gt; diff --git<br>
&gt; a/meta/recipes-extended/net-tools/net-tools-1.60-23/net-tools-config.=
h<br>
&gt; b/meta/recipes-extended/net-tools/net-tools-1.60-24.2/net-tools-confi=
g<br>
&gt; .h<br>
&gt; similarity index 100%<br>
&gt; rename from<br>
&gt; meta/recipes-extended/net-tools/net-tools-1.60-23/net-tools-config.h<=
br>
&gt; rename to<br>
&gt; meta/recipes-extended/net-tools/net-tools-1.60-24.2/net-tools-config.=
h<br>
&gt; diff --git<br>
&gt; a/meta/recipes-extended/net-tools/net-tools-1.60-23/net-tools-config.=
m<br>
&gt; ake<br>
&gt; b/meta/recipes-extended/net-tools/net-tools-1.60-24.2/net-tools-confi=
g<br>
&gt; .make<br>
&gt; similarity index 100%<br>
&gt; rename from<br>
&gt; meta/recipes-extended/net-tools/net-tools-1.60-23/net-tools-config.ma=
k<br>
&gt; e rename to<br>
&gt; meta/recipes-extended/net-tools/net-tools-1.60-24.2/net-tools-config.=
m<br>
&gt; ake diff --git a/meta/recipes-extended/net-tools/<a href=3D"http://ne=
t-tools_1.60-23.bb" target=3D"_blank">net-tools_1.60-23.bb</a><br>
&gt; b/meta/recipes-extended/net-tools/<a href=3D"http://net-tools_1.60-24=
.2.bb" target=3D"_blank">net-tools_1.60-24.2.bb</a><br>
&gt; similarity index 94%<br>
&gt; rename from meta/recipes-extended/net-tools/<a href=3D"http://net-too=
ls_1.60-23.bb" target=3D"_blank">net-tools_1.60-23.bb</a><br>
&gt; rename to meta/recipes-extended/net-tools/<a href=3D"http://net-tools=
_1.60-24.2.bb" target=3D"_blank">net-tools_1.60-24.2.bb</a><br>
&gt; index bc61d21..4040e1a 100644<br>
&gt; --- a/meta/recipes-extended/net-tools/<a href=3D"http://net-tools_1.6=
0-23.bb" target=3D"_blank">net-tools_1.60-23.bb</a><br>
&gt; &#43;&#43;&#43; b/meta/recipes-extended/net-tools/<a href=3D"http://n=
et-tools_1.60-24.2.bb" target=3D"_blank">net-tools_1.60-24.2.bb</a><br>
&gt; @@ -5,7 &#43;5,7 @@ BUGTRACKER =3D &quot;<a href=3D"http://bugs.debia=
n.org/net-tools" target=3D"_blank">http://bugs.debian.org/net-tools</a>&quo=
t;<br>
&gt; LICENSE =3D &quot;GPLv2&#43;&quot;<br>
&gt; LIC_FILES_CHKSUM =3D &quot;<a href=3D"file:///\\COPYING;md5=3D8ca43cb=
c842c2336e835926c2166c28b%20\%0b%3e%20&nbsp;%20&nbsp;%20&nbsp;%20&nbsp;%20&=
nbsp;%20&nbsp;%20&nbsp;%20&nbsp;%20&nbsp;%20&nbsp;%20file:\ifconfig.c;begin=
line=3D11;endline=3D15;md5=3Dd1ca372080ad5401e23ca0afc35cf9ba">file://COPYI=
NG;md5=3D8ca43cbc842c2336e835926c2166c28b
 \<br>
&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 file://ifconfig.c;beginline=3D11;endline=3D15;md5=3Dd1ca372080ad5401e23ca0=
afc35cf9ba</a>&quot;<br>
&gt; -PR =3D &quot;r3&quot;<br>
&gt; &#43;PR =3D &quot;r0&quot;<br>
&gt;<br>
<br>
Is there a reason to change it back to r0<br>
Yes, because an upgrade has been done.<o:p></o:p></p>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">I&nbsp; thought it should aways bump,seems if we up=
date the PV, it will be reset to r0. Right?<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;C=
alibri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span>=
</p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;C=
alibri&quot;,&quot;sans-serif&quot;;color:#1F497D">Yes.<o:p></o:p></span></=
p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<blockquote style=3D"border:none;border-left:solid #CCCCCC 1.0pt;padding:0=
in 0in 0in 6.0pt;margin-left:4.8pt;margin-right:0in">
<p class=3D"MsoNormal"><br>
Lei<br>
<br>
&gt; SRC_URI =3D &quot;${DEBIAN_MIRROR}/main/n/net-tools/net-tools_1.60.or=
ig.tar.gz;name=3Dtarball \<br>
&gt;<br>
&gt; ${DEBIAN_MIRROR}/main/n/net-tools/${BPN}_${PV}.diff.gz;apply=3Dno;nam=
e=3Dp<br>
&gt; atch \<br>
<br>
Not sure why it not apply but not remove it.<br>
Sorry, I don't understand your comment.<br>
This package is distributed as a &quot;base&quot; tarball &#43; patches to=
 higher versions.<br>
Hence, I don't understand your comment.<o:p></o:p></p>
</blockquote>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">I mean apply=3Dno, here<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Lei<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<p class=3D"MsoNormal">I<o:p></o:p></p>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
<blockquote style=3D"border:none;border-left:solid #CCCCCC 1.0pt;padding:0=
in 0in 0in 6.0pt;margin-left:4.8pt;margin-right:0in">
<p class=3D"MsoNormal">Lei<br>
<br>
&gt; @@ -17,8 &#43;17,8 @@ S =3D &quot;${WORKDIR}/net-tools-1.60&quot;<br>
&gt; SRC_URI[tarball.md5sum] =3D &quot;ecaf37acb5b5daff4bdda77785fd916d&qu=
ot;<br>
&gt; SRC_URI[tarball.sha256sum] =3D &quot;ec67967cf7b1a3a3828a84762fbc013a=
c50ee5dc9aa3095d5c591f302c2de0f5&quot;<br>
&gt;<br>
&gt; -SRC_URI[patch.md5sum] =3D &quot;2412e55c20308d5fbd28bfadd18c075f&quo=
t;<br>
&gt; -SRC_URI[patch.sha256sum] =3D &quot;d678b3ea97d6c7ca548918994642bfc6b=
5511ab02f3a5881dfcca00c88bfd73b&quot;<br>
&gt; &#43;SRC_URI[patch.md5sum] =3D &quot;524658bb8df5ff92c4a991f5edcaf240=
&quot;<br>
&gt; &#43;SRC_URI[patch.sha256sum] =3D &quot;170cc024fcb34329f4c25fd88b5f1=
60a06be5d6d3eaf0bc976650fd1b1a6235d&quot;<br>
&gt;<br>
&gt; inherit gettext<br>
&gt;<br>
&gt; --<br>
&gt; 1.7.10.4<br>
&gt;<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"javascript:;">Openembedded-core@lists.openembedded.org</a>=
<br>
&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openem=
bedded-core" target=3D"_blank">
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</a><=
o:p></o:p></p>
</blockquote>
</div>
</body>
</html>

--_000_969F26A8BAB325438E7EB80D3C3134FB161F3756IRSMSX102gercor_--
