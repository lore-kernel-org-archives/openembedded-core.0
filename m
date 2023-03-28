Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47939C76196
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 09:41:45 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.62048.1679996503962038575
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Mar 2023 02:41:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout10.t-online.de (Postfix) with SMTP id 7EADE449C4;
	Tue, 28 Mar 2023 11:41:41 +0200 (CEST)
Received: from [192.168.178.122] ([84.163.35.166]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ph5pl-3d8edU0; Tue, 28 Mar 2023 11:41:41 +0200
Date: Tue, 28 Mar 2023 11:41:35 +0200
From: f_l_k@t-online.de
Subject: Re: [oe-core][PATCH] import libadwaita from meta-gnome
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <BL58SR.DBJ9EGI95SX72@t-online.de>
In-Reply-To: <2023032809183607448ce9@mail.local>
References: <20230328080156.854975-1-f_l_k@t-online.de>
	<2023032809183607448ce9@mail.local>
X-Mailer: geary/43.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-vl0VGUPVcWr5eLg3kvjw"
X-TOI-EXPURGATEID: 150726::1679996501-E7FFCC37-A9BBF4D2/0/0 CLEAN NORMAL
X-TOI-MSGID: 58dd88f1-96ac-414e-8f2e-f9cd70f6408f
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 09:41:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179217

--=-vl0VGUPVcWr5eLg3kvjw
Content-Type: text/plain; charset=us-ascii; format=flowed

On Tue, Mar 28 2023 at 11:18:36 AM +0200, Alexandre Belloni 
<alexandre.belloni@bootlin.com> wrote:
> As you underlined, a build takes 5 to 10 hours, every build
> failure is also delaying work from others

Now thats true. I didn`t send ot unchanged patches so far, because I 
wanted to avoid mail flood but if it will make things easier I'll send 
the complete serie again


--=-vl0VGUPVcWr5eLg3kvjw
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Tue, Mar 28 2023 at 11:18:36 AM +0200, Alexandre Belloni &lt;alexandre.belloni@bootlin.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">As you underlined, a build takes 5 to 10 hours, every build
failure is also delaying work from others</div></blockquote><span style="white-space: break-spaces;"><br></span><div><span style="white-space: break-spaces;">Now thats true. I didn`t send ot unchanged patches so far, because I wanted to avoid mail flood but if it will make things easier I'll send the complete serie again</span></div></div>
--=-vl0VGUPVcWr5eLg3kvjw--


