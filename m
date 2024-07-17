Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EBFEC3DA4B
	for <webhook@archiver.kernel.org>; Wed, 17 Jul 2024 09:25:03 +0000 (UTC)
Subject: Re: [PATCH v2] python3: Drop generating a static libpython
To: openembedded-core@lists.openembedded.org
From: =?UTF-8?B?R3XDsG5pIE3DoXIgR2lsYmVydA==?= <gudni.m.g@gmail.com>
X-Originating-Location: Kopavogur, Capital Region, IS (81.15.100.92)
X-Originating-Platform: Windows Chrome 126
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 17 Jul 2024 02:25:02 -0700
References: <CANNYZj8ULdOa+-4zDFUWh5_moKeqndOJ+k7tUU9fMxHQDjR_oQ@mail.gmail.com>
In-Reply-To: <CANNYZj8ULdOa+-4zDFUWh5_moKeqndOJ+k7tUU9fMxHQDjR_oQ@mail.gmail.com>
Message-ID: <12754.1721208302159166149@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="VX5QVGFTpcP8d0grJB5b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jul 2024 09:25:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202149

--VX5QVGFTpcP8d0grJB5b
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 17, 2024 at 09:21 AM, Alexander Kanavin wrote:

>=20
> You are welcome to send such a backport, but it has to preserve
> existing behaviour by default.
>=20
> Alex

I see, then to backport this specific change we would need to add 'staticli=
bpython' to PACKAGECONFIG.

--VX5QVGFTpcP8d0grJB5b
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Wed, Jul 17, 2024 at 09:21 AM, Alexander Kanavin wrote:</div>
<div>
<blockquote>You are welcome to send such a backport, but it has to preserve=
<br />existing behaviour by default.<br /><br />Alex</blockquote>
</div>
<div>I see, then to backport this specific change we would need to add 'sta=
ticlibpython' to PACKAGECONFIG.</div>

--VX5QVGFTpcP8d0grJB5b--

