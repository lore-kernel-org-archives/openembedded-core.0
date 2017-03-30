Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id D80C977C17;
	Thu, 30 Mar 2017 14:12:11 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3vv65Q0RXdz1qql6;
	Thu, 30 Mar 2017 16:12:10 +0200 (CEST)
Received: from localhost (dynscan01.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 3vv65P6Ygjz3hhTq;
	Thu, 30 Mar 2017 16:12:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan01.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id jYtN-MeE8lxg; Thu, 30 Mar 2017 16:12:08 +0200 (CEST)
X-Auth-Info: 3Qp3RjqZ6AuEEyjpQsWfFvDks37eMuR7BhIr0xwk/bc=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Thu, 30 Mar 2017 16:12:08 +0200 (CEST)
To: Denys Dmytriyenko <denis@denix.org>
References: <20170327142231.21807-1-marex@denx.de>
	<1490624701.13980.267.camel@linuxfoundation.org>
	<5c037512-7bf1-8a3c-cb76-fda7230781a0@denx.de>
	<20170329215658.GP15664@denix.org>
	<a5b043f0-b0ee-a74b-fd55-4f8d20669cba@denx.de>
	<20170330132447.GU15664@denix.org>
From: Marek Vasut <marex@denx.de>
Message-ID: <a8de81ca-4056-ad2c-4e38-1bd1b4c62315@denx.de>
Date: Thu, 30 Mar 2017 16:12:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <20170330132447.GU15664@denix.org>
Cc: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] u-boot: Update to 2017.03 release
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
X-List-Received-Date: Thu, 30 Mar 2017 14:12:13 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 03/30/2017 03:24 PM, Denys Dmytriyenko wrote:
> On Thu, Mar 30, 2017 at 10:21:31AM +0200, Marek Vasut wrote:
>> On 03/29/2017 11:56 PM, Denys Dmytriyenko wrote:
>>> On Mon, Mar 27, 2017 at 04:31:16PM +0200, Marek Vasut wrote:
>>>> On 03/27/2017 04:25 PM, Richard Purdie wrote:
>>>>> On Mon, 2017-03-27 at 16:22 +0200, Marek Vasut wrote:
>>>>>> Upgrade U-Boot to the latest version.
>>>>>
>>>>> Wrong list and how does this compare to Ovatio's patch?
>>>>
>>>> I was not CCed on Otavio's patch :(
>>>
>>> Yeah, me neither, unfortunately - people just ignore maintainers file now.
>>>
>>> Good thing Ross copied me on the other discussion!
>>>
>> Which other discussion ? :-(
> 
> http://lists.openembedded.org/pipermail/openembedded-core/2017-March/134682.html
> 
I see. I'm all for updating to 2017.03 , since it fixes the OMAP serial
bug too :)

-- 
Best regards,
Marek Vasut

