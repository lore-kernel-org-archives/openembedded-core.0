Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47423C48297
	for <webhook@archiver.kernel.org>; Fri,  9 Feb 2024 19:10:58 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.21071.1707505857270059704
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Feb 2024 11:10:57 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout01.t-online.de (Postfix) with SMTP id 782A61E387;
	Fri,  9 Feb 2024 20:10:54 +0100 (CET)
Received: from [192.168.178.67] ([84.163.32.56]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rYWGx-1zGrKa0; Fri, 9 Feb 2024 20:10:52 +0100
Date: Fri, 09 Feb 2024 20:10:50 +0100
From: f_l_k@t-online.de
Subject: Re: [OE-core] [PATCH] shadow: add a packageconfig for logind support
To: Markus Volk <f_l_k@t-online.de>
Cc: Khem Raj <raj.khem@gmail.com>, Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org, Alexander Kanavin
	<alex@linutronix.de>
Message-Id: <2YRL8S.HJ3I15XBPFDO3@t-online.de>
In-Reply-To: <17B2464304C471A5.15017@lists.openembedded.org>
References: <20240208185641.2969396-1-alex@linutronix.de>
	<CAMKF1sr8rx9Mcm40KCFJxu1S5546tQGD=d8ox1Kh74uKScFk1A@mail.gmail.com>
	<17B2464304C471A5.15017@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-IC8hQiqm4fTQRCns+F85"
X-TOI-EXPURGATEID: 150726::1707505852-DD1C2917-2E889F6C/0/0 CLEAN NORMAL
X-TOI-MSGID: d4d0fdb2-ae40-4230-b716-f96895bf02ee
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Feb 2024 19:10:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195242

--=-IC8hQiqm4fTQRCns+F85
Content-Type: text/plain; charset=us-ascii; format=flowed

On Fri, Feb 9 2024 at 07:47:38 PM +01:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> because if DISTRO_FEATURE 'systemd' is set, it will be added anyway, 
> right?

no,it's not


--=-IC8hQiqm4fTQRCns+F85
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Fri, Feb 9 2024 at 07:47:38 PM +01:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite">because if DISTRO_FEATURE 'systemd' is set, it will be added anyway, right?</blockquote><div><br></div><div>no,it's not</div></div>
--=-IC8hQiqm4fTQRCns+F85--


