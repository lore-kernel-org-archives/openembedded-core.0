Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD0BDC43217
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 15:29:20 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web10.120729.1669649357585830334
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Nov 2022 07:29:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout03.t-online.de (Postfix) with SMTP id 8F6452AE3;
	Mon, 28 Nov 2022 16:29:15 +0100 (CET)
Received: from [192.168.178.83] ([84.163.35.123]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ozg4J-0Bp6O00; Mon, 28 Nov 2022 16:29:15 +0100
Date: Mon, 28 Nov 2022 16:29:09 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv3] gcr: add recipe for gcr-4, needed to build
 with gtk4
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <LOD2MR.LVNPXKRBX1HA3@t-online.de>
In-Reply-To: 
	<CANNYZj-u-9qbexJvrhnjA=tnd08vnathK8zJdSwUcpykys9XvQ@mail.gmail.com>
References: <20221128151122.317262-1-f_l_k@t-online.de>
	<CANNYZj-u-9qbexJvrhnjA=tnd08vnathK8zJdSwUcpykys9XvQ@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-C50FA8C139qd8b5edW5h"
X-TOI-EXPURGATEID: 150726::1669649355-2E0B6EA1-51EB6C98/0/0 CLEAN NORMAL
X-TOI-MSGID: 803dedac-ab8d-47cf-871e-c444a3092472
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 15:29:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173924

--=-C50FA8C139qd8b5edW5h
Content-Type: text/plain; charset=us-ascii; format=flowed

I know that ;)

Just sent to see, if it would be ok for you like it is. I'll send the 
patch upstream.

Am Mo, 28. Nov 2022 um 16:21:35 +0100 schrieb Alexander Kanavin 
<alex.kanavin@gmail.com>:
> On Mon, 28 Nov 2022 at 16:11, Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>> wrote:
>>  +Upstream-Status: Pending
> 
> Please submit upstream first and include the link to the submission.
> I'm highly allergic to 'Pending' without a reason.
> 
> Alex
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173923): 
> <https://lists.openembedded.org/g/openembedded-core/message/173923>
> Mute This Topic: <https://lists.openembedded.org/mt/95309600/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org 
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-core/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-C50FA8C139qd8b5edW5h
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>I know that ;)</div><div><br></div><div>Just sent to see, if it would be ok for you like it is. I'll send the patch upstream.</div></div><div id="geary-quote" dir="auto"><br>Am Mo, 28. Nov 2022 um 16:21:35 +0100 schrieb Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">On Mon, 28 Nov 2022 at 16:11, Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt; wrote:
<blockquote> +Upstream-Status: Pending
</blockquote>
Please submit upstream first and include the link to the submission.
I'm highly allergic to 'Pending' without a reason.

Alex
</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#173923): <a href="https://lists.openembedded.org/g/openembedded-core/message/173923">https://lists.openembedded.org/g/openembedded-core/message/173923</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/95309600/3618223">https://lists.openembedded.org/mt/95309600/3618223</a>
Group Owner: <a href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-C50FA8C139qd8b5edW5h--


