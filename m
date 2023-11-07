Return-Path: <andrey.popov@yadro.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AE02C4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 15:03:44 +0000 (UTC)
Subject: Re: [PATCH] classes/image-live: Add support for building EFI-bootable ISO images for architectures other than x86 and x86_64
To: openembedded-core@lists.openembedded.org
From: "Andrey Popov" <andrey.popov@yadro.com>
X-Originating-Location: Tula, Tula Oblast, RU (95.139.247.121)
X-Originating-Platform: Linux Chrome 113
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 07 Nov 2023 07:03:41 -0800
References: <CANNYZj9yfxMw8EafTd8B-x9=vK1NTAF-NGB8CJqHoaxWsBsD8Q@mail.gmail.com>
In-Reply-To: <CANNYZj9yfxMw8EafTd8B-x9=vK1NTAF-NGB8CJqHoaxWsBsD8Q@mail.gmail.com>
Message-ID: <17247.1699369421073287026@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="efTrHQb2qsFgOHoAsO0o"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Nov 2023 15:03:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190288

--efTrHQb2qsFgOHoAsO0o
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello, Alex!

I created this patch in hope that I could ensure compatibility with legacy =
platforms that use BIOS, that is why I kept the syslinux part.
I don't think it is a good idea to drop syslinux usage entirely, IMHO.

Best regards, Andrey.

--efTrHQb2qsFgOHoAsO0o
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello, Alex!<br /><br />I created this patch in hope that I could ensure co=
mpatibility with legacy platforms that use BIOS, that is why I kept the sys=
linux part.<br />I don't think it is a good idea to drop syslinux usage ent=
irely, IMHO.<br /><br />Best regards, Andrey.

--efTrHQb2qsFgOHoAsO0o--

