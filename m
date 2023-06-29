Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4783DEB64D9
	for <webhook@archiver.kernel.org>; Thu, 29 Jun 2023 04:17:23 +0000 (UTC)
Subject: Re: [mickledore][PATCH] tiff: backport a fix for CVE-2023-26965
To: openembedded-core@lists.openembedded.org
From: "Siddharth" <sdoshi@mvista.com>
X-Originating-Location: Ahmedabad, Gujarat, IN (49.34.180.95)
X-Originating-Platform: Linux Chrome 114
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 28 Jun 2023 21:17:15 -0700
References: <20230628172552.2122139-1-nat.bailey@windriver.com>
In-Reply-To: <20230628172552.2122139-1-nat.bailey@windriver.com>
Message-ID: <23851.1688012235202021582@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="sXSBBQrNcxuEocfWz0R5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 04:17:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183607

--sXSBBQrNcxuEocfWz0R5
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

CVE-fix for=C2=A0CVE-2023-25434 and CVE-2023-26965 for 4.5.0 was submitted =
for master which could directly be backported to mickledore too as it has t=
he same version -> https://lists.openembedded.org/g/openembedded-core/messa=
ge/183408

However, it increases Steve's task to patch if we submit single CVE's. So, =
better to club and send them.

Regards,
Siddharth

--sXSBBQrNcxuEocfWz0R5
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<p>CVE-fix for&nbsp;CVE-2023-25434 and CVE-2023-26965 for 4.5.0 was submitt=
ed for master which could directly be backported to mickledore too as it ha=
s the same version -&gt; <a href=3D"https://lists.openembedded.org/g/openem=
bedded-core/message/183408" target=3D"_blank" rel=3D"noopener">https://list=
s.openembedded.org/g/openembedded-core/message/183408</a><br /><br />Howeve=
r, it increases Steve's task to patch if we submit single CVE's. So, better=
 to club and send them.<br /><br />Regards,<br />Siddharth</p>

--sXSBBQrNcxuEocfWz0R5--

