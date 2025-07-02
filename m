Return-Path: <gudni.m.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 272F8C7EE30
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 08:47:03 +0000 (UTC)
Subject: Re: [PATCH v2] sqlite3: upgrade 3.48.0 -> 3.50.1
To: openembedded-core@lists.openembedded.org
From: =?UTF-8?B?R3XDsG5pIE3DoXIgR2lsYmVydA==?= <gudni.m.g@gmail.com>
X-Originating-Location: =?UTF-8?B?R2Fyw7BhYmFlciwgQ2FwaXRhbCBSZWdpb24sIElT?= (81.15.100.92)
X-Originating-Platform: Windows Firefox 140
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 02 Jul 2025 01:46:57 -0700
References: <DB1CTEVUVWZP.13OQTLFJG9G9S@bootlin.com>
In-Reply-To: <DB1CTEVUVWZP.13OQTLFJG9G9S@bootlin.com>
Message-ID: <18523.1751446017821038910@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="Om13oeC7gf1l50qepwSG"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 08:47:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219811

--Om13oeC7gf1l50qepwSG
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Thank for taking the time to test this Antonin. I saw this error locally ra=
rely, and usually deleting the entire build folder resolved the problem.

I am not sure how to fix this issue, if anybody has any ideas then I would =
gladly listen/appreciate it. I'm not very familiar with the underlying Pyth=
on code that is detecting a broken pipe. I wonder if this is some sort of r=
ace condition?

--Om13oeC7gf1l50qepwSG
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Thank for taking the time to test this Antonin. I saw this error local=
ly rarely, and usually deleting the entire build folder resolved the proble=
m.</div>
<div>&nbsp;</div>
<div>I am not sure how to fix this issue, if anybody has any ideas then I w=
ould gladly listen/appreciate it. I'm not very familiar with the underlying=
 Python code that is detecting a broken pipe. I wonder if this is some sort=
 of race condition?</div>

--Om13oeC7gf1l50qepwSG--

