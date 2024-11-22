Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CC3DD75E25
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 11:00:15 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.21386.1732273203536093852
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 03:00:03 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout10.t-online.de (Postfix) with SMTP id 6315799C;
	Fri, 22 Nov 2024 12:00:00 +0100 (CET)
Received: from [192.168.178.67] ([84.163.36.225]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tEROJ-0BjKMK0; Fri, 22 Nov 2024 11:59:59 +0100
Date: Fri, 22 Nov 2024 11:59:54 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] libsecret: add pam support depending on
 DISTRO_FEATURES
To: Martin Jansa <martin.jansa@gmail.com>
Cc: mathieu.dubois-briand@bootlin.com, Markus Volk <f_l_k@t-online.de>,
	openembedded-core@lists.openembedded.org
Message-Id: <UJMCNS.24BG84R9EJHR@t-online.de>
In-Reply-To: <CA+chaQc5HuE4upyMTvxd6ZGYH+EhO68saiH7vzVvS1XxHcJRAA@mail.gmail.com>
References: <20241120183528.2560-1-f_l_k@t-online.de>
	<Z0A0N7JzXivpU5qL@bootlin-mathieu>
	<CA+chaQc5HuE4upyMTvxd6ZGYH+EhO68saiH7vzVvS1XxHcJRAA@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-xGev1VvP/GK16esJ9bvh"
X-TOI-EXPURGATEID: 150726::1732273199-4A7F510B-271EB12D/0/0 CLEAN NORMAL
X-TOI-MSGID: aa8c93c9-5997-4998-8ec7-1e054c5a5c1a
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 11:00:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207598

--=-xGev1VvP/GK16esJ9bvh
Content-Type: text/plain; charset=us-ascii; format=flowed

On Fri, Nov 22 2024 at 08:53:57 AM +01:00:00, Martin Jansa 
<martin.jansa@gmail.com> wrote:
> It's the missing colon after Upstream-Status.

Oops, sorry. I completely overlooked that. Will send a v2


--=-xGev1VvP/GK16esJ9bvh
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Fri, Nov 22 2024 at 08:53:57 AM +01:00:00, Martin Jansa &lt;martin.jansa@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">It's the missing colon after Upstream-Status.</div></blockquote><div><br></div><div>Oops, sorry. I completely overlooked that. Will send a v2</div></div>
--=-xGev1VvP/GK16esJ9bvh--


