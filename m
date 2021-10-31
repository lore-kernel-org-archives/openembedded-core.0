Return-Path: <mleonhardt@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03EAEC433EF
	for <webhook@archiver.kernel.org>; Sun, 31 Oct 2021 20:13:05 +0000 (UTC)
Subject: Re: [PATCH] sstate: Consider .lock suffix for when loading sstate
 file from mirror
To: openembedded-core@lists.openembedded.org
From: "Manuel Leonhardt" <mleonhardt@arri.de>
X-Originating-Location: Munich, Bavaria, DE (88.217.121.203)
X-Originating-Platform: Mac Firefox 93
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sun, 31 Oct 2021 13:13:04 -0700
References: <20211031200828.80223-1-mleonhardt@arri.de>
In-Reply-To: <20211031200828.80223-1-mleonhardt@arri.de>
Message-ID: <15391.1635711184126124895@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="7oe74nCPZMdTwcT8JNgV"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 Oct 2021 20:13:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157692

--7oe74nCPZMdTwcT8JNgV
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

See also https://lists.openembedded.org/g/bitbake-devel/topic/86724965 , wh=
ere bb.utils.lockfile is fixed to raise when the filename of a lockfile is =
too long.

--7oe74nCPZMdTwcT8JNgV
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

See also <a href=3D"https://lists.openembedded.org/g/bitbake-devel/topic/86=
724965" target=3D"_blank" rel=3D"noopener">https://lists.openembedded.org/g=
/bitbake-devel/topic/86724965</a> , where bb.utils.lockfile is fixed to rai=
se when the filename of a lockfile is too long.

--7oe74nCPZMdTwcT8JNgV--

