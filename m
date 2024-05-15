Return-Path: <simit.ghane@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B1F9C25B75
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 10:59:01 +0000 (UTC)
Subject: Re: [PATCHv1] Fix building error with '-O2' in sysroot path
To: openembedded-core@lists.openembedded.org
From: "simit.ghane" <simit.ghane@lge.com>
X-Originating-Location: IN (203.247.149.152)
X-Originating-Platform: Windows Chrome 124
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 15 May 2024 03:58:56 -0700
References: <8A9AEBAD-9B6B-41AC-8FBA-C93D3858E94F@arm.com>
In-Reply-To: <8A9AEBAD-9B6B-41AC-8FBA-C93D3858E94F@arm.com>
Message-ID: <19808.1715770736688552866@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="NxdynALTj54ZEO3BxaAw"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 10:59:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199276

--NxdynALTj54ZEO3BxaAw
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Sorry for late reply.

It is difficult to control -O1 for cipher and -O0 for random at the same ti=
me in OE environment along with patch file.
so keeping same change as it is.

--NxdynALTj54ZEO3BxaAw
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Sorry for late reply.<br /><br />It is difficult to control -O1 for cipher =
and -O0 for random at the same time in OE environment along with patch file=
.<br />so keeping same change as it is.

--NxdynALTj54ZEO3BxaAw--

