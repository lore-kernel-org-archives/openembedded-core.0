Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9BD4C433EF
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 12:32:42 +0000 (UTC)
Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web08.10687.1652272355690139937
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 May 2022 05:32:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com
 ([174.114.107.13]:38802 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1nolW7-0002xQ-CC;
	Wed, 11 May 2022 08:32:34 -0400
Date: Wed, 11 May 2022 08:32:32 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Alexander Kanavin <alex.kanavin@gmail.com>
cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] local.conf.sample: add comments for missing
 machines
In-Reply-To: 
 <CANNYZj_-cRamxbQP6EUgmdz9Mt6x1bN0Aiz24ASo5G5a=pqPrw@mail.gmail.com>
Message-ID: <f23c8267-3efa-c628-98e-921981b92c19@crashcourse.ca>
References: <92f812a6-ab9b-71c-96c4-7f4ec307ddf@crashcourse.ca>
 <CANNYZj97C4Oy9fvkuTFSZM5hqJ4UU6xqdkQpGAKPpzVhNV0_Lg@mail.gmail.com>
 <d67b5988-49bf-b8e8-e8c3-2665f830d139@crashcourse.ca>
 <CANNYZj_-cRamxbQP6EUgmdz9Mt6x1bN0Aiz24ASo5G5a=pqPrw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id:
 rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 May 2022 12:32:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165499

On Wed, 11 May 2022, Alexander Kanavin wrote:

> I would rather just refer to the directory where 'additional, less
> well tested machines are'.
>
> Alex

  sure, something like that works for me.

rday

