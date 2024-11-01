Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE04DE6B251
	for <webhook@archiver.kernel.org>; Fri,  1 Nov 2024 12:14:14 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.36052.1730463249560127094
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Nov 2024 05:14:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout06.t-online.de (Postfix) with SMTP id 58556703;
	Fri,  1 Nov 2024 13:14:07 +0100 (CET)
Received: from [192.168.178.67] ([84.154.160.37]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1t6qXW-25I0hM0; Fri, 1 Nov 2024 13:14:06 +0100
Date: Fri, 01 Nov 2024 13:16:09 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] u-boot: Add patch to use SWIG_AppendOutput
To: Ross Burton <ross.burton@arm.com>, Fabio Estevam <festevam@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <X2U9MS.9S6ZZUZOZ4V01@t-online.de>
In-Reply-To: <6EDDD5DE-CB20-4E1C-BE71-8363D60CA8AA@arm.com>
	<CAOMZO5CP4AK7jgnphmhFw_bRHL=WMubsyQU1p--m-A6bhGjT7Q@mail.gmail.com>
References: <20241030052443.855752-1-f_l_k@t-online.de>
	<6EDDD5DE-CB20-4E1C-BE71-8363D60CA8AA@arm.com>
	<CAOMZO5CP4AK7jgnphmhFw_bRHL=WMubsyQU1p--m-A6bhGjT7Q@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-snIWG5iA1oiiQetRoH64"
X-TOI-EXPURGATEID: 150726::1730463246-1AFF35EF-27D190B9/0/0 CLEAN NORMAL
X-TOI-MSGID: 51f21293-83a2-4d87-98f9-c9b4942b2474
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Nov 2024 12:14:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206620

--=-snIWG5iA1oiiQetRoH64
Content-Type: text/plain; charset=us-ascii; format=flowed

On Fri, Nov 1 2024 at 12:03:25 PM +00:00:00, Ross Burton 
<ross.burton@arm.com> wrote:
> 
> Please include a link to the submision.

I had to send the patch directly to the u-boot mailinglist and by the 
time I sent it I was still waiting for the confirmation of my 
registration.
Therefore I had no link to add. Meanwhile this was updated
<https://git.yoctoproject.org/poky/commit/?h=master-next&id=1acf3092ff5849de12bfe047b317263ca3e21dd6>


--=-snIWG5iA1oiiQetRoH64
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Fri, Nov 1 2024 at 12:03:25 PM +00:00:00, Ross Burton &lt;ross.burton@arm.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">
Please include a link to the submision.</div></blockquote><div><br></div><div>I had to send the patch directly to the u-boot mailinglist and by the time I sent it I was still waiting for the confirmation of my registration.</div><div>Therefore I had no link to add.&nbsp;<span style="white-space: break-spaces;">Meanwhile this was updated</span></div><div><a href="https://git.yoctoproject.org/poky/commit/?h=master-next&amp;id=1acf3092ff5849de12bfe047b317263ca3e21dd6">https://git.yoctoproject.org/poky/commit/?h=master-next&amp;id=1acf3092ff5849de12bfe047b317263ca3e21dd6</a></div></div>
--=-snIWG5iA1oiiQetRoH64--


