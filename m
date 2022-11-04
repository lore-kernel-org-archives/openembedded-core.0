Return-Path: <egyszeregy@freemail.hu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0763BC433FE
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 17:08:52 +0000 (UTC)
Subject: Re: How to use linux-firmware to install single firmware package? #kirkstone
To: openembedded-core@lists.openembedded.org
From: "Livius" <egyszeregy@freemail.hu>
X-Originating-Location: Stuttgart, Baden-Württemberg, DE (194.39.218.10)
X-Originating-Platform: Windows Chrome 107
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 04 Nov 2022 10:08:44 -0700
References: <d682bdd7-ba1f-8708-fb64-6ae29b2ac074@theobroma-systems.com>
In-Reply-To: <d682bdd7-ba1f-8708-fb64-6ae29b2ac074@theobroma-systems.com>
Message-ID: <27593.1667581724503766480@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="e15BnHgux7THZ1wWjplz"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Nov 2022 17:08:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172725

--e15BnHgux7THZ1wWjplz
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I have a linux-firmware_%.bbappend ( https://github.com/Freescale/meta-free=
scale-3rdparty/blob/kirkstone/recipes-kernel/linux-firmware/linux-firmware_=
%25.bbappend ) from meta-freescale-3rdparty layer. I think, it is too simpl=
e, it can not cause the problem. In my local.conf I set up to generate buil=
dhistory (i used the following commands), soon my next image build is ready=
 an i can share the results.

INHERIT +=3D "buildhistory"
BUILDHISTORY_COMMIT =3D "0"

--e15BnHgux7THZ1wWjplz
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>I have a <a href=3D"https://github.com/Freescale/meta-freescale-3rdpar=
ty/blob/kirkstone/recipes-kernel/linux-firmware/linux-firmware_%25.bbappend=
" target=3D"_blank" rel=3D"noopener">linux-firmware_%.bbappend</a> from met=
a-freescale-3rdparty layer. I think, it is too simple, it can not cause the=
 problem. In my local.conf I set up to generate buildhistory (i used the fo=
llowing commands), soon my next image build is ready an i can share the res=
ults.</div>
<div>&nbsp;</div>
<div>INHERIT +=3D "buildhistory"</div>
<div>BUILDHISTORY_COMMIT =3D "0"</div>

--e15BnHgux7THZ1wWjplz--

