Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D958EC004D4
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 15:27:31 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.48269.1674142044837224468
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jan 2023 07:27:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout04.t-online.de (Postfix) with SMTP id 478635117;
	Thu, 19 Jan 2023 16:27:22 +0100 (CET)
Received: from [192.168.178.83] ([79.219.226.208]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pIWoz-06SvJ20; Thu, 19 Jan 2023 16:27:22 +0100
Date: Thu, 19 Jan 2023 16:27:16 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] gptfdisk: add follow-up patch to fix with
 current popt
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <G9OQOR.29KQBNHWF95M@t-online.de>
In-Reply-To: 
	<CANNYZj-ihaDgJ1Nar=h6oxq0GcA_J4-jouWfTacdoViNmRZuTQ@mail.gmail.com>
References: <20230119131853.27372-1-f_l_k@t-online.de>
	<CANNYZj-ihaDgJ1Nar=h6oxq0GcA_J4-jouWfTacdoViNmRZuTQ@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-fhjblNF65DaMV6MLwjYE"
X-TOI-EXPURGATEID: 150726::1674142042-D5BB19DF-1974C6AF/0/0 CLEAN NORMAL
X-TOI-MSGID: c910b7d2-27cd-4a84-af7d-091d45dbb1ee
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 15:27:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176148

--=-fhjblNF65DaMV6MLwjYE
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Do, 19. Jan 2023 um 16:14:58 +0100 schrieb Alexander Kanavin 
<alex.kanavin@gmail.com>:
> ck other patches to see the upstream situation and correct the status.

But its neither my patch nor am I familiar with sourceforge or the 
actual issue with popt ... and I'm not keen on changing that. I think 
if the gptfdisk maintainer wants to release a new version, he will be 
able to find the patch on the net like I was.

And if he wants to get more help from the community it would be a good 
idea to have a git repo available somewhere. Or am I missing something 
and just wasn't able to find it?


--=-fhjblNF65DaMV6MLwjYE
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am Do, 19. Jan 2023 um 16:14:58 +0100 schrieb Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;:<br><blockquote type="cite">ck other patches to see the upstream situation and correct the status.</blockquote><div><br></div><div><div>But its neither my patch nor am I familiar with sourceforge or the actual issue with popt ... and I'm not keen on changing that. I think if the gptfdisk maintainer wants to release a new version, he will be able to find the patch on the net like I was.</div><div><br></div><div>And if he wants to get more help from the community it would be a good idea to have a git repo available somewhere. Or am I missing something and just wasn't able to find it?</div></div></div>
--=-fhjblNF65DaMV6MLwjYE--


