Return-Path: <chris.sutton@l3harris.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 280F1C001B0
	for <webhook@archiver.kernel.org>; Mon, 24 Jul 2023 11:38:01 +0000 (UTC)
Subject: eSDK is missing native cross-compiler toolchain and compiled target libs
To: openembedded-core@lists.openembedded.org
From: "Sutton, Chris (FP) - IC" <chris.sutton@l3harris.com>
X-Originating-Location: London, England, GB (35.242.171.215)
X-Originating-Platform: Windows Chrome 114
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 24 Jul 2023 04:38:00 -0700
Message-ID: <KF92.1690198680497382322.XSbE@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="zWd0eUa073THmeMAjbw0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jul 2023 11:38:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184784

--zWd0eUa073THmeMAjbw0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi

I=E2=80=99ve built the eSDK for poky honister. However, it DOES NOT contain=
 the cross-compiler toolchain/compiled target libs.

I build the standard SDK and it DOES contain the cross-compiler toolchain/c=
ompiled target libs but of course has no built-in QEMU.

I am confused by this. I thought the eSDK came with a toolchain, but it see=
ms not.

I need both the cross-compiler toolchain/compiled target libs and QEMU.

How can I include the cross-compiler toolchain/compiled target libs in the =
eSDK build?

--zWd0eUa073THmeMAjbw0
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">Hi</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">I=E2=80=99ve built the=
 eSDK for poky honister. However, it DOES NOT contain the cross-compiler to=
olchain/compiled target libs.</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">I build the standard S=
DK and it DOES contain the cross-compiler toolchain/compiled target libs bu=
t of course has no built-in QEMU.</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">I am confused by this.=
 I thought the eSDK came with a toolchain, but it seems not.</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">=C2=A0</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">I need both the cross-=
compiler toolchain/compiled target libs and QEMU.</p>
<p class=3D"DefangedMsoNormal" style=3D"margin:0px;">How can I include the =
cross-compiler toolchain/compiled target libs in the eSDK build?</p>

--zWd0eUa073THmeMAjbw0--

