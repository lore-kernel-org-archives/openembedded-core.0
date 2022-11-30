Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3EDBC4321E
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 15:58:44 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.15086.1669823922479974156
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Nov 2022 07:58:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout11.t-online.de (Postfix) with SMTP id DBA83F94E;
	Wed, 30 Nov 2022 16:58:39 +0100 (CET)
Received: from [192.168.178.83] ([84.163.47.245]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p0PTr-1NOmi80; Wed, 30 Nov 2022 16:58:39 +0100
Date: Wed, 30 Nov 2022 16:58:34 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv8 4/4] gcr: add recipe for gcr-4, needed to build
 with gtk4
To: alexandre.belloni@bootlin.com
Cc: openembedded-core@lists.openembedded.org
Message-Id: <MD46MR.7526AS010V5V3@t-online.de>
In-Reply-To: <Y4d8QoDyNaoV0rEY@mail.local>
References: <20221130053450.95655-1-f_l_k@t-online.de>
	<20221130053450.95655-4-f_l_k@t-online.de> <Y4d8QoDyNaoV0rEY@mail.local>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-enkorZxAbmamzqr3JbDw"
X-TOI-EXPURGATEID: 150726::1669823919-DAFFF742-21AE2210/0/0 CLEAN NORMAL
X-TOI-MSGID: ce83c509-700d-43fd-8a69-e6ea7e5bb1a1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Nov 2022 15:58:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174021

--=-enkorZxAbmamzqr3JbDw
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Mi, 30. Nov 2022 um 16:52:34 +0100 schrieb Alexandre Belloni via 
lists.openembedded.org 
<alexandre.belloni=bootlin.com@lists.openembedded.org>:
> | Run-time dependency gcr-3 found: NO (tried pkgconfig)

Sent a patch for it


--=-enkorZxAbmamzqr3JbDw
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am Mi, 30. Nov 2022 um 16:52:34 +0100 schrieb Alexandre Belloni via lists.openembedded.org &lt;alexandre.belloni=bootlin.com@lists.openembedded.org&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">| Run-time dependency gcr-3 found: NO (tried pkgconfig)</div></blockquote><div><br></div><div>Sent a patch for it</div></div>
--=-enkorZxAbmamzqr3JbDw--


