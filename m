Return-Path: <Zubair.Kakakhel@imgtec.com>
Received: from mailapp01.imgtec.com (mailapp01.imgtec.com [195.59.15.196])
	by mail.openembedded.org (Postfix) with ESMTP id 42BF3755F8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Sep 2016 13:54:17 +0000 (UTC)
Received: from HHMAIL01.hh.imgtec.org (unknown [10.100.10.19])
	by Forcepoint Email with ESMTPS id 3A48740963AC3;
	Wed,  7 Sep 2016 14:54:03 +0100 (IST)
Received: from zkakakhel-linux.le.imgtec.org (192.168.154.45) by
	HHMAIL01.hh.imgtec.org (10.100.10.21) with Microsoft SMTP Server (TLS)
	id 14.3.294.0; Wed, 7 Sep 2016 14:54:06 +0100
To: =?UTF-8?Q?Andr=c3=a9_Draszik?= <git@andred.net>
References: <1472832102-8067-1-git-send-email-Zubair.Kakakhel@imgtec.com>
	<1472832102-8067-4-git-send-email-Zubair.Kakakhel@imgtec.com>
	<1472913207.20786.6.camel@andred.net>
	<1473161713.3374.3.camel@andred.net>
From: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
Message-ID: <687f59db-45ae-72e8-1ab6-cb4b481c8fe3@imgtec.com>
Date: Wed, 7 Sep 2016 14:54:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1473161713.3374.3.camel@andred.net>
X-Originating-IP: [192.168.154.45]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/4] libffi: Add patch for MIPS soft float
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Sep 2016 13:54:18 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 09/06/2016 12:35 PM, André Draszik wrote:
> On Sa, 2016-09-03 at 15:33 +0100, André Draszik wrote:
>> It looks like you are a few days to late - a slightly different patch was
>> applied upstream:
>>
>> https://github.com/libffi/libffi/pull/272
>>
>> It'd be good if you could update your OE patch to reference that one
>> instead, so that we get a real backport (unless it has problems of
>> course...)
>
> I took the liberty to do just that
> http://lists.openembedded.org/pipermail/openembedded-core/2016-September/126
> 183.html
>

Thanks!

ZubairLK

> Thank you for starting this thread :-)
>
> Cheers,
> Andre'
>
>>>>>
>>>

