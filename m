Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59F85C74A5B
	for <webhook@archiver.kernel.org>; Sun, 26 Mar 2023 17:07:34 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.14588.1679850444954462179
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Mar 2023 10:07:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd75.dcpf.telekom.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout02.t-online.de (Postfix) with SMTP id 05AA3B678;
	Sun, 26 Mar 2023 19:07:23 +0200 (CEST)
Received: from [192.168.178.83] ([79.219.238.34]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pgTpx-4cfU800; Sun, 26 Mar 2023 19:07:21 +0200
Date: Sun, 26 Mar 2023 19:07:15 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH 7/7] webkitgtk: update 2.38.5 -> 2.40.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <3W05SR.XD3X7RLZ6HDM1@t-online.de>
In-Reply-To: 
	<CANNYZj-BQ2mgoPR9iOx4RVsSo6eiC5bgSt=YbcxSY=d6xgEO5g@mail.gmail.com>
References: <20230325004818.2784943-1-f_l_k@t-online.de>
	<20230325004818.2784943-7-f_l_k@t-online.de>
	<CANNYZj-RdghFdcmNa=NeA1tqxe1SkcgbsN3d2H18y54MrOzyVw@mail.gmail.com>
	<174FBE6FF0B9B09E.25304@lists.openembedded.org>
	<98D3SR.ES0FR9UCE62O2@t-online.de>
	<CANNYZj-BQ2mgoPR9iOx4RVsSo6eiC5bgSt=YbcxSY=d6xgEO5g@mail.gmail.com>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-6MyNIRsGJfvlLb67uol7"
X-TOI-EXPURGATEID: 150726::1679850441-DB7FDC10-E913E107/0/0 CLEAN NORMAL
X-TOI-MSGID: 30904cc5-720f-42be-b3a7-c66ec36b4eeb
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Mar 2023 17:07:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179132

--=-6MyNIRsGJfvlLb67uol7
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Am So, 26. M=E4r 2023 um 18:57:07 +0200 schrieb Alexander Kanavin=20
<alex.kanavin@gmail.com>:
> at which point everyone would just be using webkitgtk as they
> do now.

Thats why I named the gtk4 recipe just 'webkitgtk'
I have now renamed the gtk3 recipe from webkitgtk-4 to webkitgtk-3.=20
It's just confusing that the gtk3 variant has api version 4.0, but=20
that's how it is


--=-6MyNIRsGJfvlLb67uol7
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto">Am So, 26. M=E4r 2023 um 18:57:07 +0200=
 schrieb Alexander Kanavin &lt;alex.kanavin@gmail.com&gt;:<br><blockquote t=
ype=3D"cite"><div class=3D"plaintext" style=3D"white-space: break-spaces;">=
at which point everyone would just be using webkitgtk as they
do now.</div></blockquote><div><br></div><div>Thats why I named the gtk4 re=
cipe just 'webkitgtk'</div><div>I have now renamed the gtk3 recipe from web=
kitgtk-4 to webkitgtk-3. It's just confusing that the gtk3 variant has api =
version 4.0, but that's how it is</div></div>
--=-6MyNIRsGJfvlLb67uol7--


