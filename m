Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36AF9C636CC
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 10:45:47 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.11747.1676285142193981094
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Feb 2023 02:45:42 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout04.t-online.de (Postfix) with SMTP id 76E9E9C02;
	Mon, 13 Feb 2023 11:45:40 +0100 (CET)
Received: from [192.168.178.83] ([84.163.47.111]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pRWL6-3C8pw80; Mon, 13 Feb 2023 11:45:40 +0100
Date: Mon, 13 Feb 2023 11:45:34 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv2] graphene: add a PACKAGECONFIG for arm_neon
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <YVL0QR.20QO10N8FSZ91@t-online.de>
In-Reply-To: 
	<CANNYZj-HgBA=Tn+Og9FQdrH6sDF9W9epw8NntJqdy9BZFgjKfg@mail.gmail.com>
References: <20230213103939.1066831-1-f_l_k@t-online.de>
	<TNL0QR.8TQGS2RNIWUZ@t-online.de>
	<CANNYZj-HgBA=Tn+Og9FQdrH6sDF9W9epw8NntJqdy9BZFgjKfg@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-BsbVxD94yt9kXYRxUUW6"
X-TOI-EXPURGATEID: 150726::1676285140-42AC0378-C32B31EF/0/0 CLEAN NORMAL
X-TOI-MSGID: b405c9c9-d93b-414a-8e20-6734c1503949
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 10:45:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177095

--=-BsbVxD94yt9kXYRxUUW6
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Mo, 13. Feb 2023 um 11:43:55 +0100 schrieb Alexander Kanavin 
<alex.kanavin@gmail.com>:
> I think it's commented out?

yes, did this for testing purpose. Sorry. Sent a v3


--=-BsbVxD94yt9kXYRxUUW6
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am Mo, 13. Feb 2023 um 11:43:55 +0100 schrieb Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">I think it's commented out?</div></blockquote><div><br></div><div>yes, did this for testing purpose. Sorry. Sent a v3</div></div>
--=-BsbVxD94yt9kXYRxUUW6--


