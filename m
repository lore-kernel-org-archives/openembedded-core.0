Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F7E8C43217
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 16:09:05 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.48010.1669910937013402823
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 08:08:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout09.t-online.de (Postfix) with SMTP id 1FE46861C;
	Thu,  1 Dec 2022 17:08:55 +0100 (CET)
Received: from [192.168.178.83] ([84.163.47.248]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p0m7K-0TOa9o0; Thu, 1 Dec 2022 17:08:54 +0100
Date: Thu, 01 Dec 2022 17:08:48 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv9 2/4] gtk4: import recipe from meta-gnome
To: alexandre.belloni@bootlin.com
Cc: openembedded-core@lists.openembedded.org
Message-Id: <OIZ7MR.VM2Q4UMI1AIU3@t-online.de>
In-Reply-To: <Y4jERD8ExQRQOfq1@mail.local>
References: <20221201075324.353632-1-f_l_k@t-online.de>
	<20221201075324.353632-2-f_l_k@t-online.de> <Y4iNKi5QtUlRdzrW@mail.local>
	<Y4jERD8ExQRQOfq1@mail.local>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-eK0bXSgZ1HmqyMjdn5kS"
X-TOI-EXPURGATEID: 150726::1669910934-E7FDB07E-AEBFD988/0/0 CLEAN NORMAL
X-TOI-MSGID: d43c6fd0-0202-4021-b7f4-0aaa5d7ed643
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 16:09:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174197

--=-eK0bXSgZ1HmqyMjdn5kS
Content-Type: text/plain; charset=us-ascii; format=flowed

Am Do, 1. Dez 2022 um 16:12:04 +0100 schrieb Alexandre Belloni via 
lists.openembedded.org 
<alexandre.belloni=bootlin.com@lists.openembedded.org>:
> ../gcr-4.0.0/docs/meson.build:1:0: ERROR: Program 'gi-docgen' not 
> found or not executable

Added a PACKAGECONFIG for iso-codes install and made sure i was able to 
create doc for gcr


--=-eK0bXSgZ1HmqyMjdn5kS
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">Am Do, 1. Dez 2022 um 16:12:04 +0100 schrieb Alexandre Belloni via lists.openembedded.org &lt;alexandre.belloni=bootlin.com@lists.openembedded.org&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">../gcr-4.0.0/docs/meson.build:1:0: ERROR: Program 'gi-docgen' not found or not executable</div></blockquote><div><br></div><div>Added a PACKAGECONFIG for iso-codes install and made sure i was able to create doc for gcr</div></div>
--=-eK0bXSgZ1HmqyMjdn5kS--


