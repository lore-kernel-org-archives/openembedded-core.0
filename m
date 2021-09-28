Return-Path: <oobitots@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 230C9C433F5
	for <webhook@archiver.kernel.org>; Tue, 28 Sep 2021 14:40:44 +0000 (UTC)
Subject: Re: [PATCH] recipes-support/ptest-runner: Bump to v2.4.2
To: openembedded-core@lists.openembedded.org
From: "Oleksiy Obitotskyy" <oobitots@cisco.com>
X-Originating-Location: Lviv Oblast, UA (46.211.67.53)
X-Originating-Platform: Linux Firefox 92
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 28 Sep 2021 07:40:43 -0700
References: <20210927185846.70202-1-anibal.limon@linaro.org>
In-Reply-To: <20210927185846.70202-1-anibal.limon@linaro.org>
Message-ID: <24379.1632840043418249566@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="ycvU8mB32tVlHCWbiEUQ"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Sep 2021 14:40:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156421

--ycvU8mB32tVlHCWbiEUQ
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Patch applied with warnings.
https://autobuilder.yoctoproject.org/typhoon/#/builders/120/builds/270
https://autobuilder.yoctoproject.org/typhoon/#/builders/120/builds/269

WARNING: ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0 do_patch: Fuzz detecte=
d:

Applying patch 0007-WIP-Initial-LAVA-support.patch
patching file flags.h
patching file main.c
Hunk #2 succeeded at 131 (offset 20 lines).
Hunk #3 succeeded at 158 (offset 20 lines).
patching file utils.c
Hunk #1 succeeded at 49 with fuzz 1.
Hunk #2 succeeded at 484 (offset 12 lines).
Hunk #3 succeeded at 527 (offset 13 lines).
Hunk #4 succeeded at 553 with fuzz 2 (offset 13 lines).
patching file utils.h
Hunk #1 succeeded at 42 with fuzz 1 (offset 1 line).

--ycvU8mB32tVlHCWbiEUQ
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,<br /><br />Patch applied with warnings.<br /><a href=3D"https://autobui=
lder.yoctoproject.org/typhoon/#/builders/120/builds/270" target=3D"_blank" =
rel=3D"noopener">https://autobuilder.yoctoproject.org/typhoon/#/builders/12=
0/builds/270</a><br /><a href=3D"https://autobuilder.yoctoproject.org/typho=
on/#/builders/120/builds/269" target=3D"_blank" rel=3D"noopener">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/120/builds/269</a><br /><br /=
>WARNING: ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0 do_patch: Fuzz detect=
ed:<br /><br />Applying patch 0007-WIP-Initial-LAVA-support.patch<br />patc=
hing file flags.h<br />patching file main.c<br />Hunk #2 succeeded at 131 (=
offset 20 lines).<br />Hunk #3 succeeded at 158 (offset 20 lines).<br />pat=
ching file utils.c<br />Hunk #1 succeeded at 49 with fuzz 1.<br />Hunk #2 s=
ucceeded at 484 (offset 12 lines).<br />Hunk #3 succeeded at 527 (offset 13=
 lines).<br />Hunk #4 succeeded at 553 with fuzz 2 (offset 13 lines).<br />=
patching file utils.h<br />Hunk #1 succeeded at 42 with fuzz 1 (offset 1 li=
ne).

--ycvU8mB32tVlHCWbiEUQ--

