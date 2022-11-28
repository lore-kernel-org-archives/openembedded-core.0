Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B021C433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 16:44:11 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web10.123020.1669653842819129268
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Nov 2022 08:44:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd80.dcpf.telekom.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout07.t-online.de (Postfix) with SMTP id 7AC53FF19;
	Mon, 28 Nov 2022 17:44:00 +0100 (CET)
Received: from [192.168.178.83] ([84.163.35.123]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ozhEd-4DpaFM0; Mon, 28 Nov 2022 17:44:00 +0100
Date: Mon, 28 Nov 2022 17:43:53 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv4] gcr: add recipe for gcr-4, needed to build
 with gtk4
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <55H2MR.623CA7J2821R2@t-online.de>
In-Reply-To: 
	<CANNYZj-kEos_m9v=M4t_w3gZLxrX7h4qvtV0WNHwy2zL=7sacQ@mail.gmail.com>
References: <20221128160842.335665-1-f_l_k@t-online.de>
	<CANNYZj-kEos_m9v=M4t_w3gZLxrX7h4qvtV0WNHwy2zL=7sacQ@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-pAQyQyLqO3RNomXVFIX6"
X-TOI-EXPURGATEID: 150726::1669653840-AB7F81D1-6BCE975C/0/0 CLEAN NORMAL
X-TOI-MSGID: 43917103-7795-4731-8eb2-421366ee02aa
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 16:44:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173933

--=-pAQyQyLqO3RNomXVFIX6
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Mo, 28. Nov 2022 um 17:12:53 +0100 schrieb Alexander Kanavin 
<alex.kanavin@gmail.com>:
> There might
> be more pieces in core, not sure.

While updating this, I also ran 'grep -r 'gcr ' .' in ./meta and 
./meta-openembedded. Epiphany was the only gcr user in core.


--=-pAQyQyLqO3RNomXVFIX6
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am Mo, 28. Nov 2022 um 17:12:53 +0100 schrieb Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">There might
be more pieces in core, not sure.</div></blockquote><div><br></div><div>While updating this, I also ran 'grep -r 'gcr ' .' in ./meta and ./meta-openembedded. Epiphany was the only gcr user in core.</div></div>
--=-pAQyQyLqO3RNomXVFIX6--


