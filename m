Return-Path: <florin.diaconescu009@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD090C7EE23
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 08:46:08 +0000 (UTC)
Subject: Re: [PATCH] ncurses: Update 6.4 -> 6.4+20230514
To: openembedded-core@lists.openembedded.org
From: "Florin Diaconescu" <florin.diaconescu009@gmail.com>
X-Originating-Location: Voluntari, Ilfov, RO (92.87.113.28)
X-Originating-Platform: Windows Firefox 112
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 17 May 2023 01:46:04 -0700
References: <CANNYZj8VfMO+15hTGtxEXK7uFZb+3_hP_fh9yoE_kD5RL0weTQ@mail.gmail.com>
In-Reply-To: <CANNYZj8VfMO+15hTGtxEXK7uFZb+3_hP_fh9yoE_kD5RL0weTQ@mail.gmail.com>
Message-ID: <22909.1684313164897477681@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="YHjYBjqLh5qSa7FyoWvz"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 08:46:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181480

--YHjYBjqLh5qSa7FyoWvz
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

What about this, then? Looks like it is commited by you:
http://cgit.openembedded.org/openembedded-core/commit/meta/recipes-core/ncu=
rses?h=3Dkirkstone&id=3D325fe5f68bc698f78f5c1a14407c0bbb4cba45f7
Indeed, you were updating from a development snapshot to another developmen=
t snapshot, but judging by the history of this recipe I thought that this w=
as always the case.
http://cgit.openembedded.org/openembedded-core/commit/meta/recipes-core/ncu=
rses?h=3Dkirkstone&id=3Dfdb2a95d5e0265de1172940b6dc71fc7d602e8d1

If the standard policy is that, maybe the CVE_VERSION line should also be r=
emoved.

--YHjYBjqLh5qSa7FyoWvz
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

What about this, then? Looks like it is commited by you:<br /><a href=3D"ht=
tp://cgit.openembedded.org/openembedded-core/commit/meta/recipes-core/ncurs=
es?h=3Dkirkstone&amp;id=3D325fe5f68bc698f78f5c1a14407c0bbb4cba45f7" target=
=3D"_blank" rel=3D"noopener">http://cgit.openembedded.org/openembedded-core=
/commit/meta/recipes-core/ncurses?h=3Dkirkstone&amp;id=3D325fe5f68bc698f78f=
5c1a14407c0bbb4cba45f7</a><br />Indeed, you were updating from a developmen=
t snapshot to another development snapshot, but judging by the history of t=
his recipe I thought that this was always the case.<br /><a href=3D"http://=
cgit.openembedded.org/openembedded-core/commit/meta/recipes-core/ncurses?h=
=3Dkirkstone&amp;id=3Dfdb2a95d5e0265de1172940b6dc71fc7d602e8d1" target=3D"_=
blank" rel=3D"noopener">http://cgit.openembedded.org/openembedded-core/comm=
it/meta/recipes-core/ncurses?h=3Dkirkstone&amp;id=3Dfdb2a95d5e0265de1172940=
b6dc71fc7d602e8d1</a><br /><br />If the standard policy is that, maybe the =
CVE_VERSION line should also be removed.

--YHjYBjqLh5qSa7FyoWvz--

