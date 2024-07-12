Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34F86C2BD09
	for <webhook@archiver.kernel.org>; Fri, 12 Jul 2024 09:17:01 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.3808.1720775813157826643
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jul 2024 02:16:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout07.t-online.de (Postfix) with SMTP id 8531F33A7;
	Fri, 12 Jul 2024 11:16:30 +0200 (CEST)
Received: from [192.168.178.67] ([79.219.232.121]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sSCO7-38rtqK0; Fri, 12 Jul 2024 11:16:23 +0200
Date: Fri, 12 Jul 2024 11:17:31 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [OE-core] [RFC][-oe-core][PATCHv2] mesa: update
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <757IGS.I2NU4UA2LA0E3@t-online.de>
In-Reply-To: <CANNYZj-5k0P3YCvHMHGOVVeT6cZ6n=XqBbZvNjvJb=nvOPpuQw@mail.gmail.com>
References: <17E16678ED058C43.21599@lists.openembedded.org>
	<D32IGS.SWQABZ55T8L21@t-online.de>
	<CANNYZj-5k0P3YCvHMHGOVVeT6cZ6n=XqBbZvNjvJb=nvOPpuQw@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-NsD49MCZ7DMvjxDLzGRu"
X-TOI-EXPURGATEID: 150726::1720775783-237FDC95-29F3AD35/0/0 CLEAN NORMAL
X-TOI-MSGID: 4620d8c9-727a-4560-b0cf-c71511d70d67
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 09:17:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201816

--=-NsD49MCZ7DMvjxDLzGRu
Content-Type: text/plain; charset=us-ascii; format=flowed

On Fri, Jul 12 2024 at 11:09:23 AM +02:00:00, Alexander Kanavin 
<alex.kanavin@gmail.com> wrote:
> It would help if the version update is separated from all the
> rust/clang/opencl fixes. Please try to make a nice set of simple
> commits, instead of bundling everything into one.
> 
> Alex

I didn't plan to send this as a mesa update, just wanted to share my 
findings on the rust thing. But I can of course send an update for mesa 
without the rust stuff


--=-NsD49MCZ7DMvjxDLzGRu
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Fri, Jul 12 2024 at 11:09:23 AM +02:00:00, Alexander Kanavin &lt;alex.kanavin@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">It would help if the version update is separated from all the
rust/clang/opencl fixes. Please try to make a nice set of simple
commits, instead of bundling everything into one.

Alex</div></blockquote><div><br></div><div>I didn't plan to send this as a mesa update, just wanted to share my findings on the rust thing. But I can of course send an update for mesa without the rust stuff</div></div>
--=-NsD49MCZ7DMvjxDLzGRu--


