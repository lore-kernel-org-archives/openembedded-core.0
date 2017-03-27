Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id AF99C72F62
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 15:47:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2771620B84;
	Mon, 27 Mar 2017 15:48:00 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ax-5ZUANeyqv; Mon, 27 Mar 2017 15:48:00 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 05A61208B3;
	Mon, 27 Mar 2017 15:47:57 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 82ADB16242D; Mon, 27 Mar 2017 11:47:57 -0400 (EDT)
Date: Mon, 27 Mar 2017 11:47:57 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20170327154757.GJ15664@denix.org>
References: <20170326200813.23705-1-otavio@ossystems.com.br>
	<20170326211438.GI15664@denix.org>
	<CAJTo0LZ_V3p43c55r5cjhxp8K5ABf-001Dx=S-V0GtASPp2-tQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZ_V3p43c55r5cjhxp8K5ABf-001Dx=S-V0GtASPp2-tQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 27 Mar 2017 15:47:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 27, 2017 at 02:19:56PM +0100, Burton, Ross wrote:
> On 26 March 2017 at 22:14, Denys Dmytriyenko <denis@denix.org> wrote:
> 
> > At least 2 typos in the description...
> >
> 
> Typos aside, this is past the M3 deadline but RC2 is running late, is there
> a good reason to have the upgrade in?
> 
> Also what boards has it been tested on?  As it's from Otavio I presume the
> Freescale boards have been tested.  Denys, have you tested this version on
> your boards?

Ross,

I haven't personally tested 2017.03 yet, as we are staying on 2017.01 for a 
bit longer...

-- 
Denys

