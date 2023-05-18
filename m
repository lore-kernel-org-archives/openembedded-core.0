Return-Path: <qiutt@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BBEAC77B7A
	for <webhook@archiver.kernel.org>; Thu, 18 May 2023 01:54:24 +0000 (UTC)
Subject: Re: [PATCH V2] Fix error SRCDIR when using usrmerge DISTRO_FEATURES
To: openembedded-core@lists.openembedded.org
From: "qiutt@fujitsu.com" <qiutt@fujitsu.com>
X-Originating-Location: CN (223.111.68.150)
X-Originating-Platform: Windows Chrome 113
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 17 May 2023 18:54:19 -0700
References: <41276F5A-2CEE-467F-A36C-9497847C8217@arm.com>
In-Reply-To: <41276F5A-2CEE-467F-A36C-9497847C8217@arm.com>
Message-ID: <16418.1684374859634541224@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="Ut7Ra2Z4SSXqw1KCqxF2"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 May 2023 01:54:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181505

--Ut7Ra2Z4SSXqw1KCqxF2
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, Ross

>=20
> First, please use the commit message convention: the shortlog should star=
t
> with "e2fsprogs:=E2=80=9D.
>=20

>=20
> Also, this broken part of the Makefile is a rule that *we patch in* (see
> ptest.patch), so simply fix that patch instead of working around it in
> with a sed.
>=20

Please review "[PATCH V3] e2fsprogs: Fix error SRCDIR when using usrmerge D=
ISTRO_FEATURES".
Thanks.

Best regards,
Qiu Tingting

--Ut7Ra2Z4SSXqw1KCqxF2
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, Ross<br />
<blockquote><span style=3D"white-space: pre-wrap;">First, please use the co=
mmit message convention: the shortlog should start with "e2fsprogs:&rdquo;.=
<br /></span></blockquote>
<br />
<blockquote><span style=3D"white-space: pre-wrap;"></span><span style=3D"wh=
ite-space: pre-wrap;">Also, this broken part of the Makefile is a rule that=
 *we patch in* (see ptest.patch), so simply fix that patch instead of worki=
ng around it in with a sed.<br /></span></blockquote>
<br />Please review "[PATCH V3] e2fsprogs: Fix error SRCDIR when using usrm=
erge DISTRO_FEATURES".<br />Thanks.<br /><br />Best regards,<br />Qiu Tingt=
ing

--Ut7Ra2Z4SSXqw1KCqxF2--

