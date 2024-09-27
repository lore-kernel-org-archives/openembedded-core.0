Return-Path: <Deepthi.Hemraj@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCB55CEBF97
	for <webhook@archiver.kernel.org>; Fri, 27 Sep 2024 11:06:53 +0000 (UTC)
Subject: Re: [kirkstone][PATCH] gcc: upgrade to v11.5
To: openembedded-core@lists.openembedded.org
From: "Hemraj, Deepthi" <Deepthi.Hemraj@windriver.com>
X-Originating-Location: IN (103.26.233.234)
X-Originating-Platform: Windows Chrome 129
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 27 Sep 2024 04:06:50 -0700
References: <20240927110310.2580951-1-Deepthi.Hemraj@windriver.com>
In-Reply-To: <20240927110310.2580951-1-Deepthi.Hemraj@windriver.com>
Message-ID: <20211.1727435210004895167@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="CO6vopolebCN7LHGMxYx"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Sep 2024 11:06:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205015

--CO6vopolebCN7LHGMxYx
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Testing was done and below are the results:
*After* *update*
PASS - 154678
FAIL - 206
XPASS - 0
XFAIL - 854
UNSUPPORTED - 2293

*Before update*
PASS - =C2=A0154218
FAIL - =C2=A0208
XPASS - 0
XFAIL - 854
UNSUPPORTED - 2292

--CO6vopolebCN7LHGMxYx
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Testing was done and below are the results:</div>
<div>
<div><strong>After</strong> <strong>update</strong><br />PASS - 154678<br /=
>FAIL - 206<br />XPASS - 0<br />XFAIL - 854<br />UNSUPPORTED - 2293</div>
<div><br /><strong>Before update</strong><br />PASS - &nbsp;154218<br />FAI=
L - &nbsp;208<br />XPASS - 0<br />XFAIL - 854<br />UNSUPPORTED - 2292</div>
</div>

--CO6vopolebCN7LHGMxYx--

