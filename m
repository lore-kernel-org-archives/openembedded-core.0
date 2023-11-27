Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B966C4167B
	for <webhook@archiver.kernel.org>; Mon, 27 Nov 2023 20:24:11 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.107777.1701116640907553095
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Nov 2023 12:24:01 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout01.t-online.de (Postfix) with SMTP id 95D412D43B;
	Mon, 27 Nov 2023 21:23:26 +0100 (CET)
Received: from [192.168.178.67] ([84.163.41.136]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r7i8b-13RMcy0; Mon, 27 Nov 2023 21:23:26 +0100
Date: Mon, 27 Nov 2023 21:23:19 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv2] default-providers.inc: add PREFERRED_PROVIDER
 variables for llvm
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <VYTS4S.W2SK2KUWKFHM2@t-online.de>
In-Reply-To: <202311271944012140dbb6@mail.local>
References: <20231127102449.521512-1-f_l_k@t-online.de>
	<202311271944012140dbb6@mail.local>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-Z27+15RXPFSDN2tiy7ZC"
X-TOI-EXPURGATEID: 150726::1701116606-FE303990-2A8BB40C/0/0 CLEAN NORMAL
X-TOI-MSGID: 932b6d27-46c0-475b-a54c-72cc6c6837d4
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Nov 2023 20:24:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191325

--=-Z27+15RXPFSDN2tiy7ZC
Content-Type: text/plain; charset=us-ascii; format=flowed

On Mon, Nov 27 2023 at 08:44:01 PM +01:00:00, Alexandre Belloni 
<alexandre.belloni@bootlin.com> wrote:
> Please always include a changelog here, especially when sending 
> multiple
> versions in rapid succession.

Technically there is nothing that needs to be included in the changelog.
Its just that I was just to dumb to understand what make -e does at 
first and v2 just was wrong, although it worked.
But I didn't want to highlight that ;)


--=-Z27+15RXPFSDN2tiy7ZC
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Mon, Nov 27 2023 at 08:44:01 PM +01:00:00, Alexandre Belloni &lt;alexandre.belloni@bootlin.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Please always include a changelog here, especially when sending multiple
versions in rapid succession.
</div></blockquote><div><br></div><div>Technically there is nothing that needs to be included in the changelog.</div><div>Its just that I was just to dumb to understand what make -e does at first and v2 just was wrong, although it worked.</div><div>But I didn't want to highlight that ;)</div></div>
--=-Z27+15RXPFSDN2tiy7ZC--


