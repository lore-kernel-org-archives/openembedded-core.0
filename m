Return-Path: <Deepthi.Hemraj@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60EE5C7EE2E
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 10:01:02 +0000 (UTC)
Subject: Re: [kirkstone][PATCH] glibc: stable 2.35 branch updates.
To: openembedded-core@lists.openembedded.org
From: Deepthi.Hemraj@eng.windriver.com
X-Originating-Location: Bengaluru, Karnataka, IN (49.204.85.206)
X-Originating-Platform: Windows Chrome 114
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 12 Jun 2023 03:00:57 -0700
References: <20230612094415.2338958-1-deepadeepthi98@gmail.com>
In-Reply-To: <20230612094415.2338958-1-deepadeepthi98@gmail.com>
Message-ID: <14338.1686563912593685566@lists.openembedded.org>
X-Old-Date: Mon, 12 Jun 2023 02:58:32 -0700
Content-Type: multipart/alternative; boundary="Dgy7EA76D5im0PxVqKGm"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jun 2023 10:01:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182661
Message-ID: <20230612100057.re_lENl0SYFdIQF2Wyt5ttuHLkj_jt-iU7fyy5BGaM0@z>

--Dgy7EA76D5im0PxVqKGm
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Regression tests are performed and below is test summary.
Test summary after glibc updates:

153 FAIL
4408 PASS
41 UNSUPPORTED
12 XFAIL
6 XPASS

Test summary after glibc updates:

154 FAIL
4405 PASS
41 UNSUPPORTED
12 XFAIL
6 XPASS

Diff:
1 FAIL
3 PASS
0 UNSUPPORTED
0 XFAIL
0 XPASS

--Dgy7EA76D5im0PxVqKGm
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Regression tests are performed and below is test summary.<br />Test summary=
 after glibc updates:<br />
<p class=3D"DefangedMsoNormal"><span>153 FAIL<br /></span><span>4408 PASS<b=
r /></span><span>41 UNSUPPORTED<br /></span><span>12 XFAIL<br /></span><spa=
n>6 XPASS<br /><br /></span></p>
Test summary after glibc updates:<br />
<p class=3D"DefangedMsoNormal"><span>154 FAIL<br /></span><span>4405 PASS<b=
r /></span><span>41 UNSUPPORTED<br /></span><span>12 XFAIL</span><span>&nbs=
p;<br />6 XPASS<br /><br />Diff:<br />1 FAIL<br />3 PASS<br /></span><span>=
0&nbsp;</span>UNSUPPORTED<br />0 XFAIL<br />0 XPASS</p>

--Dgy7EA76D5im0PxVqKGm--

