Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D899AC352A1
	for <webhook@archiver.kernel.org>; Tue,  6 Dec 2022 19:45:35 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.1211.1670355933437568400
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Dec 2022 11:45:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout05.t-online.de (Postfix) with SMTP id 0B4B15D4;
	Tue,  6 Dec 2022 20:45:28 +0100 (CET)
Received: from [192.168.178.83] ([84.163.47.136]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p2dsY-10mvNg0; Tue, 6 Dec 2022 20:45:22 +0100
Date: Tue, 06 Dec 2022 20:45:16 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] gstreamer-vaapi: rename USE_X11 variable
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <GVIHMR.5M8TI95NPQA22@t-online.de>
In-Reply-To: <172E098AC1FC1CC7.6582@lists.openembedded.org>
References: <20221205201330.2184787-1-f_l_k@t-online.de>
	<febe3d80e804684b2cd8f1be280bca7193e8ff9c.camel@linuxfoundation.org>
	<172E098AC1FC1CC7.6582@lists.openembedded.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-OKwbysB1qBzbRjIUQ2T6"
X-TOI-EXPURGATEID: 150726::1670355922-6120D2DC-45233B1F/0/0 CLEAN NORMAL
X-TOI-MSGID: b8a40615-4263-4f9f-a732-d24297f362b7
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Dec 2022 19:45:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174329

--=-OKwbysB1qBzbRjIUQ2T6
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Di, 6. Dez 2022 um 00:29:48 +0100 schrieb Markus Volk 
<f_l_k@t-online.de>:
> we should discuss it with upstream as it is presumably
> something they'd want to fix

I submitted an issue for it
<https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/1634>


--=-OKwbysB1qBzbRjIUQ2T6
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am Di, 6. Dez 2022 um 00:29:48 +0100 schrieb Markus Volk &lt;f_l_k@t-online.de&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">we should discuss it with upstream as it is presumably
something they'd want to fix</div></blockquote><div><br></div><div>I submitted an issue for it</div><div><a href="https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/1634">https://gitlab.freedesktop.org/gstreamer/gstreamer/-/issues/1634</a></div></div>
--=-OKwbysB1qBzbRjIUQ2T6--


