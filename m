Return-Path: <jakub.szczudlo@nokia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAB1ECA9ED0
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 10:16:37 +0000 (UTC)
Subject: Re: [wrynose][PATCH] libarchive: fix CVE-2026-15028
To: openembedded-core@lists.openembedded.org
From: "Jakub Szczudlo" <jakub.szczudlo@nokia.com>
X-Originating-Location: Warsaw, Mazovia, PL (147.161.248.246)
X-Originating-Platform: Windows Firefox 140
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 12 Oct 2026 03:16:29 -0700
References: <20261002110211.11669-1-jakub.szczudlo@nokia.com> <DM0OFC89C3EH.CCKMED8WYWDC@smile.fr> <1823924.1791788633257107744@lists.openembedded.org>
In-Reply-To: <1823924.1791788633257107744@lists.openembedded.org>
Message-ID: <1823924.1791800189463127023@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="qEQJRXZfiy0yq2Cn0Wib"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 10:16:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247622

--qEQJRXZfiy0yq2Cn0Wib
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,
I spend some time today checking it and it seems that this CVE was fixed in=
 3.8.9 by cherry-pick:
https://github.com/libarchive/libarchive/commit/22ffe8e8e459970f3bc86b02674=
93fc4aa8249b8
What should I do on a master then?

Best regards,
Jakub Szczudlo

--qEQJRXZfiy0yq2Cn0Wib
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi,<br />I spend some time today checking it and it seems that this CV=
E was fixed in 3.8.9 by cherry-pick:<br />https://github.com/libarchive/lib=
archive/commit/22ffe8e8e459970f3bc86b0267493fc4aa8249b8<br />What should I =
do on a master then?<br /><br />Best regards,<br />Jakub Szczudlo</div>

--qEQJRXZfiy0yq2Cn0Wib--

