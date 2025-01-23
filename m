Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 567AEC02182
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 17:17:52 +0000 (UTC)
Subject: Re: [PATCH v2 7/9] gcc-configure-common.inc: add multlib support for i686/i586/x86_64 nativesdk gcc
To: openembedded-core@lists.openembedded.org
From: "hongxu" <hongxu.jia@eng.windriver.com>
X-Originating-Location: US (147.11.105.171)
X-Originating-Platform: Linux Firefox 134
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 23 Jan 2025 09:17:49 -0800
References: <20250123045339.2443875-1-hongxu.jia@windriver.com>
In-Reply-To: <20250123045339.2443875-1-hongxu.jia@windriver.com>
Message-ID: <16166.1737652669267400613@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="GWSZJwTU2zzutCNt2ymp"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 17:17:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210201

--GWSZJwTU2zzutCNt2ymp
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The series is available in https://git.openembedded.org/openembedded-core-c=
ontrib/log/?h=3Dmathieu/master-next

selftest/multiconfig: test multiconfig multlib nativesdk gccmathieu/master-=
next =C2=A0 =C2=A0Hongxu Jia
nativesdk-multiconfig-multlib-toolchain-packager: add recipe =C2=A0 =C2=A0H=
ongxu Jia
gcc-configure-common.inc: add multlib support for i686/i586/x86_64 nativesd=
k gcc =C2=A0 =C2=A0Hongxu Jia
meta/conf/bitbake.conf: support multiarch for nativesdk =C2=A0 =C2=A0Hongxu=
 Jia
libgcc-common: apply multilib symlinks for nativesdk libgcc =C2=A0 =C2=A0Ho=
ngxu Jia
script/relocate_sdk.py: check dynamic loader arch before relocating interpr=
eter =C2=A0 =C2=A0Hongxu Jia
toolchain-shar-relocate.sh: support multiple dynamic loaders for multilib =
=C2=A0 =C2=A0Hongxu Jia
multilib_header.bbclass: need multilib headers for nativesdk builds =C2=A0 =
=C2=A0Hongxu Jia
perl: fix do_install failed for nativesdk-perl =C2=A0 =C2=A0Hongxu Jia

//Hongxu

--GWSZJwTU2zzutCNt2ymp
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>The series is available in <a href=3D"https://git.openembedded.org/ope=
nembedded-core-contrib/log/?h=3Dmathieu/master-next" target=3D"_blank" rel=
=3D"noopener">https://git.openembedded.org/openembedded-core-contrib/log/?h=
=3Dmathieu/master-next</a></div>
<div>&nbsp;</div>
<div>selftest/multiconfig: test multiconfig multlib nativesdk gccmathieu/ma=
ster-next &nbsp; &nbsp;Hongxu Jia<br />nativesdk-multiconfig-multlib-toolch=
ain-packager: add recipe &nbsp; &nbsp;Hongxu Jia<br />gcc-configure-common.=
inc: add multlib support for i686/i586/x86_64 nativesdk gcc &nbsp; &nbsp;Ho=
ngxu Jia<br />meta/conf/bitbake.conf: support multiarch for nativesdk &nbsp=
; &nbsp;Hongxu Jia<br />libgcc-common: apply multilib symlinks for nativesd=
k libgcc &nbsp; &nbsp;Hongxu Jia<br />script/relocate_sdk.py: check dynamic=
 loader arch before relocating interpreter &nbsp; &nbsp;Hongxu Jia<br />too=
lchain-shar-relocate.sh: support multiple dynamic loaders for multilib &nbs=
p; &nbsp;Hongxu Jia<br />multilib_header.bbclass: need multilib headers for=
 nativesdk builds &nbsp; &nbsp;Hongxu Jia<br />perl: fix do_install failed =
for nativesdk-perl &nbsp; &nbsp;Hongxu Jia</div>
<div>&nbsp;</div>
<div>//Hongxu</div>

--GWSZJwTU2zzutCNt2ymp--

