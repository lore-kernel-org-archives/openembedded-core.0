Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1F51C4332F
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 19:24:46 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.25397.1670268283919736104
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Dec 2022 11:24:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout08.t-online.de (Postfix) with SMTP id EB5731E85D;
	Mon,  5 Dec 2022 20:24:41 +0100 (CET)
Received: from [192.168.178.83] ([84.163.47.205]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p2H4z-1svMLQ0; Mon, 5 Dec 2022 20:24:41 +0100
Date: Mon, 05 Dec 2022 20:24:35 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] mesa: update 22.2.3 -> 22.3.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, alexandre.belloni@bootlin.com,
	openembedded-core@lists.openembedded.org
Message-Id: <Z8NFMR.D209HZUJ63D32@t-online.de>
In-Reply-To: 
	<CANNYZj9EirdvYtf6T4XwNqetq7p1rQv=9jKiu3oHwUUwQMja8w@mail.gmail.com>
References: <20221201173942.1218836-1-f_l_k@t-online.de>
	<Y44A+3v1z+4YztFg@mail.local>
	<CAMKF1soJqh4VNJCDAq=VMgFfatiwwtUdYSsGtZCSwDVuOH4ckw@mail.gmail.com>
	<6BMFMR.8PMB5H9B5CRG1@t-online.de>
	<CANNYZj9EirdvYtf6T4XwNqetq7p1rQv=9jKiu3oHwUUwQMja8w@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-WObvUagKEl3rUynQ/sls"
X-TOI-EXPURGATEID: 150726::1670268281-2E0B6EA1-62D40348/0/0 CLEAN NORMAL
X-TOI-MSGID: 5a73e4e2-a070-45fd-b762-08db19151b3e
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 19:24:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174299

--=-WObvUagKEl3rUynQ/sls
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Mo, 5. Dez 2022 um 20:17:53 +0100 schrieb Alexander Kanavin 
<alex.kanavin@gmail.com>:
> We don't use the monorepo, we use source tarballs and in them vaapi
> continues to be provided separately:

I see. Their meson.build is quite broken :(


--=-WObvUagKEl3rUynQ/sls
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am Mo, 5. Dez 2022 um 20:17:53 +0100 schrieb Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">We don't use the monorepo, we use source tarballs and in them vaapi
continues to be provided separately:</div></blockquote><div><br></div><div>I see. Their meson.build is quite broken :(</div></div>
--=-WObvUagKEl3rUynQ/sls--


