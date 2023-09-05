Return-Path: <tom.hochstein@nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94E6ECA0FFB
	for <webhook@archiver.kernel.org>; Tue,  5 Sep 2023 17:41:54 +0000 (UTC)
Subject: Re: [PATCH] linux-firmware: add firmware files for NXP BT chipsets
To: openembedded-core@lists.openembedded.org
From: "Tom Hochstein" <tom.hochstein@nxp.com>
X-Originating-Location: Texas, US (165.225.33.115)
X-Originating-Platform: Windows Chrome 116
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 05 Sep 2023 10:41:48 -0700
References: <29102.1693310912640920508@lists.openembedded.org>
In-Reply-To: <29102.1693310912640920508@lists.openembedded.org>
Message-ID: <24144.1693935708896928880@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="zdiK9B63UCTv1cTUbik7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Sep 2023 17:41:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187250

--zdiK9B63UCTv1cTUbik7
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 29, 2023 at 05:08 AM, Tom Hochstein wrote:

>=20
> On Fri, Aug 25, 2023 at 07:37 AM, Tom Hochstein wrote:
>=20
>> Please hold off on this. The -common design is not working correctly and
>> is causing those firmware packages to be registered as a runtime
>> dependency of the main package.
>=20
>=20
>=20
> Actually, the -common design is working fine, there was just a
> misunderstanding.
>=20
> Please do consider this patch as-is.
>=20
> Tom
>=20
>=20
>=20

Ping

--zdiK9B63UCTv1cTUbik7
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 29, 2023 at 05:08 AM, Tom Hochstein wrote:<br />
<blockquote>
<div id=3D"msgbody226882707">
<div class=3D"forcebreak" dir=3D"auto">On Fri, Aug 25, 2023 at 07:37 AM, To=
m Hochstein wrote:<br />
<blockquote>Please hold off on this. The -common design is not working corr=
ectly and is causing those firmware packages to be registered as a runtime =
dependency of the main package.</blockquote>
<p class=3D"DefangedMsoNormal">Actually, the -common design is working fine=
, there was just a misunderstanding.<br /><br />Please do consider this pat=
ch as-is.<br /><br />Tom</p>
</div>
</div>
</blockquote>
Ping

--zdiK9B63UCTv1cTUbik7--

