Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B73CCCF9EE
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 21:00:51 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.14404.1761771641578385739
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Oct 2025 14:00:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=zF+llxIO;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:References:
	Message-ID:In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TwMLIhbVJtKeVTNQyK7Ux2fxo9xh3lu8hNcFfKBIkBs=; b=zF+llxIOAPzRm0SGTnG/cMsVS5
	ZiRxabzXwzYx5FEzRgGbL1jJz+7Kr2qvkFhLcSmi1LIDS7UKENFVR0ad20t+si8J9bfVHoM1CJ2TO
	dJ7mDFB1m0h2Y7dBP5lwkLHPLSZW4906mQ0p3BwvZ5mpJfXSCfFoPHFzGanxazjvH8+CGiRC0REel
	1/3oqbI8T4R5/MUwX+neuY2cf5Fd95PjQxoEjmqQiuNZAWWXkudKM0/yAw3vADd6FjOcXe2++AiyY
	NcTDjXvqd/QLcjH122hDcDrdHegH49/+LwJRjQK4V+ljlLyoFOGXTZuOtDuw2SK50BUS8faDb41Md
	w8PlkoeQ==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:39266 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1vEDHR-0000000HOs2-16Yw;
	Wed, 29 Oct 2025 17:00:36 -0400
Date: Wed, 29 Oct 2025 17:03:13 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Denys Dmytriyenko <denis@denix.org>
cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>, 
    openembedded-core <openembedded-core@lists.openembedded.org>, 
    Yocto Project <yocto@lists.yoctoproject.org>, 
    openembedded-members@lists.openembedded.org
Subject: Re: [OE-core] OpenEmbedded Happy Hour October 29 9pm/2100 UTC
In-Reply-To: <20251029160837.GF3125@denix.org>
Message-ID: <a85dbda9-c12f-06f6-9ea1-10370260bf73@crashcourse.ca>
References: <20251029160837.GF3125@denix.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 21:00:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225473

On Wed, 29 Oct 2025, Denys Dmytriyenko wrote:

> All,
>
> Sorry for last minute reminder, but we have our monthly OpenEmbedded Happy
> Hour today, Wednesday October 29 at 2100/9pm UTC (5pm ET/2pm PT). This is a
> later timeslot for the APAC (Asia-Pacific) region.
>
> https://www.openembedded.org/wiki/Calendar
> https://www.openembedded.org/wiki/Happy_Hours
> https://www.timeanddate.com/worldclock/fixedtime.html?msg=OpenEmbedded+Happy+Hour+October+29&iso=20251029T21

  is this meetup happening?

rday

