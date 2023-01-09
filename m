Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD81FC54EBD
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 14:41:48 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.73673.1673275301345127912
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Jan 2023 06:41:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout05.t-online.de (Postfix) with SMTP id 8237C153C7;
	Mon,  9 Jan 2023 15:41:38 +0100 (CET)
Received: from [192.168.178.83] ([84.154.169.211]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pEtLA-0tQjFA0; Mon, 9 Jan 2023 15:41:32 +0100
Date: Mon, 09 Jan 2023 15:41:26 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] librsvg: enable vapi build
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <2H38OR.AYR9WP52QW59@t-online.de>
In-Reply-To: 
	<CANNYZj-4_4V0TPQaCPKgCn=my4wgwz3s+tW0VSNjzxr1mv2f4Q@mail.gmail.com>
References: <20230109133437.84684-1-f_l_k@t-online.de>
	<CANNYZj-4_4V0TPQaCPKgCn=my4wgwz3s+tW0VSNjzxr1mv2f4Q@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-LuIMs0W/Oq8TxuQjWPVX"
X-TOI-EXPURGATEID: 150726::1673275292-4BFF22DC-04A3100C/0/0 CLEAN NORMAL
X-TOI-MSGID: d984fc15-3f8e-4b08-9a9d-907bd4f9c573
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Jan 2023 14:41:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175689

--=-LuIMs0W/Oq8TxuQjWPVX
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Mo, 9. Jan 2023 um 15:38:42 +0100 schrieb Alexander Kanavin 
<alex.kanavin@gmail.com>:
> This probably needs 'inherit vala' as well, so that dependencies are
> reliably pulled in?

inherit vala is already present, but wasn't enough


--=-LuIMs0W/Oq8TxuQjWPVX
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am Mo, 9. Jan 2023 um 15:38:42 +0100 schrieb Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">This probably needs 'inherit vala' as well, so that dependencies are
reliably pulled in?</div></blockquote><div><br></div><div>inherit vala is already present, but wasn't enough</div></div>
--=-LuIMs0W/Oq8TxuQjWPVX--


