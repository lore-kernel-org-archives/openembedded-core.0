Return-Path: <sundeep.kokkonda@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BAA5C46CCD
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 10:42:36 +0000 (UTC)
Subject: Re: [PATCH] rust: rustdoc reproducibility issue fix
To: openembedded-core@lists.openembedded.org
From: "Sundeep KOKKONDA" <sundeep.kokkonda@windriver.com>
X-Originating-Location: Hyderabad, Telangana, IN (49.205.250.133)
X-Originating-Platform: Windows Chrome 120
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 20 Dec 2023 02:42:29 -0800
References: <20231220104020.1837836-1-sundeep.kokkonda@windriver.com>
In-Reply-To: <20231220104020.1837836-1-sundeep.kokkonda@windriver.com>
Message-ID: <16884.1703068949095369112@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="5N04gdCF4T41lyvUQyJ9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Dec 2023 10:42:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192790

--5N04gdCF4T41lyvUQyJ9
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Testing done with arm, arm64, x86 & x86_64 arch's.
Below combinations are tested.
- Tested the issue by reproducing and fixing it with the patch,
- with oe-selftest,
- Builds b/w different commits,
- with shared sstate b/w the builds.

--5N04gdCF4T41lyvUQyJ9
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Testing done with arm, arm64, x86 &amp; x86_64 arch's.&nbsp;</div>
<div>Below combinations are tested.<br />- Tested the issue by reproducing =
and fixing it with the patch,</div>
<div>- with oe-selftest,</div>
<div>- Builds b/w different commits,</div>
<div>- with shared sstate b/w the builds.</div>
<div>&nbsp;</div>

--5N04gdCF4T41lyvUQyJ9--

