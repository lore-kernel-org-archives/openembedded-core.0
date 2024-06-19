Return-Path: <gudnimar@noxmedical.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DF48C27C53
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 17:06:55 +0000 (UTC)
Subject: Re: [PATCH] python3-setuptools: drop python3-2to3 from RDEPENDS
To: openembedded-core@lists.openembedded.org
From: =?UTF-8?B?R3XDsG5pIE3DoXIgR2lsYmVydA==?= <gudnimar@noxmedical.com>
X-Originating-Location: Kopavogur, Capital Region, IS (81.15.100.92)
X-Originating-Platform: Windows Chrome 126
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 19 Jun 2024 10:06:48 -0700
References: <20240619170307.4351-1-gudni.m.g@gmail.com>
In-Reply-To: <20240619170307.4351-1-gudni.m.g@gmail.com>
Message-ID: <6942.1718816808373956647@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="hoijM7HpFyIVCInR4efz"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 17:06:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200927

--hoijM7HpFyIVCInR4efz
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Noticed this when trying to optimize my minimal image. I would love to see =
this in Scarthgap as well if the patch is accepted.

This change saves ~600KiB according to buildhistory output (given no other =
recipe is asking for python3-2to3).

--hoijM7HpFyIVCInR4efz
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Noticed this when trying to optimize my minimal image. I would love to see =
this in Scarthgap as well if the patch is accepted.<br /><br />This change =
saves ~600KiB according to buildhistory output (given no other recipe is as=
king for python3-2to3).

--hoijM7HpFyIVCInR4efz--

