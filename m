Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03D2FC4321E
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 05:52:13 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.8600.1670219530268567719
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Dec 2022 21:52:10 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout02.t-online.de (Postfix) with SMTP id CA0E41A932;
	Mon,  5 Dec 2022 06:52:07 +0100 (CET)
Received: from [192.168.178.83] ([84.163.47.205]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p24Od-2VkYTo0; Mon, 5 Dec 2022 06:52:07 +0100
Date: Mon, 05 Dec 2022 06:51:59 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] mesa: update 22.2.3 -> 22.3.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <NMLEMR.NA7JF86LUFN83@t-online.de>
In-Reply-To: 
	<CAMKF1srCn0tDWAxxpVCYhTZmow3uwy0tGqLXy2VDX0qBHDx2ZA@mail.gmail.com>
References: <20221201173942.1218836-1-f_l_k@t-online.de>
	<CAMKF1srCn0tDWAxxpVCYhTZmow3uwy0tGqLXy2VDX0qBHDx2ZA@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-J8+CfwbAMk7vjOpvlG7Z"
X-TOI-EXPURGATEID: 150726::1670219527-FAC5D742-0D753000/0/0 CLEAN NORMAL
X-TOI-MSGID: 2b2fcdf8-f209-4291-aeed-c5a7b4a2fb64
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Dec 2022 05:52:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174277

--=-J8+CfwbAMk7vjOpvlG7Z
Content-Type: text/plain; charset=us-ascii; format=flowed

Am So, 4. Dez 2022 um 09:23:49 -0800 schrieb Khem Raj 
<raj.khem@gmail.com>:
> Not sure if this is related  but I think its somewhere in egl headers
> provided by mesa.

This is related to an update of the egl headers in Mesa, just as you 
thought:
<https://github.com/meta-qt5/meta-qt5/pull/491>


--=-J8+CfwbAMk7vjOpvlG7Z
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am So, 4. Dez 2022 um 09:23:49 -0800 schrieb Khem Raj &lt;raj.khem@gmail.com&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Not sure if this is related  but I think its somewhere in egl headers
provided by mesa.</div></blockquote><div><br></div><div>This is related to an update of the egl headers in Mesa, just as you thought:</div><div><a href="https://github.com/meta-qt5/meta-qt5/pull/491">https://github.com/meta-qt5/meta-qt5/pull/491</a></div></div>
--=-J8+CfwbAMk7vjOpvlG7Z--


