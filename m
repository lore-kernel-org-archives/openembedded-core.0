Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC78FC77B7E
	for <webhook@archiver.kernel.org>; Sun, 28 May 2023 14:03:57 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web10.29394.1685282628542843966
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 May 2023 07:03:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd76.dcpf.telekom.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout07.t-online.de (Postfix) with SMTP id ACAFD4B5EA;
	Sun, 28 May 2023 16:03:45 +0200 (CEST)
Received: from [192.168.178.156] ([79.219.225.43]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1q3Gzh-1BOPJo0; Sun, 28 May 2023 16:03:37 +0200
Date: Sun, 28 May 2023 16:03:31 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH 2/4] python3: add libxcrypt-native dependency
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <VDGDVR.YBUKQ953M2TP3@t-online.de>
In-Reply-To: 
	<CANNYZj_jz-SCh4kq33fe7_uiVRAvL+15i4kQ=U9Dkv84W2s+xw@mail.gmail.com>
References: <20230527133252.284132-1-f_l_k@t-online.de>
	<20230527133252.284132-2-f_l_k@t-online.de>
	<17635252DFD4EDDE.6918@lists.openembedded.org>
	<CANNYZj_jz-SCh4kq33fe7_uiVRAvL+15i4kQ=U9Dkv84W2s+xw@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-UFpBnkYvbkOvovDcZs7k"
X-TOI-EXPURGATEID: 150726::1685282617-16FFE3A1-F7586008/0/0 CLEAN NORMAL
X-TOI-MSGID: 90b7f2a8-df32-4a66-bf76-903322545854
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 May 2023 14:03:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181827

--=-UFpBnkYvbkOvovDcZs7k
Content-Type: text/plain; charset=us-ascii; format=flowed

Am So, 28. Mai 2023 um 15:41:10 +0200 schrieb Alexander Kanavin 
<alex.kanavin@gmail.com>:
> Also, how is the native header used in the target build? Isn't that
> incorrect in itself?

I guess its only needed to build the native variants of that packages


--=-UFpBnkYvbkOvovDcZs7k
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am So, 28. Mai 2023 um 15:41:10 +0200 schrieb Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Also, how is the native header used in the target build? Isn't that
incorrect in itself?</div></blockquote><div><br></div><div>I guess its only needed to build the native variants of that packages</div></div>
--=-UFpBnkYvbkOvovDcZs7k--


