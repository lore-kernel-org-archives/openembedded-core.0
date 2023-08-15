Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 736D6C001B0
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 13:38:42 +0000 (UTC)
Subject: Re: [kirkstone][PATCH] libxcrypt: fixup upgrade 4.4.30 -> 4.4.33
To: openembedded-core@lists.openembedded.org
From: "Adrian Freihofer" <adrian.freihofer@gmail.com>
X-Originating-Location: CH (165.225.94.221)
X-Originating-Platform: Linux Firefox 116
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 15 Aug 2023 06:38:36 -0700
References: <20230815130928.983960-1-adrian.freihofer@siemens.com>
In-Reply-To: <20230815130928.983960-1-adrian.freihofer@siemens.com>
Message-ID: <19617.1692106716967518808@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="Glo5bhDlw149nlXqAQ8H"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 13:38:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186066

--Glo5bhDlw149nlXqAQ8H
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Steven

Just realized that this patch is a duplicate of commit 2061f9f15a7f8ad06841=
d8e0bac9a4a298932564 from master branch.
Maybe the best would be to cherry-pick 2061f9f15a7f8ad06841d8e0bac9a4a29893=
2564 to kirkstone and ignore this patch here.

Regards,
Adrian

--Glo5bhDlw149nlXqAQ8H
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Steven<br /><br />Just realized that this patch is a duplicate of commit=
 2061f9f15a7f8ad06841d8e0bac9a4a298932564 from master branch.<br />Maybe th=
e best would be to cherry-pick 2061f9f15a7f8ad06841d8e0bac9a4a298932564 to =
kirkstone and ignore this patch here.<br /><br />Regards,<br />Adrian

--Glo5bhDlw149nlXqAQ8H--

