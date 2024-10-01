Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6411ACE7D14
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 11:55:09 +0000 (UTC)
Subject: Re: [kirkstone][PATCH V2] gcc: upgrade to v11.5
To: openembedded-core@lists.openembedded.org
From: "Hemraj, Deepthi" <Deepthi.Hemraj@windriver.com>
X-Originating-Location: Bengaluru, Karnataka, IN (49.204.85.206)
X-Originating-Platform: Windows Chrome 129
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 01 Oct 2024 04:54:59 -0700
References: <20241001114855.363065-1-Deepthi.Hemraj@windriver.com>
In-Reply-To: <20241001114855.363065-1-Deepthi.Hemraj@windriver.com>
Message-ID: <1702.1727783699519791904@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="okThFeBnnIw73jUH0UdR"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 11:55:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205159

--okThFeBnnIw73jUH0UdR
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Testing was done and below are the results:
*After update*
PASS - 154678
FAIL - 206
XPASS - 0
XFAIL - 854
UNSUPPORTED - 2293

*before update*
PASS - =C2=A0154218
FAIL - =C2=A0208
XPASS - 0
XFAIL - 854
UNSUPPORTED - 2292

*Diff*
PASS - +460
FAIL - -2
XPASS - 0
XFAIL - 0
UNSUPPORTED - +1

--okThFeBnnIw73jUH0UdR
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>
<div>Testing was done and below are the results:<br /><strong>After update<=
/strong><br />PASS - 154678<br />FAIL - 206<br />XPASS - 0<br />XFAIL - 854=
<br />UNSUPPORTED - 2293</div>
<div><br /><strong>before update</strong><br />PASS - &nbsp;154218<br />FAI=
L - &nbsp;208<br />XPASS - 0<br />XFAIL - 854<br />UNSUPPORTED - 2292</div>
<div>&nbsp;</div>
<div><strong>Diff&nbsp;</strong></div>
<div>PASS - +460</div>
<div>FAIL - -2</div>
<div>XPASS - 0</div>
<div>XFAIL - 0</div>
<div>UNSUPPORTED - +1</div>
</div>

--okThFeBnnIw73jUH0UdR--

