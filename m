Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 166CBC433FE
	for <webhook@archiver.kernel.org>; Fri, 24 Sep 2021 22:19:18 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.309.1632521956468444692
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Sep 2021 15:19:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4AD6240C46;
	Fri, 24 Sep 2021 22:19:15 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R6aQySbF_xZx; Fri, 24 Sep 2021 22:19:15 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0A3D940C1C;
	Fri, 24 Sep 2021 22:19:10 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 5E603174675; Fri, 24 Sep 2021 18:19:10 -0400 (EDT)
Date: Fri, 24 Sep 2021 18:19:10 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "openembedded-devel@lists.openembedded.org"
 <openembedded-devel@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>,
	openembedded-architecture <openembedded-architecture@lists.openembedded.org>,
	Yocto Project <yocto@yoctoproject.org>,
	openembedded-members@lists.openembedded.org
Subject: Re: OpenEmbedded Happy Hour August 25 9pm/2100 UTC
Message-ID: <20210924221910.GQ1528@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Sep 2021 22:19:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156339

All,

As you are aware, next week is LF Embedded Linux Conference, which coincides 
with our OE Happy Hour. The Board has decided to extend the Happy Hour for the 
entire duration of Wednesday ELC sessions for people to come and go throughout 
the day and meet during breaks or for the entire hallway sessions. Hope to see 
you there!

https://www.openembedded.org/wiki/Happy_Hours

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

