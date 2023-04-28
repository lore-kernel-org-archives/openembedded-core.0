Return-Path: <deepadeepthi98@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C362C77B60
	for <webhook@archiver.kernel.org>; Fri, 28 Apr 2023 08:43:57 +0000 (UTC)
Subject: Re: [kirkstone][PATCH] glibc: stable 2.35 branch updates.
To: openembedded-core@lists.openembedded.org
From: "Deepthi Hemraj" <deepadeepthi98@gmail.com>
X-Originating-Location: Bengaluru, Karnataka, IN (202.131.134.149)
X-Originating-Platform: Windows Chrome 112
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 28 Apr 2023 01:43:49 -0700
References: <20230428082947.4091975-1-deepadeepthi98@gmail.com>
In-Reply-To: <20230428082947.4091975-1-deepadeepthi98@gmail.com>
Message-ID: <5976.1682671429462364149@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="mwQAFYj6DOe8o4eXGR7a"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Apr 2023 08:43:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180511

--mwQAFYj6DOe8o4eXGR7a
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Regression tests are performed and below is test summary.
Test summary after glibc updates:
185 FAIL
4413 PASS
41 UNSUPPORTED
12 XFAIL
6 XPASS

Test summary before glibc updates:
185 FAIL
4408 PASS
41 UNSUPPORTED
12 XFAIL
6 XPASS

Diff:
0 FAIL
+5 PASS
0 UNSUPPORTED
0 XFAIL
0 XPASS

--mwQAFYj6DOe8o4eXGR7a
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Regression tests are performed and below is test summary.<br />Test summary=
 after glibc updates:<br />185 FAIL<br />4413 PASS<br />41 UNSUPPORTED<br /=
>12 XFAIL<br />6 XPASS<br /><br />Test summary before glibc updates:<br />1=
85 FAIL<br />4408 PASS<br />41 UNSUPPORTED<br />12 XFAIL<br />6 XPASS<br />=
<br />Diff:<br />0 FAIL<br />+5 PASS<br />0 UNSUPPORTED<br />0 XFAIL<br />0=
 XPASS

--mwQAFYj6DOe8o4eXGR7a--

