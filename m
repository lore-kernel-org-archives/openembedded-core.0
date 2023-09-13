Return-Path: <sanjanasanju1608@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1A00EDEC44
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 11:30:44 +0000 (UTC)
Subject: Re: [kirkstone][PATCH] glibc: stable 2.35 branch updates
To: openembedded-core@lists.openembedded.org
From: "Sanjana V" <sanjanasanju1608@gmail.com>
X-Originating-Location: Erode, Tamil Nadu, IN (157.50.67.156)
X-Originating-Platform: Windows Chrome 116
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 13 Sep 2023 04:30:36 -0700
References: <20230913111845.585486-1-sanjanasanju1608@gmail.com>
In-Reply-To: <20230913111845.585486-1-sanjanasanju1608@gmail.com>
Message-ID: <20478.1694604636571017243@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="or6sYla3YvD9zVncAIa8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 11:30:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187584

--or6sYla3YvD9zVncAIa8
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Regression tests are performed and below is test summary.
Test summary after glibc updates:
PASS : 4773
FAIL=C2=A0 =C2=A0: 139
XPASS : 6
XFAIL=C2=A0 =C2=A0: 16
UNSUPPORTED : 235

Test summary before glibc updates:
PASS : 4770
FAIL=C2=A0 =C2=A0: 142
XPASS : 6
XFAIL=C2=A0 =C2=A0: 16
UNSUPPORTED : 235

Diff:
+3 PASS
0 FAIL
0 XPASS
0 XFAIL
0 UNSUPPORTED

--or6sYla3YvD9zVncAIa8
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Regression tests are performed and below is test summary.<br />Test summary=
 after glibc updates:<br />PASS : 4773<br />FAIL&nbsp; &nbsp;: 139<br />XPA=
SS : 6<br />XFAIL&nbsp; &nbsp;: 16<br />UNSUPPORTED : 235<br /><br />Test s=
ummary before glibc updates:<br />PASS : 4770<br />FAIL&nbsp; &nbsp;: 142<b=
r />XPASS : 6<br />XFAIL&nbsp; &nbsp;: 16<br />UNSUPPORTED : 235<br /><br /=
>Diff:<br />+3 PASS<br />0 FAIL<br />0 XPASS<br />0 XFAIL<br />0 UNSUPPORTE=
D

--or6sYla3YvD9zVncAIa8--

