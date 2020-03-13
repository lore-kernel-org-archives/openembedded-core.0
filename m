Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.openembedded.org (Postfix) with ESMTP id 436D960AEF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2020 16:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3000440C2B;
	Fri, 13 Mar 2020 16:40:18 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id mpaFANPE4X4w; Fri, 13 Mar 2020 16:40:18 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C948340C2A;
	Fri, 13 Mar 2020 16:40:15 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 04D64174456; Fri, 13 Mar 2020 12:40:15 -0400 (EDT)
Date: Fri, 13 Mar 2020 12:40:14 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: JH <jupiter.hce@gmail.com>
Message-ID: <20200313164014.GN1578@denix.org>
References: <CAA=hcWSGmz-GRFac-UR6AcTRyUYjvf1buRaYQvvCMrr__OuV_g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAA=hcWSGmz-GRFac-UR6AcTRyUYjvf1buRaYQvvCMrr__OuV_g@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Yocto discussion list <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] menuconf u-boot
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
X-List-Received-Date: Fri, 13 Mar 2020 16:40:17 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

What's u-boot-imx?

It's definitely not in openembedded-core, so there's no reason to cross-post 
there.

If google doesn't help, it's recommended to post such specific questions to 
the corresponding mailing list for the layer this recipe comes from.

If it's not clear where the recipe comes from, Layer Index can help:
https://layers.openembedded.org/

Thanks.

-- 
Denys


On Fri, Mar 13, 2020 at 08:15:17PM +1100, JH wrote:
> Hi,
> 
> I tried to run bitbake -c menuconfig u-boot, it popped up a terminal
> u-boot-imx configuration:
> 
> make: *** No rule make target 'menuconfig'. Stop.
> Command failed.
> Press any key to continue...
> 
> How can I  run menuconfig u-boot?
> 
> Thank you.
> 
> Kind regards,
> 
> - jh

> 


