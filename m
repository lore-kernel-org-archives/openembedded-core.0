Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 023F8C433F5
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 08:27:29 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web08.23789.1647246447529201467
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 01:27:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20,
 mailfrom: f_l_k@t-online.de)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout08.t-online.de (Postfix) with SMTP id 013568112
	for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 09:27:26 +0100 (CET)
Received: from [192.168.178.83] ([84.163.47.243]) by fwd78.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nTg33-41zvlJ0; Mon, 14 Mar 2022 09:27:25 +0100
Message-ID: <b85b5916-c9a1-0736-016a-431ccadf207d@t-online.de>
Date: Mon, 14 Mar 2022 09:27:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [oe-core][PATCHv2] cairo: update to v1.17.4
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <20220314071037.3702941-1-f_l_k@t-online.de>
 <CANNYZj98CMmxXUKXhGboOfK_9WTu499GL=EomTpw9Y3SWS3oaA@mail.gmail.com>
 <16DC3199EED64425.19757@lists.openembedded.org>
From: Markus Volk <f_l_k@t-online.de>
In-Reply-To: <16DC3199EED64425.19757@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TOI-EXPURGATEID: 150726::1647246445-0000AD4E-5630D3D2/19/7449444016 SUSPECT
 MAIL-COUNT
X-TOI-MSGID: 0f825dff-16e0-47ea-97d4-b1e44ac3e79c
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 08:27:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163131

Am 14.03.22 um 09:21 schrieb Markus Volk:
>
> Am 14.03.22 um 09:13 schrieb Alexander Kanavin:
>> 1.17.4 is not a release, it is a development snapshot.
>>
>> Alex
>>
>
Ah, I see. But on gitlab it is not well visible.
Thanks and sorry for the noise

