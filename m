Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FEC8CD37B0
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 11:29:14 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.48926.1695036546704054381
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Sep 2023 04:29:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout01.t-online.de (Postfix) with SMTP id 13B1616E0D;
	Mon, 18 Sep 2023 13:29:03 +0200 (CEST)
Received: from [192.168.178.62] ([84.154.161.214]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qiCR3-1dxqNc0; Mon, 18 Sep 2023 13:29:02 +0200
Date: Mon, 18 Sep 2023 13:29:01 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH 1/4] libxmlb: import recipe from meta-oe
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <DKI61S.U4D11V8BDTPG3@t-online.de>
In-Reply-To: <64a23553aec159f4d506efd799eca893c7d9f25c.camel@linuxfoundation.org>
References: <20230917182829.2153680-1-f_l_k@t-online.de>
	<64a23553aec159f4d506efd799eca893c7d9f25c.camel@linuxfoundation.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-PPSN4s+S9iIlLkTErsuE"
X-TOI-EXPURGATEID: 150726::1695036542-CD6279BF-A8E77DB9/0/0 CLEAN NORMAL
X-TOI-MSGID: 48461da2-83fc-4fcb-8f65-17fd31b835b8
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Sep 2023 11:29:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187824

--=-PPSN4s+S9iIlLkTErsuE
Content-Type: text/plain; charset=us-ascii; format=flowed

On Mon, Sep 18 2023 at 12:24:40 PM +01:00:00, Richard Purdie 
<richard.purdie@linuxfoundation.org> wrote:
> (and I suspect warnings from other targets will follow)

yes, I noticed that too. However, I couldn't decide where it had to be 
entered and whether at all. That's why I left this question open


--=-PPSN4s+S9iIlLkTErsuE
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Mon, Sep 18 2023 at 12:24:40 PM +01:00:00, Richard Purdie &lt;richard.purdie@linuxfoundation.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">(and I suspect warnings from other targets will follow)</div></blockquote><div><br></div><div>yes, I noticed that too. However, I couldn't decide where it had to be entered and whether at all. That's why I left this question open</div></div>
--=-PPSN4s+S9iIlLkTErsuE--


