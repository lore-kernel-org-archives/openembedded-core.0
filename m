Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E330C00A94
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 11:01:27 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.18146.1713178882177262876
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 04:01:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout02.t-online.de (Postfix) with SMTP id 48CA4156AD;
	Mon, 15 Apr 2024 13:00:58 +0200 (CEST)
Received: from [192.168.178.67] ([84.163.43.130]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rwK4z-0IU7qS0; Mon, 15 Apr 2024 13:00:54 +0200
Date: Mon, 15 Apr 2024 13:01:14 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [RFC][oe-core][PATCH] xwayland: update 23.2.5 -> 23.2.6
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: f_l_k@t-online.de, openembedded-core@lists.openembedded.org
Message-Id: <2ADZBS.W77021NJ2BB92@t-online.de>
In-Reply-To: <CANNYZj9tH9jaoJGpJbsy1ZYDv4NQATtN6zt51zx9cHwTdY2YaA@mail.gmail.com>
References: <17C62AA529E16CB6.8361@lists.openembedded.org>
	<8BRXBS.D9N3NVEBQKWZ@t-online.de>
	<CANNYZj9tH9jaoJGpJbsy1ZYDv4NQATtN6zt51zx9cHwTdY2YaA@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-JXXGGmrQRAfD2T2VOOZ9"
X-TOI-EXPURGATEID: 150726::1713178854-225BCE88-D2834FC1/0/0 CLEAN NORMAL
X-TOI-MSGID: 32eeb6fb-56f5-4d82-a169-742d47ea890a
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Apr 2024 11:01:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198230

--=-JXXGGmrQRAfD2T2VOOZ9
Content-Type: text/plain; charset=us-ascii; format=flowed

On Mon, Apr 15 2024 at 11:54:13 AM +02:00:00, Alexander Kanavin 
<alex.kanavin@gmail.com> wrote:
> Then the libei move should be sent together with the update as a set.
> libei first.


Sent an update. I'll take care to send a patch to meta-oe to remove 
libei, once this is accepted in oe-core



--=-JXXGGmrQRAfD2T2VOOZ9
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Mon, Apr 15 2024 at 11:54:13 AM +02:00:00, Alexander Kanavin &lt;alex.kanavin@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Then the libei move should be sent together with the update as a set.
libei first.</div></blockquote><div><br></div><div><br></div><div>Sent an update. I'll take care to send a patch to meta-oe to remove libei, once this is accepted in oe-core</div><div><br></div></div>
--=-JXXGGmrQRAfD2T2VOOZ9--


