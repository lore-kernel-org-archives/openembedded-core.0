Return-Path: <sundeep.kokkonda@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12A8EECAAA1
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 11:20:22 +0000 (UTC)
Subject: Re: [kirkstone] glibc : stable 2.35 branch updates.
To: openembedded-core@lists.openembedded.org
From: "Sundeep KOKKONDA" <sundeep.kokkonda@gmail.com>
X-Originating-Location: Hyderabad, Telangana, IN (183.83.147.202)
X-Originating-Platform: Windows Chrome 105
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Thu, 15 Sep 2022 04:20:17 -0700
References: <20220915111440.2121310-1-sundeep.kokkonda@gmail.com>
In-Reply-To: <20220915111440.2121310-1-sundeep.kokkonda@gmail.com>
Message-ID: <28696.1663240817153040654@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="KI1c5gIhom0TpRMN0xtA"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Sep 2022 11:20:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170690

--KI1c5gIhom0TpRMN0xtA
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Regression test are performed and below is test summary.

Test summary *after* glibc updates:
204 FAIL
4341 PASS
41 UNSUPPORTED
12 XFAIL
6 XPASS

Test summary *before* glibc updates:
200 FAIL
4343 PASS
41 UNSUPPORTED
12 XFAIL
6 XPASS

There are 4 tests added newly and 2 are removed with latest glibc commits.

Thanks,
Sundeep K.

--KI1c5gIhom0TpRMN0xtA
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Regression test are performed and below is test summary.<br /><br /><span s=
tyle=3D"text-decoration: underline;">Test summary <strong>after</strong> gl=
ibc updates:</span><br />
<div>204 FAIL&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</div>
<div>4341 PASS<span style=3D"white-space: pre;"> </span></div>
<div>41 UNSUPPORTED<span style=3D"white-space: pre;"> </span></div>
<div>12 XFAIL<span style=3D"white-space: pre;"> </span></div>
<div>&nbsp;6 XPASS&nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</div>
<div><br /><u>Test summary <strong>before</strong> glibc updates:</u><br />
<div>200 FAIL</div>
<div>4343 PASS</div>
<div>41 UNSUPPORTED</div>
<div>12 XFAIL</div>
<div>&nbsp;6 XPASS</div>
<div style=3D"text-decoration-line: underline;">&nbsp;</div>
There are 4 tests added newly and 2 are removed with latest glibc commits.<=
br />
<div><br /><br /></div>
<br />Thanks,<br />Sundeep K.</div>

--KI1c5gIhom0TpRMN0xtA--

