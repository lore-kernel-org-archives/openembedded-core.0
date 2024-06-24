Return-Path: <gudnimar@noxmedical.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E661C2D0D1
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 13:15:42 +0000 (UTC)
Subject: Re: [PATCH] python3-setuptools: drop python3-2to3 from RDEPENDS
To: openembedded-core@lists.openembedded.org
From: =?UTF-8?B?R3XDsG5pIE3DoXIgR2lsYmVydA==?= <gudnimar@noxmedical.com>
X-Originating-Location: Kopavogur, Capital Region, IS (81.15.100.92)
X-Originating-Platform: Windows Chrome 126
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 24 Jun 2024 06:15:31 -0700
References: <5AC01807-D515-4C5E-9602-DFBFE3C61CC3@arm.com>
In-Reply-To: <5AC01807-D515-4C5E-9602-DFBFE3C61CC3@arm.com>
Message-ID: <6942.1719234931976014510@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="qSs2CEKEwnbSKIljMqCU"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 13:15:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201086

--qSs2CEKEwnbSKIljMqCU
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 10:59 AM, Ross Burton wrote:

>=20
> As you=E2=80=99ve a vested interest here, will you be able to produce a p=
atch?

I can try, it's not very high priority for me but should be doable within 2=
 weeks given I don't see any unexpected problems :) In my mind adding tools=
 to PACKAGES and creating FILES:${PN}-tools should do the trick (And perhap=
s a separate RDEPENDS for tools package).

--qSs2CEKEwnbSKIljMqCU
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 10:59 AM, Ross Burton wrote:<br />
<blockquote>As you&rsquo;ve a vested interest here, will you be able to pro=
duce a patch?</blockquote>
I can try, it's not very high priority for me but should be doable within 2=
 weeks given I don't see any unexpected problems :) In my mind adding <em>t=
ools</em> to <em>PACKAGES</em> and creating <em>FILES:${PN}-tools</em> shou=
ld do the trick (And perhaps a separate <em>RDEPENDS</em> for tools package=
).

--qSs2CEKEwnbSKIljMqCU--

