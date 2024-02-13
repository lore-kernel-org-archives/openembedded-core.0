Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3920AC48260
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 08:20:33 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.6969.1707812427506744033
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 00:20:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=gPEtLMK2;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: michael.opdenacker@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 63A6C1C0006;
	Tue, 13 Feb 2024 08:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707812425;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z3bF+PZamS84yoxkGOy1QR8XpXyL3LqaJ7w+O88fTuE=;
	b=gPEtLMK2ppxPXCcbj51OvUU3t9ukz9KnXvJkdNBle56ucVF/vtZDEgB1jDl5aGuQrA1UbG
	nTpLWxT88TQd/N5Sq4pfamEGo1i/M+xUuRDo7nR2F7d/QPCxqXSkr3WDhnlEyV1yl0Bmpr
	4MfSrgeALAE5SW2BLVw8rby1fGwp4YYveh0fyCrYJrgfamX+4mT5oQbxd86bsmkofq2wB3
	fdKps5jfXx9yFKH0fK++haLACgidl7YjC6e38khFHgxApuiLwY26GZ52LykYeAZc+a9Pq5
	1xUe3ZS7y1r8QF8jcumlfmMWhD4JN3KlDjJWBhKMY51HekELdnIEhiLOHGNJUg==
Message-ID: <d6950508-cf44-4c19-ae2a-e54b61cb589b@bootlin.com>
Date: Tue, 13 Feb 2024 09:20:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] Want to contribute in open source project
Content-Language: en-US
To: dnyandev <padalkards17082001@gmail.com>
References: <CAMqbpQJgABOp6XCiLg74QyVY=5wjU4wW_BC52-kJS4A=iC34Hw@mail.gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <CAMqbpQJgABOp6XCiLg74QyVY=5wjU4wW_BC52-kJS4A=iC34Hw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: michael.opdenacker@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 08:20:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195370

Hi

If you are interested in contributing to the Yocto Project, you can 
check out this video: https://youtu.be/IqC_GN7HBoM
And then check our Contributor Guide: 
https://docs.yoctoproject.org/contributor-guide/

Of course, many other projects are interested in contributions. Select 
your favorite topics and projects!

What's great with the OpenEmbeded and Yocto Project community though, is 
that it is really welcoming and it's really rewarding to contribute to it :)

Thanks
Michael.

On 2/13/24 at 08:38, dnyandev wrote:
> Hi,
> Want to subscribe to this group so I can contribute in open source project
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#195368): https://lists.openembedded.org/g/openembedded-core/message/195368
> Mute This Topic: https://lists.openembedded.org/mt/104328600/1051844
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [michael.opdenacker@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


