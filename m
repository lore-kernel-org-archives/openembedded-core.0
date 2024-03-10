Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EA79C54791
	for <webhook@archiver.kernel.org>; Sun, 10 Mar 2024 15:56:33 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web10.40298.1710086181378604667
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Mar 2024 08:56:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout08.t-online.de (Postfix) with SMTP id 58E4B16846;
	Sun, 10 Mar 2024 16:56:19 +0100 (CET)
Received: from [192.168.178.67] ([84.154.166.16]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rjLX8-29A4OW0; Sun, 10 Mar 2024 16:56:18 +0100
Date: Sun, 10 Mar 2024 16:56:41 +0100
From: f_l_k@t-online.de
Subject: Re: [oe-core][PATCH] gtk4: update 4.12.5 -> 4.13.9
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Message-Id: <HY25AS.FPYH8NV384822@t-online.de>
In-Reply-To: <54530dfa95ef0ca744fde5ab2b83bb402e4a50fd.camel@linuxfoundation.org>
References: <17BB704B3D5D1758.5850@lists.openembedded.org>
	<R915AS.S2SD7P4CMM6X2@t-online.de>
	<54530dfa95ef0ca744fde5ab2b83bb402e4a50fd.camel@linuxfoundation.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-tIS2Lzt080Yj+3cbInsR"
X-TOI-EXPURGATEID: 150726::1710086178-327FB937-3F60001D/0/0 CLEAN NORMAL
X-TOI-MSGID: d8f4e696-a4c6-4f54-aab5-132c6e2c24fa
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Mar 2024 15:56:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196892

--=-tIS2Lzt080Yj+3cbInsR
Content-Type: text/plain; charset=us-ascii; format=flowed

On Sun, Mar 10 2024 at 08:48:39 AM -07:00:00, Richard Purdie 
<richard.purdie@linuxfoundation.org> wrote:
> Given where we are with release that does look preferable to an
> experimental GTK verison...

I'll do some tesing with this patches included in vala and will send a 
patch for it.
But I guess because of this blog post, that gtk 4.14 can be considered 
as almost ready
<https://blog.gtk.org/>


--=-tIS2Lzt080Yj+3cbInsR
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Sun, Mar 10 2024 at 08:48:39 AM -07:00:00, Richard Purdie &lt;richard.purdie@linuxfoundation.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">Given where we are with release that does look preferable to an
experimental GTK verison...</div></blockquote><div><br></div><div>I'll do some tesing with this patches included in vala and will send a patch for it.</div><div>But I guess because of this blog post, that gtk 4.14 can be considered as almost ready</div><div><a href="https://blog.gtk.org/">https://blog.gtk.org/</a></div></div>
--=-tIS2Lzt080Yj+3cbInsR--


