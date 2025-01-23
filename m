Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FC47C02182
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 11:02:30 +0000 (UTC)
Subject: Re: [PATCH] gdb: Upgrade 15.2 -> 16.1
To: openembedded-core@lists.openembedded.org
From: "Yash Shinde" <Yash.Shinde@windriver.com>
X-Originating-Location: Bengaluru, Karnataka, IN (49.204.85.206)
X-Originating-Platform: Windows Chrome 131
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 23 Jan 2025 03:02:30 -0800
References: <20250123103104.1885498-1-Yash.Shinde@windriver.com>
In-Reply-To: <20250123103104.1885498-1-Yash.Shinde@windriver.com>
Message-ID: <16166.1737630150244741068@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="7XcRZ2yBY2CzhqQ6YuXN"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jan 2025 11:02:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210190

--7XcRZ2yBY2CzhqQ6YuXN
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Following builds were tested:

bitbake gdb
bitbake binutils
bitbake core-image-minimal
bitbake meta-toolchain

Also, booted qemu image for x86_64 and tested working of gdb v16.1.

--7XcRZ2yBY2CzhqQ6YuXN
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Following builds were tested:<br /><br />bitbake gdb</div>
<div>bitbake binutils<br />bitbake core-image-minimal</div>
<div>bitbake meta-toolchain<br /><br />Also, booted qemu image for x86_64 a=
nd tested working of gdb v16.1.</div>

--7XcRZ2yBY2CzhqQ6YuXN--

