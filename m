Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD5D2C46CA1
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 12:49:44 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.50317.1695041376500804172
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Sep 2023 05:49:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout05.t-online.de (Postfix) with SMTP id 5A2E71368A;
	Mon, 18 Sep 2023 14:49:34 +0200 (CEST)
Received: from [192.168.178.62] ([84.154.161.214]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qiDgv-2XjkOG0; Mon, 18 Sep 2023 14:49:29 +0200
Date: Mon, 18 Sep 2023 14:49:32 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH 1/4] libxmlb: import recipe from meta-oe
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Message-Id: <KAM61S.4JBRRHTD56MA1@t-online.de>
In-Reply-To: <CANNYZj-qDMGVJVkGbY8GKbqmcb6TpRenenE75KqyNewpLBe5xg@mail.gmail.com>
References: <20230917182829.2153680-1-f_l_k@t-online.de>
	<64a23553aec159f4d506efd799eca893c7d9f25c.camel@linuxfoundation.org>
	<DKI61S.U4D11V8BDTPG3@t-online.de>
	<CANNYZj-73pCe_yRamvNM=9U2sGdv+ty9-QO8g=5QVkPD9crmdQ@mail.gmail.com>
	<1785FB5FB0D0A413.14604@lists.openembedded.org>
	<9UL61S.KHBD7IUK1XAU1@t-online.de>
	<CANNYZj-qDMGVJVkGbY8GKbqmcb6TpRenenE75KqyNewpLBe5xg@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-81YST60Lnp95lFMBJoKe"
X-TOI-EXPURGATEID: 150726::1695041369-45FFA5E3-8FD9338D/0/0 CLEAN NORMAL
X-TOI-MSGID: 36d8d762-9004-4059-8cc8-7b6c4e9872e4
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Sep 2023 12:49:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187832

--=-81YST60Lnp95lFMBJoKe
Content-Type: text/plain; charset=us-ascii; format=flowed

On Mon, Sep 18 2023 at 02:44:00 PM +02:00:00, Alexander Kanavin 
<alex.kanavin@gmail.com> wrote:
> The criteria is written in the file where ptests are separated into
> fast and slow.

Well documented. You just have to open your eyes ;)
Thanks. I'll send an update


--=-81YST60Lnp95lFMBJoKe
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Mon, Sep 18 2023 at 02:44:00 PM +02:00:00, Alexander Kanavin &lt;alex.kanavin@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">The criteria is written in the file where ptests are separated into
fast and slow.</div></blockquote><div><br></div><div>Well documented. You just have to open your eyes ;)</div><div>Thanks. I'll send an update</div></div>
--=-81YST60Lnp95lFMBJoKe--


