Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 885A5C4321E
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 20:47:22 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.130160.1669668438932602971
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Nov 2022 12:47:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout09.t-online.de (Postfix) with SMTP id D9245A580;
	Mon, 28 Nov 2022 21:47:16 +0100 (CET)
Received: from [192.168.0.80] ([24.134.105.89]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ozl24-21GsO80; Mon, 28 Nov 2022 21:47:16 +0100
Date: Mon, 28 Nov 2022 21:47:10 +0100
From: f_l_k@t-online.de
Subject: Re: [oe-core][PATCHv5] gcr: add recipe for gcr-4, needed to build
 with gtk4
To: alexandre.belloni@bootlin.com
Cc: openembedded-core@lists.openembedded.org
Message-Id: <MES2MR.QEUQIOP8KV0L1@t-online.de>
In-Reply-To: <Y4T8JW+C10og7zeA@mail.local>
References: <20221128161319.335950-1-f_l_k@t-online.de>
	<Y4T8JW+C10og7zeA@mail.local>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-7inwCr9hfxl8ZTtT5xh1"
X-TOI-EXPURGATEID: 150726::1669668436-EF7E87E2-AA2109DC/0/0 CLEAN NORMAL
X-TOI-MSGID: 9b0057ff-c2af-4d4b-82b4-a84fb31b47f0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 20:47:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173945

--=-7inwCr9hfxl8ZTtT5xh1
Content-Type: text/plain; charset=us-ascii; format=flowed

On Mon, Nov 28 2022 at 07:21:25 PM +0100, Alexandre Belloni via 
lists.openembedded.org 
<alexandre.belloni=bootlin.com@lists.openembedded.org> wrote:
> Don't you need to also add gtk4 to oe-core?

If this decision is final, I will send the patch for it tomorrow 
morning. At the moment I am not at home.


--=-7inwCr9hfxl8ZTtT5xh1
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Mon, Nov 28 2022 at 07:21:25 PM +0100, Alexandre Belloni via lists.openembedded.org &lt;alexandre.belloni=bootlin.com@lists.openembedded.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Don't you need to also add gtk4 to oe-core?</div></blockquote><div><br></div><div>If this decision is final, I will send the patch for it tomorrow morning. At the moment I am not at home.</div></div>
--=-7inwCr9hfxl8ZTtT5xh1--


