Return-Path: <deepadeepthi98@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F9BFC7618E
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 11:34:38 +0000 (UTC)
Subject: Re: [mickledore][PATCH V2] glibc: stable 2.37 branch updates.
To: openembedded-core@lists.openembedded.org
From: "Deepthi Hemraj" <deepadeepthi98@gmail.com>
X-Originating-Location: Bengaluru, Karnataka, IN (202.131.135.4)
X-Originating-Platform: Windows Chrome 112
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 26 Apr 2023 04:34:28 -0700
References: <20230426113135.2740310-1-deepadeepthi98@gmail.com>
In-Reply-To: <20230426113135.2740310-1-deepadeepthi98@gmail.com>
Message-ID: <17864.1682508868187918015@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="OtNi3mDDBJ3FDmpFdNbH"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Apr 2023 11:34:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180432

--OtNi3mDDBJ3FDmpFdNbH
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Regression tests are performed and below is test summary.
Test summary after glibc updates:
193 FAIL
4399 PASS
38 UNSUPPORTED
16 XFAIL
2 XPASS

Test summary before glibc updates:
247 FAIL
4382 PASS
38 UNSUPPORTED
16 XFAIL
2 XPASS

--OtNi3mDDBJ3FDmpFdNbH
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Regression tests are performed and below is test summary.</div>
<div>Test summary after glibc updates:</div>
<div><span style=3D"white-space: pre;"> </span>193 FAIL</div>
<div>&nbsp; &nbsp;4399 PASS</div>
<div>&nbsp; &nbsp; &nbsp;38 UNSUPPORTED</div>
<div>&nbsp; &nbsp; &nbsp;16 XFAIL</div>
<div>&nbsp; &nbsp; &nbsp; 2 XPASS</div>
<div>&nbsp;</div>
<div>Test summary before glibc updates:</div>
<div>&nbsp; &nbsp; &nbsp;247 FAIL</div>
<div>&nbsp; &nbsp; 4382 PASS</div>
<div>&nbsp; &nbsp; &nbsp; 38 UNSUPPORTED</div>
<div>&nbsp; &nbsp; &nbsp; 16 XFAIL</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp;2 XPASS<br /><br /></div>

--OtNi3mDDBJ3FDmpFdNbH--

