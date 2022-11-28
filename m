Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58AB6C4332F
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 16:19:11 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.122444.1669652341324124420
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Nov 2022 08:19:01 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout07.t-online.de (Postfix) with SMTP id 3CBD6ECCE;
	Mon, 28 Nov 2022 17:18:58 +0100 (CET)
Received: from [192.168.178.83] ([84.163.35.123]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ozgqP-1zmCuG0; Mon, 28 Nov 2022 17:18:57 +0100
Date: Mon, 28 Nov 2022 17:18:51 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv4] gcr: add recipe for gcr-4, needed to build
 with gtk4
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <FZF2MR.7F5Q4AGVD0AY1@t-online.de>
In-Reply-To: 
	<CANNYZj_4Y35Efqf=TZQczDHtYs6SbHOdmjjeQBFrG4H8f+AQ1g@mail.gmail.com>
References: <20221128160842.335665-1-f_l_k@t-online.de>
	<CANNYZj-kEos_m9v=M4t_w3gZLxrX7h4qvtV0WNHwy2zL=7sacQ@mail.gmail.com>
	<CANNYZj_4Y35Efqf=TZQczDHtYs6SbHOdmjjeQBFrG4H8f+AQ1g@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-kkSB8U5rBJ0NoVDBRx3y"
X-TOI-EXPURGATEID: 150726::1669652337-EDFED7E2-ACC7A8CE/0/0 CLEAN NORMAL
X-TOI-MSGID: 3ab64899-6718-469b-a933-c257ab330192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 16:19:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173931

--=-kkSB8U5rBJ0NoVDBRx3y
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Mo, 28. Nov 2022 um 17:13:09 +0100 schrieb Alexander Kanavin 
<alex.kanavin@gmail.com>:
> *adjusted to gcr3.

Thoght i also sent a patch for epiphany that does that adjustment, but 
maybe i forgot.

I've sent a v5 because i had a typo in the gpg_path. Hopefully its good 
like it is now


--=-kkSB8U5rBJ0NoVDBRx3y
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am Mo, 28. Nov 2022 um 17:13:09 +0100 schrieb Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">*adjusted to gcr3.</div></blockquote><div><br></div><div>Thoght i also sent a patch for epiphany that does that adjustment, but maybe i forgot.</div><div><br></div><div>I've sent a v5 because i had a typo in the gpg_path. Hopefully its good like it is now</div></div>
--=-kkSB8U5rBJ0NoVDBRx3y--


