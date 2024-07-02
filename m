Return-Path: <egyszeregy@freemail.hu>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF054C30658
	for <webhook@archiver.kernel.org>; Tue,  2 Jul 2024 21:28:21 +0000 (UTC)
Subject: Re: mc: broken source link
To: openembedded-core@lists.openembedded.org
From: "Livius" <egyszeregy@freemail.hu>
X-Originating-Location: Budapest, HU (80.98.74.198)
X-Originating-Platform: Windows Chrome 126
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 02 Jul 2024 14:28:19 -0700
References: <CANNYZj_dpbyeJ1_gq2qziTuf6XuGHA5tBJfs=ukMq28uJdXbcA@mail.gmail.com>
In-Reply-To: <CANNYZj_dpbyeJ1_gq2qziTuf6XuGHA5tBJfs=ukMq28uJdXbcA@mail.gmail.com>
Message-ID: <28357.1719955699818752317@lists.openembedded.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jul 2024 21:28:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201443

In last weeks source URL was broken for mc. Now, it is forwarded for a new =
link, only.

http://www.midnight-commander.org/downloads/mc-4.8.31.tar.bz2
forwarded to:
http://ftp.midnight-commander.org/mc-4.8.31.tar.bz2

So it seems to me, mc has a new home for sources.
http://ftp.midnight-commander.org

By the way my experience is that GitHub source links of Releases/Tags are m=
ore stable to get them any of time in 24/7. GitHub.com's Bandwidth and acce=
ssibility/availability is very well. So why you said they are unstable? The=
re are many recipes which uses GitHub source links for tar.gz files.

