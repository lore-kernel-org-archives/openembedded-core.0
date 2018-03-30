Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 54B607454A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Mar 2018 03:30:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E39CE20B70;
	Fri, 30 Mar 2018 03:30:39 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id U92FUviWoJ6g; Fri, 30 Mar 2018 03:30:39 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B5A292098D;
	Fri, 30 Mar 2018 03:30:37 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 3DAE71633B2; Thu, 29 Mar 2018 23:30:37 -0400 (EDT)
Date: Thu, 29 Mar 2018 23:30:37 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20180330033037.GN2786@denix.org>
References: <cover.1521507765.git.denys@ti.com>
	<20180329224129.GK2786@denix.org>
	<CAJ86T=Xi01mESEX8D3YAXo1OXj5d93y8wXz5qJw1ffKqHeXjQQ@mail.gmail.com>
	<20180330001724.GL2786@denix.org>
	<CAMKF1soF7xRREZJAD65MpWQ+doNSfu=GwJcMVzNbA1nen3NcUg@mail.gmail.com>
	<20180330023408.GM2786@denix.org>
	<c49fc448-a79d-1492-a5d9-398968aacd83@gmail.com>
MIME-Version: 1.0
In-Reply-To: <c49fc448-a79d-1492-a5d9-398968aacd83@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Package upgrades
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
X-List-Received-Date: Fri, 30 Mar 2018 03:30:39 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 29, 2018 at 07:41:46PM -0700, Khem Raj wrote:
> On 3/29/18 7:34 PM, Denys Dmytriyenko wrote:
> >On Thu, Mar 29, 2018 at 06:38:58PM -0700, Khem Raj wrote:
> >>On Thu, Mar 29, 2018 at 5:17 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> >>>On Thu, Mar 29, 2018 at 04:39:27PM -0700, Andre McCurdy wrote:
> >>>>On Thu, Mar 29, 2018 at 3:41 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> >>>>>Ping. It's been 10 days - are there any issues with these updates?
> >>>>
> >>>>Only 10 days? :-)
> >>>
> >>>Yeah, I know, I'm too demanding... :)
> >>
> >>Ross does pick the patches from ml fairly quickly so always check
> >>
> >>http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=ross/mut
> >>
> >>or OE-Core's master-next
> >>
> >>http://git.openembedded.org/openembedded-core/log/?h=master-next
> >>
> >>from mut to master it might take a while since there are many patches coming in
> >>so integration takes time and sometimes there are issues with infra
> >>which can delay
> >>things,
> >
> >Yes, I'm quite aware of all the above - you don't have to mention all the
> >details to me.
> 
> I am glad thats the case. It was not clear from the message and some
> times this can be misconstrued.

You are absolutely right! After 10+ years in the OE community my mind and 
memory are not as sharp as they used to be - I keep forgetting things and do 
not communicate as clearly as before... :-P


> Still, it's a standard practice to inquire about own patches
> >once in a while. Especially since other similar non-critical updates are
> >merged right away. This is the only way to know if there were any issues with
> >the patches themselves, but Ross forgot or didn't have time to follow up yet.
> >
> >
> >>10 days seems pretty darn good in some cases its years see
> >>
> >>https://github.com/projectNe10/Ne10/pull/143
> >>
> >>in the end as long as it makes upstream.
> >
> >Heh, I don't think we should take that as an example to follow... :)
> >
> 

