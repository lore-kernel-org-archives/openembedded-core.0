Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C641AC6FD1C
	for <webhook@archiver.kernel.org>; Sat, 25 Mar 2023 18:56:13 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.28625.1679770573129874168
 for <openembedded-core@lists.openembedded.org>;
 Sat, 25 Mar 2023 11:56:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd84.dcpf.telekom.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout09.t-online.de (Postfix) with SMTP id 2E81D1F08;
	Sat, 25 Mar 2023 19:56:10 +0100 (CET)
Received: from [192.168.178.83] ([84.154.174.49]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pg93e-1Hio6q0; Sat, 25 Mar 2023 19:56:06 +0100
Date: Sat, 25 Mar 2023 19:56:00 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH 7/7] webkitgtk: update 2.38.5 -> 2.40.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <C9B3SR.NAPPU9EQ2ILI3@t-online.de>
In-Reply-To: 
	<CANNYZj-RdghFdcmNa=NeA1tqxe1SkcgbsN3d2H18y54MrOzyVw@mail.gmail.com>
References: <20230325004818.2784943-1-f_l_k@t-online.de>
	<20230325004818.2784943-7-f_l_k@t-online.de>
	<CANNYZj-RdghFdcmNa=NeA1tqxe1SkcgbsN3d2H18y54MrOzyVw@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-lyX+BReAo5ZTnPv7q13v"
X-TOI-EXPURGATEID: 150726::1679770566-9AD51C79-B9D3874C/0/0 CLEAN NORMAL
X-TOI-MSGID: 29210a21-e4bd-4eec-bc3c-d481584e87e7
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 25 Mar 2023 18:56:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179104

--=-lyX+BReAo5ZTnPv7q13v
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Am Sa, 25. M=E4r 2023 um 19:35:57 +0100 schrieb Alexander Kanavin=20
<alex.kanavin@gmail.com>:
> Can you please name the gtk3 variant webkitgtk-3

Will do. I was afraid that webkitgtk-4 is confusing for the gtk3=20
variant, but named it anyway because meson reports that webkitgtk-4.0=20
is missing if it is not found. If the gtk4 variant is missing, meson=20
complains about missing webkitgtk-6.0


--=-lyX+BReAo5ZTnPv7q13v
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto">Am Sa, 25. M=E4r 2023 um 19:35:57 +0100=
 schrieb Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;:<br><blockquote t=
ype=3D"cite"><div class=3D"plaintext" style=3D"white-space: break-spaces;">=
Can you please name the gtk3 variant webkitgtk-3</div></blockquote><div><br=
></div><div>Will do. I was afraid that webkitgtk-4 is confusing for the gtk=
3 variant, but named it anyway because meson reports that webkitgtk-4.0 is =
missing if it is not found. If the gtk4 variant is missing, meson complains=
 about missing webkitgtk-6.0</div></div>
--=-lyX+BReAo5ZTnPv7q13v--


