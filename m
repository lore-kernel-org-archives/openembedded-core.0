Subject: Re: [PATCH 06/11] ovmf: upgrade edk2-stable202605 -> edk2-stable202611
To: openembedded-core@lists.openembedded.org
From: "Jaipaul Cheernam" <jaipaul.cheernam@est.tech>
X-Originating-Location: Uppsala, Uppsala County, SE (83.190.82.21)
X-Originating-Platform: Mac Firefox 160
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 26 Nov 2026 03:34:14 -0800
References: <20261124171807.74394-1-jaipaul.cheernam@est.tech> <20261124171807.74394-7-jaipaul.cheernam@est.tech>
In-Reply-To: <20261124171807.74394-7-jaipaul.cheernam@est.tech>
Message-ID: <1281564.1795692854389261236@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="CIsNOMBgLLfFzwDIufUT"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 11:34:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251292

--CIsNOMBgLLfFzwDIufUT
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Richard/Ross,

After patch review meeting, I checked my local branch and patch=C2=A0 looks=
 okay and same in patchwork also.
Looks like the patch we reviewed in oe-core-contrib master-next is broken f=
or this commit as its missed "0005-CryptoPkg-IntrinsicLib-fix-memcpy-alias-=
prototype-fo.patch" , I noticed its missing from Mathieu's branch also.

Complete change is present in here but somehow missed on those branches .

Can you take patch from here https://lists.openembedded.org/g/openembedded-=
core/message/251058 or https://patchwork.yoctoproject.org/project/oe-core/p=
atch/20261124171807.74394-7-jaipaul.cheernam@est.tech/

Regards,
Jaipaul

--CIsNOMBgLLfFzwDIufUT
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi Richard/Ross,&nbsp;</div>
<div><br />After patch review meeting, I checked my local branch and patch&=
nbsp; looks okay and same in patchwork also.&nbsp;</div>
<div>Looks like the patch we reviewed in oe-core-contrib master-next is bro=
ken for this commit as its missed "0005-CryptoPkg-IntrinsicLib-fix-memcpy-a=
lias-prototype-fo.patch" , I noticed its missing from Mathieu's branch also=
.&nbsp;</div>
<div><br />Complete change is present in here but somehow missed on those b=
ranches .&nbsp;</div>
<div><br />Can you take patch from here <a href=3D"https://lists.openembedd=
ed.org/g/openembedded-core/message/251058" target=3D"_blank" rel=3D"noopene=
r">https://lists.openembedded.org/g/openembedded-core/message/251058</a> or=
 <a href=3D"https://patchwork.yoctoproject.org/project/oe-core/patch/202611=
24171807.74394-7-jaipaul.cheernam@est.tech/" target=3D"_blank" rel=3D"noope=
ner">https://patchwork.yoctoproject.org/project/oe-core/patch/2026112417180=
7.74394-7-jaipaul.cheernam@est.tech/</a>&nbsp;</div>
<div>&nbsp;</div>
<div>Regards,</div>
<div>Jaipaul</div>

--CIsNOMBgLLfFzwDIufUT--
