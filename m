Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76F5DC25B74
	for <webhook@archiver.kernel.org>; Mon, 27 May 2024 16:24:35 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web10.1390.1716827069837761071
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 May 2024 09:24:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout07.t-online.de (Postfix) with SMTP id 586884BB24;
	Mon, 27 May 2024 18:24:27 +0200 (CEST)
Received: from [192.168.178.67] ([84.163.33.219]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sBd97-2Ioyum0; Mon, 27 May 2024 18:24:26 +0200
Date: Mon, 27 May 2024 18:25:00 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] ghostscript: update 10.03.0 -> 10.03.1
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <O9K5ES.AUZUQVSU6DTL3@t-online.de>
In-Reply-To: <CANNYZj-kvU_f8wxaRa-PN9DCqrfs4NZN5tUhGQueZfaavJZXMQ@mail.gmail.com>
References: <20240527161104.2954913-1-f_l_k@t-online.de>
	<CANNYZj-kvU_f8wxaRa-PN9DCqrfs4NZN5tUhGQueZfaavJZXMQ@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-eu+cZAP/ttgTd07GY4yN"
X-TOI-EXPURGATEID: 150726::1716827066-E77A9DDA-0AE7636D/0/0 CLEAN NORMAL
X-TOI-MSGID: 9b25e73f-8977-4715-a075-320ed962b400
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 16:24:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199910

--=-eu+cZAP/ttgTd07GY4yN
Content-Type: text/plain; charset=us-ascii; format=flowed

On Mon, May 27 2024 at 06:17:31 PM +02:00:00, Alexander Kanavin 
<alex.kanavin@gmail.com> wrote:
> No. The expectation is that patches are submitted upstream first.
> Because otherwise they won't be submitted at all, most of the time,
> from experience.

I will send it upstream if I'm a little more sure that it's not 
nonsense. I was hoping to get some feedback from someone who has more 
experience with C code.


--=-eu+cZAP/ttgTd07GY4yN
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Mon, May 27 2024 at 06:17:31 PM +02:00:00, Alexander Kanavin &lt;alex.kanavin@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">No. The expectation is that patches are submitted upstream first.
Because otherwise they won't be submitted at all, most of the time,
from experience.</div></blockquote><div><br></div><div>I will send it upstream if I'm a little more sure that it's not nonsense. I was hoping to get some feedback from someone who has more experience with C code.</div></div>
--=-eu+cZAP/ttgTd07GY4yN--


