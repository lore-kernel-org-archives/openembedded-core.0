Return-Path: <changhyeok.bae@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 23C0B785E0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 00:43:23 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id j85so12277643vke.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 17:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Wn5sIctnPrzGYZ2jf2GxmRRVSDQDnrI93q27x54kFDc=;
	b=Zx+JixmN9GNOgTPVoD51e4DRuok4olvlRHP51E9ddstQryUZwtIKbyf9ikbE/C6qbR
	NX+IZC6PdNnaUDHcUatF/5rLZy0mhxDYDC1ppu75FjBGdBwVOhy5+ZmZRXHd6EPvkwRj
	8UtpAxEYkr0fxe/Vro9C1fiZ31AyPf2K3sBSqxWhPfrbQZMruxyHSASLtpoorO9s/+dB
	GfK/0bIkGd1j7b7hjxqvI1OM61vRsGcR+X0MMfrx2b95PTzD0OSeCdlQuKS6AyN3wKdL
	DImldDS8ELok5hGJ8zZnnNqwg0ZJuII9wonDQdlxegnYyJU0hNnVaGUR93VlQx6ku/zd
	Z2yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Wn5sIctnPrzGYZ2jf2GxmRRVSDQDnrI93q27x54kFDc=;
	b=c/siL9PR5ilvJDmBXESfas48t0F8XJpr2nEbiGnNcPXcT+rx5QweskNtRRhs3ibb8N
	yxg8GhPfn7HpSTWlu/IpzLSgwgq/p44YNSBcxze1u1TNVJfx3SW1gJTz7ql5MBjFsCt4
	w+VTYI7dJtFsuZGCSmeoiyAFnF1e4ec21MA0qMdjMIMOe8j1dYkFZLh4Y7ZGqohhIIp3
	rmIB80krKtWOHN/nM/r/CYM8ePGWXUatpkSClQ7fp/lQP5BlIs2CGi5qUkF/jxPXWSjm
	3tIqNGEovjBih6iL4r70+kAKkhcty1KFTEOaOeTyWavpIT37SB1LNr/0Tul/fVFLhS9X
	sDMQ==
X-Gm-Message-State: AElRT7GXDFFPBk6wyep6kp6h6PjVtnhshGIZmU5Fc5DnRXRljgepTEd9
	Rp0SOjlsA21rrltmNqGZVJ4UarTq0y8TU3ese9A=
X-Google-Smtp-Source: AG47ELsYp3NQ93kIS6diFsUIG+lUmFx22nEyTVKvKvuxYG0HD459XfGIz+MnZ1kBsUyjLLrnMrspLlcf4D5t4/hSL+4=
X-Received: by 10.31.226.198 with SMTP id z189mr18144330vkg.94.1522111404920; 
	Mon, 26 Mar 2018 17:43:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.80.217 with HTTP; Mon, 26 Mar 2018 17:43:24 -0700 (PDT)
In-Reply-To: <1522111237-1869-2-git-send-email-changhyeok.bae@gmail.com>
References: <1522111237-1869-1-git-send-email-changhyeok.bae@gmail.com>
	<1522111237-1869-2-git-send-email-changhyeok.bae@gmail.com>
From: Changhyeok Bae <changhyeok.bae@gmail.com>
Date: Tue, 27 Mar 2018 09:43:24 +0900
Message-ID: <CACrLJgC5swprby+aZKZC=9=BCMKLSOR37HLezhwCCmwK6dupLw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Armin Kuster <akuster@mvista.com>
Subject: Re: [PATCH 2/2] distcc: Change SRC_URI
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
X-List-Received-Date: Tue, 27 Mar 2018 00:43:24 -0000
Content-Type: multipart/alternative; boundary="001a114dffe899556005685a2dae"

--001a114dffe899556005685a2dae
Content-Type: text/plain; charset="UTF-8"

Sorry. Please ignore those 2 patches.

Thanks
Changhyeok

2018-03-27 9:40 GMT+09:00 Changhyeok Bae <changhyeok.bae@gmail.com>:

> From: Armin Kuster <akuster@mvista.com>
>
> ERROR: distcc-3.2-r0 do_fetch: Fetcher failure: Unable to find revision
> d8b18df3e9dcbe4f092bed565835d3975e99432c in branch 3.2 even from upstream
> ERROR: distcc-3.2-r0 do_fetch: Fetcher failure for URL: 'git://
> github.com/distcc/distcc.git;branch=3.2'. Unable to fetch URL from any
> source.
> ERROR: distcc-3.2-r0 do_fetch: Function failed: base_do_fetch
>
> [v2]
> upstream deleted the branch and the hash no longer exists.
>
> Took the git snapshot from yocto and created a copy on my github.
> There was no offical 3.2 release, only rc versions.
>
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-devtools/distcc/distcc_3.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/distcc/distcc_3.2.bb
> b/meta/recipes-devtools/distcc/distcc_3.2.bb
> index ea3d7c1..ff0e22f 100644
> --- a/meta/recipes-devtools/distcc/distcc_3.2.bb
> +++ b/meta/recipes-devtools/distcc/distcc_3.2.bb
> @@ -14,7 +14,7 @@ PACKAGECONFIG[popt] = "--without-included-popt,--
> with-included-popt,popt"
>
>  RRECOMMENDS_${PN} = "avahi-daemon"
>
> -SRC_URI = "git://github.com/distcc/distcc.git;branch=${PV} \
> +SRC_URI = "git://github.com/akuster/distcc.git;branch=${PV} \
>             file://separatebuilddir.patch \
>             file://0001-zeroconf-Include-fcntl.h.patch \
>             file://default \
> --
> 2.7.4
>
>


-- 
Thanks
Changhyeok

--001a114dffe899556005685a2dae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sorry. Please ignore those 2 patches.<div><br></div><div>T=
hanks</div><div>Changhyeok</div></div><div class=3D"gmail_extra"><br><div c=
lass=3D"gmail_quote">2018-03-27 9:40 GMT+09:00 Changhyeok Bae <span dir=3D"=
ltr">&lt;<a href=3D"mailto:changhyeok.bae@gmail.com" target=3D"_blank">chan=
ghyeok.bae@gmail.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From=
: Armin Kuster &lt;<a href=3D"mailto:akuster@mvista.com">akuster@mvista.com=
</a>&gt;<br>
<br>
ERROR: distcc-3.2-r0 do_fetch: Fetcher failure: Unable to find revision d8b=
18df3e9dcbe4f092bed565835d3<wbr>975e99432c in branch 3.2 even from upstream=
<br>
ERROR: distcc-3.2-r0 do_fetch: Fetcher failure for URL: &#39;git://<a href=
=3D"http://github.com/distcc/distcc.git;branch=3D3.2" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/distcc/<wbr>distcc.git;branch=3D3.2</a>&#39;. Un=
able to fetch URL from any source.<br>
ERROR: distcc-3.2-r0 do_fetch: Function failed: base_do_fetch<br>
<br>
[v2]<br>
upstream deleted the branch and the hash no longer exists.<br>
<br>
Took the git snapshot from yocto and created a copy on my github.<br>
There was no offical 3.2 release, only rc versions.<br>
<br>
Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster@mvista.com">akust=
er@mvista.com</a>&gt;<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ros=
s.burton@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/distcc/<a href=3D"http://distcc_3.2.bb" rel=3D"=
noreferrer" target=3D"_blank">d<wbr>istcc_3.2.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-devtools/<wbr>distcc/<a href=3D"http://distcc_3.2=
.bb" rel=3D"noreferrer" target=3D"_blank">distcc_3.2.bb</a> b/meta/recipes-=
devtools/<wbr>distcc/<a href=3D"http://distcc_3.2.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">distcc_3.2.bb</a><br>
index ea3d7c1..ff0e22f 100644<br>
--- a/meta/recipes-devtools/<wbr>distcc/<a href=3D"http://distcc_3.2.bb" re=
l=3D"noreferrer" target=3D"_blank">distcc_3.2.bb</a><br>
+++ b/meta/recipes-devtools/<wbr>distcc/<a href=3D"http://distcc_3.2.bb" re=
l=3D"noreferrer" target=3D"_blank">distcc_3.2.bb</a><br>
@@ -14,7 +14,7 @@ PACKAGECONFIG[popt] =3D &quot;--without-included-popt,--<=
wbr>with-included-popt,popt&quot;<br>
<br>
=C2=A0RRECOMMENDS_${PN} =3D &quot;avahi-daemon&quot;<br>
<br>
-SRC_URI =3D &quot;git://<a href=3D"http://github.com/distcc/distcc.git;bra=
nch=3D${PV}" rel=3D"noreferrer" target=3D"_blank">github.com/distcc/<wbr>di=
stcc.git;branch=3D${PV}</a> \<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/akuster/distcc.git;br=
anch=3D${PV}" rel=3D"noreferrer" target=3D"_blank">github.com/akuster/<wbr>=
distcc.git;branch=3D${PV}</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://separatebuilddir.patch \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-zeroconf-Include-<wbr=
>fcntl.h.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://default \<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div di=
r=3D"ltr">Thanks<div>Changhyeok</div></div></div>
</div>

--001a114dffe899556005685a2dae--
