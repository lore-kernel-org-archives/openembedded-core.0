Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 6DED571C3D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2018 22:50:41 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 40mV5Z5V77z1qtH6;
	Thu, 17 May 2018 00:50:42 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 40mV5Z5299z1rDn3;
	Thu, 17 May 2018 00:50:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id fxDwA5Gt7YrY; Thu, 17 May 2018 00:50:41 +0200 (CEST)
X-Auth-Info: chQzxT671NV+zCMd05IB7momqy4VUwzXtP6Zkifi7O4=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Thu, 17 May 2018 00:50:41 +0200 (CEST)
To: "Burton, Ross" <ross.burton@intel.com>
References: <20180516201415.8002-1-marex@denx.de>
	<CAP9ODKrXkwobok9O9RsebrZ7eOQze_t_fL5KqXCcDvkk9B3DRQ@mail.gmail.com>
	<d2492e4a-0dab-21fc-8502-6bc1e19a34f3@denx.de>
	<CAJTo0LZqvWUgL1vj0dn7Ez0YUoS6iwG-bPEp5+gkopnDtitcKA@mail.gmail.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <b308c0c7-2a5e-4b9d-a0d1-eb4101db1233@denx.de>
Date: Thu, 17 May 2018 00:50:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZqvWUgL1vj0dn7Ez0YUoS6iwG-bPEp5+gkopnDtitcKA@mail.gmail.com>
Cc: Otavio Salvador <otavio.salvador@ossystems.com.br>,
	Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Upgrade to 2018.05 release
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
X-List-Received-Date: Wed, 16 May 2018 22:50:42 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05/17/2018 12:49 AM, Burton, Ross wrote:
> I was informed yesterday that AUH had just started, so you should be
> getting an email shortly...

Well, if it fails, feel free to pick this patch :)

> On 16 May 2018 at 23:37, Marek Vasut <marex@denx.de> wrote:
>> On 05/17/2018 12:00 AM, Otavio Salvador wrote:
>>> On Wed, May 16, 2018 at 5:14 PM, Marek Vasut <marex@denx.de> wrote:
>>>> This upgrades the U-Boot from 2018.03 to 2018.05 release.
>>>>
>>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>>> Cc: Otavio Salvador <otavio@ossystems.com.br>
>>>> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
>>>> Cc: Ross Burton <ross.burton@intel.com>
>>>
>>> Nice work :-)
>>
>> Except this kind of patch could (read should) be generated automatically
>> by the OE recipe auto-upgrade drone.
>>
>> --
>> Best regards,
>> Marek Vasut
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


-- 
Best regards,
Marek Vasut

