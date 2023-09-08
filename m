Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A78FEE8012
	for <webhook@archiver.kernel.org>; Fri,  8 Sep 2023 14:50:49 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.41155.1694184648075051951
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Sep 2023 07:50:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout07.t-online.de (Postfix) with SMTP id 9325218ACD;
	Fri,  8 Sep 2023 16:49:59 +0200 (CEST)
Received: from [192.168.178.62] ([84.154.164.221]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qeco2-05fQVE0; Fri, 8 Sep 2023 16:49:59 +0200
Date: Fri, 08 Sep 2023 16:49:57 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [RFC][oe-core][PATCH] RFC: import libxmlb and appstream from
 meta-oe
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Message-Id: <979O0S.V20BILGPT5R33@t-online.de>
In-Reply-To: <CANNYZj9GY+=1POX_=jy+N+hin_XEn9J=Oid9OwmK+B__oeSkTg@mail.gmail.com>
References: <20230908130407.2676-1-f_l_k@t-online.de>
	<CANNYZj9iLmrSma2_PSpUijOoR5BMvgw5ueoNgzuwQDjDYbt6qg@mail.gmail.com>
	<CANNYZj9GY+=1POX_=jy+N+hin_XEn9J=Oid9OwmK+B__oeSkTg@mail.gmail.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-lG2cj90BJ0AoO8Aychfj"
X-TOI-EXPURGATEID: 150726::1694184599-45FFA5E3-0CD5E4E3/0/0 CLEAN NORMAL
X-TOI-MSGID: c2ef71ce-bb2b-4548-b7d6-db730cba8959
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Sep 2023 14:50:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187436

--=-lG2cj90BJ0AoO8Aychfj
Content-Type: text/plain; charset=us-ascii; format=flowed

On Fri, Sep 8 2023 at 03:45:34 PM +02:00:00, Alexander Kanavin 
<alex.kanavin@gmail.com> wrote:
> 0001-fix-crosscompile.patch needs to be split in two, both parts
> properly described and submitted upstream.

The good news is, that the first issue seems to be fixed with the 
latest appstream update.

I'll send an update


--=-lG2cj90BJ0AoO8Aychfj
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Fri, Sep 8 2023 at 03:45:34 PM +02:00:00, Alexander Kanavin &lt;alex.kanavin@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">0001-fix-crosscompile.patch needs to be split in two, both parts
properly described and submitted upstream.</div></blockquote><div><br></div><div>The good news is, that the first issue seems to be fixed with the latest appstream update.</div><div><br></div><div>I'll send an update&nbsp;</div></div>
--=-lG2cj90BJ0AoO8Aychfj--


