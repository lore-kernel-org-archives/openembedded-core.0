Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED1A7C87FCB
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 09:31:48 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.31048.1753867905222709985
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jul 2025 02:31:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout04.t-online.de (Postfix) with SMTP id 6B2E2E68B;
	Wed, 30 Jul 2025 11:31:29 +0200 (CEST)
Received: from [192.168.178.20] ([84.154.171.105]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uh39g-1Bg0Rs0; Wed, 30 Jul 2025 11:31:24 +0200
Date: Wed, 30 Jul 2025 11:31:19 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH]] autoconf-archive: add backport patch to fix gl
 detection
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <74H70T.DXL1NF4Q4NVS1@t-online.de>
In-Reply-To: <CAMKF1sqL2Cnm5SPs3Bu=yfN6QiWjGq9uQKtShEQXmuFtmy5S0Q@mail.gmail.com>
References: <20250729103126.1806165-1-f_l_k@t-online.de>
	<CAMKF1sqL2Cnm5SPs3Bu=yfN6QiWjGq9uQKtShEQXmuFtmy5S0Q@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-dJmxLy1lewTsU+Lb8HoE"
X-TOI-EXPURGATEID: 150726::1753867884-32FF353D-FE2AC724/0/0 CLEAN NORMAL
X-TOI-MSGID: e24c9709-0816-4ff6-a409-44a334cc964b
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 09:31:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221115

--=-dJmxLy1lewTsU+Lb8HoE
Content-Type: text/plain; charset=us-ascii; format=flowed

On Tue, Jul 29 2025 at 16:22:29 -07:00:00, Khem Raj 
<raj.khem@gmail.com> wrote:
> There is one extra ] in the subject line

I sent v2


--=-dJmxLy1lewTsU+Lb8HoE
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Tue, Jul 29 2025 at 16:22:29 -07:00:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">There is one extra ] in the subject line</div></blockquote><div><br></div><div>I sent v2</div></div>
--=-dJmxLy1lewTsU+Lb8HoE--


