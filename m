Return-Path: <sanjanasanju1608@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE21DCDB46E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 12:14:31 +0000 (UTC)
Subject: Re: [mickledore] glibc: stable 2.37 branch updates.
To: openembedded-core@lists.openembedded.org
From: "Sanjana V" <sanjanasanju1608@gmail.com>
X-Originating-Location: Bengaluru, Karnataka, IN (49.204.85.206)
X-Originating-Platform: Windows Chrome 117
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 12 Oct 2023 05:14:26 -0700
References: <CAMKF1sp1_ATk5=2k=5UVf9few7Er9HTAcWePBjyJ7qo_q4T-RQ@mail.gmail.com>
In-Reply-To: <CAMKF1sp1_ATk5=2k=5UVf9few7Er9HTAcWePBjyJ7qo_q4T-RQ@mail.gmail.com>
Message-ID: <31911.1697112866787503087@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="yhToCaacJOW6DFEbvC28"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 12:14:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188992

--yhToCaacJOW6DFEbvC28
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Khem,

Thanks very much for checking the results and your comments.

>> How much memory does the device under test have?

We are using the default memory assigned in qemu x86-64.
cat /proc/meminfo
MemTotal:228876 kB

Can you please let us know if we should increase the memory in the image wh=
ile running oe-selftest?

--yhToCaacJOW6DFEbvC28
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Khem,<br /><br />Thanks very much for checking the results and your comm=
ents.<br /><span style=3D"white-space-collapse: preserve;"><br />&gt;&gt;</=
span><span style=3D"white-space-collapse: preserve;"> How much memory does =
the device under test have?<br /><br /></span>We are using the default memo=
ry assigned in qemu x86-64.<br />
<div>cat /proc/meminfo</div>
<div>MemTotal:228876 kB<br /><br />Can you please let us know if we should =
increase the memory in the image while running oe-selftest?</div>

--yhToCaacJOW6DFEbvC28--

