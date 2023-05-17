Return-Path: <florin.diaconescu009@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8C8AC77B75
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 08:32:08 +0000 (UTC)
Subject: Re: [PATCH] ncurses: change GitHub mirror
To: openembedded-core@lists.openembedded.org
From: "Florin Diaconescu" <florin.diaconescu009@gmail.com>
X-Originating-Location: Voluntari, Ilfov, RO (92.87.113.28)
X-Originating-Platform: Windows Firefox 112
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 17 May 2023 01:32:06 -0700
References: <CANNYZj9UPH2R1y36BdmbkOpSVNCdzEQXdS_aoO3Yfjj7RXVuyw@mail.gmail.com>
In-Reply-To: <CANNYZj9UPH2R1y36BdmbkOpSVNCdzEQXdS_aoO3Yfjj7RXVuyw@mail.gmail.com>
Message-ID: <22909.1684312326470689785@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="edna4SdqzyEoGjucZPI4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 08:32:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181475

--edna4SdqzyEoGjucZPI4
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

This was done in a similar way to this commit, when the change was made fro=
m Debian packaging to GitHub's mirror:

https://git.yoctoproject.org/p oky/commit/meta/recipes-core/n curses?id=3Dd=
faabf971b02e33870f9 f927e9b1356e05e74a17 ( https://git.yoctoproject.org/pok=
y/commit/meta/recipes-core/ncurses?id=3Ddfaabf971b02e33870f9f927e9b1356e05e=
74a17 )
If I only change the SRC_URI, then it won't find the original 79b9071f2be20=
a24c7be031655a5638f6032f29f revision.

1003914e200fd622a27237abca155ce6bf2e6030 is the commit hash of the 6.4 rele=
ase tag:
https://github.com/ThomasDicke y/ncurses-snapshots/releases/ tag/v6_4 ( htt=
ps://github.com/ThomasDickey/ncurses-snapshots/releases/tag/v6_4 )

Florin

--edna4SdqzyEoGjucZPI4
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

This was done in a similar way to this commit, when the change was made fro=
m Debian packaging to GitHub's mirror:<br /><br /><a href=3D"https://git.yo=
ctoproject.org/poky/commit/meta/recipes-core/ncurses?id=3Ddfaabf971b02e3387=
0f9f927e9b1356e05e74a17" target=3D"_blank" rel=3D"noopener noreferrer" data=
-saferedirecturl=3D"https://www.google.com/url?q=3Dhttps://git.yoctoproject=
.org/poky/commit/meta/recipes-core/ncurses?id%3Ddfaabf971b02e33870f9f927e9b=
1356e05e74a17&amp;source=3Dgmail&amp;ust=3D1684398668406000&amp;usg=3DAOvVa=
w1xIsN8f6MzprkajP4I27nz">https://git.yoctoproject.org/p<wbr />oky/commit/me=
ta/recipes-core/n<wbr />curses?id=3Ddfaabf971b02e33870f9<wbr />f927e9b1356e=
05e74a17</a><br />If I only change the SRC_URI, then it won't find the orig=
inal 79b9071f2be20a24c7be031655a5638f6032f29f revision.<br /><br />1003914e=
200fd622a27237abca155ce6bf2e6030 is the commit hash of the 6.4 release tag:
<div id=3D":1bg" class=3D"a3s aiL "><a href=3D"https://github.com/ThomasDic=
key/ncurses-snapshots/releases/tag/v6_4" target=3D"_blank" rel=3D"noopener =
noreferrer" data-saferedirecturl=3D"https://www.google.com/url?q=3Dhttps://=
github.com/ThomasDickey/ncurses-snapshots/releases/tag/v6_4&amp;source=3Dgm=
ail&amp;ust=3D1684398668406000&amp;usg=3DAOvVaw2-Ql9fUkcLLNGHAHoePnq1">http=
s://github.com/ThomasDicke<wbr />y/ncurses-snapshots/releases/<wbr />tag/v6=
_4</a><br /><br />Florin</div>

--edna4SdqzyEoGjucZPI4--

