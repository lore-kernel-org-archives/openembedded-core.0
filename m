Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6762C433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 08:21:40 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web09.24193.1647246099981508478
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 01:21:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80,
 mailfrom: f_l_k@t-online.de)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout01.t-online.de (Postfix) with SMTP id D55232621
	for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 09:21:37 +0100 (CET)
Received: from [192.168.178.83] ([84.163.47.243]) by fwd73.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nTfxR-0BjKML0; Mon, 14 Mar 2022 09:21:37 +0100
Message-ID: <74c5d185-8abe-6afe-724c-8cc7b6529997@t-online.de>
Date: Mon, 14 Mar 2022 09:21:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [oe-core][PATCHv2] cairo: update to v1.17.4
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <20220314071037.3702941-1-f_l_k@t-online.de>
 <CANNYZj98CMmxXUKXhGboOfK_9WTu499GL=EomTpw9Y3SWS3oaA@mail.gmail.com>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: 
 <CANNYZj98CMmxXUKXhGboOfK_9WTu499GL=EomTpw9Y3SWS3oaA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TOI-EXPURGATEID: 150726::1647246097-0000C4DD-C8E50BC9/0/0 CLEAN NORMAL
X-TOI-MSGID: 2614a4d2-3eea-4090-80ca-ccb60ba1becd
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 08:21:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163130


Am 14.03.22 um 09:13 schrieb Alexander Kanavin:
> 1.17.4 is not a release, it is a development snapshot.
>
> Alex
>

https://gitlab.freedesktop.org/cairo/cairo/-/tags

https://www.cairographics.org/news/

That was not mentioned here. I just thought because 16.0.0 is from 2018 
and some things might have been improved since then.


