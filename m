Return-Path: <florin.diaconescu009@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACFAAC77B75
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 08:33:18 +0000 (UTC)
Subject: Re: [PATCH] ncurses: Update 6.4 -> 6.4+20230514
To: openembedded-core@lists.openembedded.org
From: "Florin Diaconescu" <florin.diaconescu009@gmail.com>
X-Originating-Location: Voluntari, Ilfov, RO (92.87.113.28)
X-Originating-Platform: Windows Firefox 112
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 17 May 2023 01:33:14 -0700
References: <CANNYZj8T+P=QYHEaKufnEg+eza7Mee3h01f7x0Toyky_8OUT9g@mail.gmail.com>
In-Reply-To: <CANNYZj8T+P=QYHEaKufnEg+eza7Mee3h01f7x0Toyky_8OUT9g@mail.gmail.com>
Message-ID: <22447.1684312394039938972@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="DqKf3HyR26BmB94kJyRV"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 08:33:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181476

--DqKf3HyR26BmB94kJyRV
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

What's the reasoning behind updating ncurses from 6.3 to 6.3+20220423 in Ki=
rkstone, then?
https://git.yoctoproject.org/poky/commit/meta/recipes-core/ncurses?h=3Dkirk=
stone&id=3De13ce12e4ad79100bd45c751203040ce2a6f1920

Looks like they updated for fixing a CVE as well, and they did not backport=
 the patch on top of 6.3.
"CVE: CVE-2022-29458"

Florin

--DqKf3HyR26BmB94kJyRV
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

What's the reasoning behind updating ncurses from 6.3 to 6.3+20220423 in Ki=
rkstone, then?<br /><a href=3D"https://git.yoctoproject.org/poky/commit/met=
a/recipes-core/ncurses?h=3Dkirkstone&amp;id=3De13ce12e4ad79100bd45c75120304=
0ce2a6f1920" target=3D"_blank" rel=3D"noopener">https://git.yoctoproject.or=
g/poky/commit/meta/recipes-core/ncurses?h=3Dkirkstone&amp;id=3De13ce12e4ad7=
9100bd45c751203040ce2a6f1920</a><br /><br />Looks like they updated for fix=
ing a CVE as well, and they did not backport the patch on top of 6.3.<br />=
"CVE: CVE-2022-29458"<br /><br />Florin

--DqKf3HyR26BmB94kJyRV--

