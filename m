Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EB33C4332F
	for <webhook@archiver.kernel.org>; Tue, 22 Nov 2022 04:43:17 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.11397.1669092187957716317
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Nov 2022 20:43:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout09.t-online.de (Postfix) with SMTP id E16F3F937;
	Tue, 22 Nov 2022 05:43:05 +0100 (CET)
Received: from [192.168.0.74] ([24.134.105.89]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oxL7b-0yDz720; Tue, 22 Nov 2022 05:42:59 +0100
Date: Tue, 22 Nov 2022 05:42:53 +0100
From: f_l_k@t-online.de
Subject: Re: [oe-core][PATCH] python3: add ${bindir}/python symlink
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Message-Id: <HRFQLR.NFABK2KMZ9XR2@t-online.de>
In-Reply-To: 
	<CANNYZj-mhM6FzQY4Lv2BckodcLtPSUV29GG4TCUb_Tp003SAbw@mail.gmail.com>
References: <20221120175237.194899-1-f_l_k@t-online.de>
	<CAMKF1spErHg3JX+DFRLcW4EthTGBMm4A24XsyAVOO3RNr6Wgfw@mail.gmail.com>
	<CANNYZj-UTuxW0-Rr7FhgjwE007Gr28Pc5ZCo=cnrDcaNsuZStw@mail.gmail.com>
	<CAMKF1srs_tmRRNqWQAmBKOkJkfysJt=OZjefq_mPd4htPGi6VA@mail.gmail.com>
	<1729A925BA1D06C8.25787@lists.openembedded.org>
	<CANNYZj-mhM6FzQY4Lv2BckodcLtPSUV29GG4TCUb_Tp003SAbw@mail.gmail.com>
X-Mailer: geary/43.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-oRcPjLR3R1FM53QjxYtY"
X-TOI-EXPURGATEID: 150726::1669092179-F27F4ECF-3D7870BA/0/0 CLEAN NORMAL
X-TOI-MSGID: fe571a37-4560-4cbe-acfc-9ec2a39d0f83
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Nov 2022 04:43:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173668

--=-oRcPjLR3R1FM53QjxYtY
Content-Type: text/plain; charset=us-ascii; format=flowed

On Mon, Nov 21 2022 at 06:48:07 PM +0100, Alexander Kanavin 
<alex.kanavin@gmail.com> wrote:
> On my Debian systems, indeed, /usr/bin/python is absent.

Debian has a package for this
<https://packages.debian.org/bookworm/python-is-python3>


--=-oRcPjLR3R1FM53QjxYtY
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">On Mon, Nov 21 2022 at 06:48:07 PM +0100, Alexander Kanavin &lt;alex.kanavin@gmail.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">On my Debian systems, indeed, /usr/bin/python is absent.</div></blockquote><div><br></div><div>Debian has a package for this</div><div><a href="https://packages.debian.org/bookworm/python-is-python3">https://packages.debian.org/bookworm/python-is-python3</a></div></div>
--=-oRcPjLR3R1FM53QjxYtY--


