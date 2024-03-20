Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B754C54E58
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 17:55:44 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.52571.1710957343578131426
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Mar 2024 10:55:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout03.t-online.de (Postfix) with SMTP id 6FAF83200A;
	Wed, 20 Mar 2024 18:55:41 +0100 (CET)
Received: from [192.168.178.67] ([84.163.34.101]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rn0A6-0wiDR20; Wed, 20 Mar 2024 18:55:38 +0100
Date: Wed, 20 Mar 2024 18:55:51 +0100
From: f_l_k@t-online.de
Subject: Re: Patchtest results for [oe-core][PATCH 2/2] vte: update 0.74.2 ->
 0.76.0
To: patchtest@automation.yoctoproject.org
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Message-Id: <35RNAS.SQ8283MOGJJ92@t-online.de>
In-Reply-To: <0101018e5b299d32-7e077af3-f146-4cef-8dcb-a000b160377d-000000@us-west-2.amazonses.com>
References: <20240320085846.206946-2-f_l_k@t-online.de>
	<0101018e5b299d32-7e077af3-f146-4cef-8dcb-a000b160377d-000000@us-west-2.amazonses.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-ndpik7/sekf9dz07TxgR"
X-TOI-EXPURGATEID: 150726::1710957338-3E7FB877-DD04038E/0/0 CLEAN NORMAL
X-TOI-MSGID: bad84595-fd44-4297-bfdf-4892ebd21970
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Mar 2024 17:55:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197400

--=-ndpik7/sekf9dz07TxgR
Content-Type: text/plain; charset=us-ascii; format=flowed

On Wed, Mar 20 2024 at 09:20:37 AM +00:00:00, 
patchtest@automation.yoctoproject.org wrote:
> vte

This also lacks lz4 dependency. I'll send a v2 for it later


--=-ndpik7/sekf9dz07TxgR
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Wed, Mar 20 2024 at 09:20:37 AM +00:00:00, patchtest@automation.yoctoproject.org wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">vte</div></blockquote><div><br></div><div>This also lacks lz4 dependency. I'll send a v2 for it later</div></div>
--=-ndpik7/sekf9dz07TxgR--


