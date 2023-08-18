Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D2F7EE4984
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 17:43:10 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.747.1692380581834404003
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Aug 2023 10:43:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout05.t-online.de (Postfix) with SMTP id B67DC2239F;
	Fri, 18 Aug 2023 19:42:59 +0200 (CEST)
Received: from [192.168.178.58] ([84.154.160.29]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qX3Uv-4ap5ma0; Fri, 18 Aug 2023 19:42:57 +0200
Date: Fri, 18 Aug 2023 19:42:52 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv2] gtk4: upgrade 4.10.5 -> 4.12.0
To: Khem Raj <raj.khem@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Message-Id: <G7LLZR.6FLOA2CLJNX21@t-online.de>
In-Reply-To: <CAMKF1soQSYA1xg8iDciyVxxZSqxekVOv-tjaojiXXqgOqU4Pqg@mail.gmail.com>
References: <20230815145218.1561896-1-f_l_k@t-online.de>
	<CAMKF1spOpBLBQ4ENJGdidsCHbX0faejtvrB7rWmwPFBQjP2ZJQ@mail.gmail.com>
	<IHIJZR.16XNVQ6SKCIP1@t-online.de>
	<CAMKF1soQSYA1xg8iDciyVxxZSqxekVOv-tjaojiXXqgOqU4Pqg@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-bJOAgnQ0gUlBB4AwkNtV"
X-TOI-EXPURGATEID: 150726::1692380577-1F7F616C-03F162CD/0/0 CLEAN NORMAL
X-TOI-MSGID: 4fcde02b-313e-4843-926b-500203bbabc9
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 17:43:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186382

--=-bJOAgnQ0gUlBB4AwkNtV
Content-Type: text/plain; charset=us-ascii; format=flowed

On Thu, Aug 17 2023 at 08:12:56 AM -07:00:00, Khem Raj 
<raj.khem@gmail.com> wrote:
> 
> Perhaps need libgcc dev package on build host

Unfortunately that didn't help


--=-bJOAgnQ0gUlBB4AwkNtV
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Thu, Aug 17 2023 at 08:12:56 AM -07:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">
Perhaps need libgcc dev package on build host
</div></blockquote><div><br></div><div>Unfortunately that didn't help</div></div>
--=-bJOAgnQ0gUlBB4AwkNtV--


