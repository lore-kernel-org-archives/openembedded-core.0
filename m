Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89E3BC25B78
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 21:41:46 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.2810.1716414101426056893
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 14:41:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout11.t-online.de (Postfix) with SMTP id B128123FEC;
	Wed, 22 May 2024 23:41:39 +0200 (CEST)
Received: from [192.168.178.67] ([84.154.173.22]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1s9tiM-34kiSO0; Wed, 22 May 2024 23:41:38 +0200
Date: Wed, 22 May 2024 23:42:07 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] gcc-runtime.inc: additionally remove
 libgomp.info-1 and libgomp.info-2
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Message-Id: <7MPWDS.UJ5CKB2DU0XR2@t-online.de>
In-Reply-To: <20240522090622114b300c@mail.local>
References: <20240520175706.1840576-1-f_l_k@t-online.de>
	<20240522090622114b300c@mail.local>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-BUtWJUCfZDIAPfAJYCh+"
X-TOI-EXPURGATEID: 150726::1716414098-AE23E336-4A7D782A/0/0 CLEAN NORMAL
X-TOI-MSGID: 5d63573d-d052-4040-ac7c-db5f5b0dd07a
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 21:41:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199774

--=-BUtWJUCfZDIAPfAJYCh+
Content-Type: text/plain; charset=us-ascii; format=flowed

On Wed, May 22 2024 at 11:06:22 AM +02:00:00, Alexandre Belloni 
<alexandre.belloni@bootlin.com> wrote:
> this doesn't apply on master anymore, can you rebase?

Hi Alexandre,

probably this doesn't apply because Richard Purdie added a fix for this 
almost at the same time as I sent this patch.
So I guess this can be ignored


--=-BUtWJUCfZDIAPfAJYCh+
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Wed, May 22 2024 at 11:06:22 AM +02:00:00, Alexandre Belloni &lt;alexandre.belloni@bootlin.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">this doesn't apply on master anymore, can you rebase?</div></blockquote><div><br></div><div>Hi Alexandre,</div><div><br></div><div>probably this doesn't apply because Richard Purdie added a fix for this almost at the same time as I sent this patch.</div><div>So I guess this can be ignored</div></div>
--=-BUtWJUCfZDIAPfAJYCh+--


