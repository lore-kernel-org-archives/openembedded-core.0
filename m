Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B4E0C46467
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 19:21:03 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.54941.1674156060160827589
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jan 2023 11:21:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd70.dcpf.telekom.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout02.t-online.de (Postfix) with SMTP id 773621120D;
	Thu, 19 Jan 2023 20:20:58 +0100 (CET)
Received: from [192.168.178.83] ([79.219.226.208]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pIaT3-15qgBU0; Thu, 19 Jan 2023 20:20:57 +0100
Date: Thu, 19 Jan 2023 20:20:51 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] gptfdisk: add follow-up patch to fix with
 current popt
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <R2ZQOR.M22U7G0N3KJT3@t-online.de>
In-Reply-To: 
	<CANNYZj-ihaDgJ1Nar=h6oxq0GcA_J4-jouWfTacdoViNmRZuTQ@mail.gmail.com>
References: <20230119131853.27372-1-f_l_k@t-online.de>
	<CANNYZj-ihaDgJ1Nar=h6oxq0GcA_J4-jouWfTacdoViNmRZuTQ@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-gVUii+jSiH93WAROqBx8"
X-TOI-EXPURGATEID: 150726::1674156057-15FFE778-561B0030/0/0 CLEAN NORMAL
X-TOI-MSGID: ae862abb-0ce5-4c15-9c3c-b4ae71b85d9e
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 19:21:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176163

--=-gVUii+jSiH93WAROqBx8
Content-Type: text/plain; charset=iso-8859-13; format=flowed
Content-Transfer-Encoding: quoted-printable

Am Do, 19. Jan 2023 um 16:14:58 +0100 schrieb Alexander Kanavin=20
<alex.kanavin@gmail.com>:
> It=FFs not a backport as source comes from source forge.

After registering on sourceforge, I found out that the original author=20
had submitted this patch about half a year ago without receiving any=20
comment so far. This reinforces my prejudice against code that is still=20
hosted there.

<https://sourceforge.net/p/gptfdisk/code/merge-requests/28/>


--=-gVUii+jSiH93WAROqBx8
Content-Type: text/html; charset=iso-8859-13
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto">Am Do, 19. Jan 2023 um 16:14:58 +0100 s=
chrieb Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;:<br><blockquote typ=
e=3D"cite">It=FFs not a backport as source comes from source forge. </block=
quote><div><br></div><div>After registering on sourceforge, I found out tha=
t the original author had submitted this patch about half a year ago withou=
t receiving any comment so far. This reinforces my prejudice against code t=
hat is still hosted there.</div><div><br></div><div><a href=3D"https://sour=
ceforge.net/p/gptfdisk/code/merge-requests/28/">https://sourceforge.net/p/g=
ptfdisk/code/merge-requests/28/</a></div></div>
--=-gVUii+jSiH93WAROqBx8--


