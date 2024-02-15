Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7BDEC4829E
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 16:45:38 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.18724.1708015533785277367
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Feb 2024 08:45:34 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout03.t-online.de (Postfix) with SMTP id B1CDF3B76F;
	Thu, 15 Feb 2024 17:45:30 +0100 (CET)
Received: from [192.168.178.67] ([79.219.224.161]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1raerY-0pCwgS0; Thu, 15 Feb 2024 17:45:28 +0100
Date: Thu, 15 Feb 2024 17:45:42 +0100
From: f_l_k@t-online.de
Subject: Re: [oe-core][PATCH] mesa: update 23.3.5 -> 24.0.0
To: Ross Burton <Ross.Burton@arm.com>
Cc: openembedded-core@lists.openembedded.org, Richard Purdie
	<richard.purdie@linuxfoundation.org>, Alexander Kanavin
	<alex.kanavin@gmail.com>
Message-Id: <68PW8S.50R7Y7Z1QE9L1@t-online.de>
In-Reply-To: <1A350816-2A84-452F-B41D-E99BE46C4D82@arm.com>
References: <20240214181453.795654-1-f_l_k@t-online.de>
	<1A350816-2A84-452F-B41D-E99BE46C4D82@arm.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-OUKVWLMjHIUN2NubA2xc"
X-TOI-EXPURGATEID: 150726::1708015528-FB7FD94C-3D45BB7E/0/0 CLEAN NORMAL
X-TOI-MSGID: b73781f2-d41a-4833-b2d8-62136d6744c7
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Feb 2024 16:45:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195545

--=-OUKVWLMjHIUN2NubA2xc
Content-Type: text/plain; charset=us-ascii; format=flowed

On Thu, Feb 15 2024 at 11:25:24 AM +00:00:00, Ross Burton 
<Ross.Burton@arm.com> wrote:
> Mesa 24.0.0 is - as clearly indicated on the web site - a development 
> snapshot.  24.0.1 is now out, can you upgrade to that?

Thank you. I didn't see that mentioned in the gitlab tag. I sent the 
mesa-24.0.1 update as a follow up because 24.0.0 is already in master.


--=-OUKVWLMjHIUN2NubA2xc
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Thu, Feb 15 2024 at 11:25:24 AM +00:00:00, Ross Burton &lt;Ross.Burton@arm.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Mesa 24.0.0 is - as clearly indicated on the web site - a development snapshot.  24.0.1 is now out, can you upgrade to that?
</div></blockquote><div><br></div><div>Thank you. I didn't see that mentioned in the gitlab tag. I sent the mesa-24.0.1 update as a follow up because 24.0.0 is already in master.</div></div>
--=-OUKVWLMjHIUN2NubA2xc--


