Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 52DA571978
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Oct 2016 19:30:02 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3t3NX74C95z3hjS7;
	Tue, 25 Oct 2016 21:29:59 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.68])
	by mail.m-online.net (Postfix) with ESMTP id 3t3NX73K3RzvkrB;
	Tue, 25 Oct 2016 21:29:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.68]) (amavisd-new,
	port 10024)
	with ESMTP id AbnpYqM5r92o; Tue, 25 Oct 2016 21:29:58 +0200 (CEST)
X-Auth-Info: QPChue0SCOPEi+CS1FNb870PF/lyfMpd4gRTx2qByh8=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Tue, 25 Oct 2016 21:29:58 +0200 (CEST)
To: Denys Dmytriyenko <denis@denix.org>
References: <20161020133514.3403-1-marex@denx.de>
	<CAJTo0LZeox5Xe6hpnH82JZLaMb1_LtuUjKpcZtmcLOAOnosSUg@mail.gmail.com>
	<016763e0-b2cb-0c2c-f0d0-219da1c1faa3@denx.de>
	<20161025183239.GF2494@denix.org>
From: Marek Vasut <marex@denx.de>
Message-ID: <83c5347a-3962-7b3b-30d3-d5ee876fc2aa@denx.de>
Date: Tue, 25 Oct 2016 21:24:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161025183239.GF2494@denix.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] u-boot: Update to 2016.09.01 release
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
X-List-Received-Date: Tue, 25 Oct 2016 19:30:04 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 10/25/2016 08:32 PM, Denys Dmytriyenko wrote:
> On Sat, Oct 22, 2016 at 10:32:12PM +0200, Marek Vasut wrote:
>> On 10/21/2016 09:47 AM, Burton, Ross wrote:
>>
>> Hi!
>>
>>> On 20 October 2016 at 14:35, Marek Vasut <marex@denx.de
>>> <mailto:marex@denx.de>> wrote:
>>>
>>>     Upgrade U-Boot to the latest version.
>>>
>>>
>>> As usual, u-boot-mkimage broke again:
>>
>> That's weird, I successfully built it for nios2 during my tests.
>> Can you tell me how I can replicate the issue , so I can test for it to
>> prevent regression and roll out a patch ?
> 
> Marek, Ross,
> 
> Any progress on this? Need any help testing?
> 
Yeah, how do you replicate this issue ?

-- 
Best regards,
Marek Vasut

