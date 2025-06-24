Return-Path: <gavrosc@yahoo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65453C77B7C
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 21:14:05 +0000 (UTC)
Subject: Re: [PATCH v2] host_dmesg_logger: dmesg diff on BuildStarted and BuildCompleted
To: openembedded-core@lists.openembedded.org
From: "Christos Gavros" <gavrosc@yahoo.com>
X-Originating-Location: =?UTF-8?B?TWFsbW8sIFNrw6VuZSBDb3VudHksIFNF?= (78.82.187.133)
X-Originating-Platform: Mac Safari 18.5
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 24 Jun 2025 14:14:03 -0700
References: <cdb51b9a5a1aaff3c5dfcd4fec89a97135e8afd6.camel@linuxfoundation.org>
In-Reply-To: <cdb51b9a5a1aaff3c5dfcd4fec89a97135e8afd6.camel@linuxfoundation.org>
Message-ID: <9005.1750799643434791617@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="QE1AfJV9WCEgl4pJyTUY"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 21:14:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219283

--QE1AfJV9WCEgl4pJyTUY
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I have read the comment with the links but I didn't dig through them.
I was thinking that maybe we need data from more builds in order to decide =
how to filter out.
Then, if this data is sufficient, shall we filter using "dmesg --level=3Der=
r,crit,alert,emerg" ?

--QE1AfJV9WCEgl4pJyTUY
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>I have read the comment with the links but I didn't dig through them.<=
/div>
<div>I was thinking that maybe we need data from more builds in order to de=
cide how to filter out.</div>
<div>Then, if this data is sufficient, shall we filter using "dmesg --level=
=3Derr,crit,alert,emerg" ?</div>

--QE1AfJV9WCEgl4pJyTUY--

