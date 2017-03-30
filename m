Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id BAEB977CCA;
	Thu, 30 Mar 2017 18:06:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9EA1420B79;
	Thu, 30 Mar 2017 18:06:41 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id XGyzofAMsoZx; Thu, 30 Mar 2017 18:06:41 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 252E12010C;
	Thu, 30 Mar 2017 18:06:37 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 8CCC6162463; Thu, 30 Mar 2017 14:06:36 -0400 (EDT)
Date: Thu, 30 Mar 2017 14:06:36 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Marek Vasut <marex@denx.de>
Message-ID: <20170330180636.GV15664@denix.org>
References: <20170327142231.21807-1-marex@denx.de>
	<1490624701.13980.267.camel@linuxfoundation.org>
	<5c037512-7bf1-8a3c-cb76-fda7230781a0@denx.de>
	<20170329215658.GP15664@denix.org>
	<a5b043f0-b0ee-a74b-fd55-4f8d20669cba@denx.de>
	<20170330132447.GU15664@denix.org>
	<a8de81ca-4056-ad2c-4e38-1bd1b4c62315@denx.de>
MIME-Version: 1.0
In-Reply-To: <a8de81ca-4056-ad2c-4e38-1bd1b4c62315@denx.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
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
X-List-Received-Date: Thu, 30 Mar 2017 18:06:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 30, 2017 at 04:12:08PM +0200, Marek Vasut wrote:
> On 03/30/2017 03:24 PM, Denys Dmytriyenko wrote:
> > On Thu, Mar 30, 2017 at 10:21:31AM +0200, Marek Vasut wrote:
> >> On 03/29/2017 11:56 PM, Denys Dmytriyenko wrote:
> >>> On Mon, Mar 27, 2017 at 04:31:16PM +0200, Marek Vasut wrote:
> >>>> On 03/27/2017 04:25 PM, Richard Purdie wrote:
> >>>>> On Mon, 2017-03-27 at 16:22 +0200, Marek Vasut wrote:
> >>>>>> Upgrade U-Boot to the latest version.
> >>>>>
> >>>>> Wrong list and how does this compare to Ovatio's patch?
> >>>>
> >>>> I was not CCed on Otavio's patch :(
> >>>
> >>> Yeah, me neither, unfortunately - people just ignore maintainers file now.
> >>>
> >>> Good thing Ross copied me on the other discussion!
> >>>
> >> Which other discussion ? :-(
> > 
> > http://lists.openembedded.org/pipermail/openembedded-core/2017-March/134682.html
> > 
> I see. I'm all for updating to 2017.03 , since it fixes the OMAP serial
> bug too :)

"Known devil is better than unknown angel"? :)

-- 
Denys

