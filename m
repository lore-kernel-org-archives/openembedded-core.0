Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 0CBCC71C7E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 15:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id AD7FA208FB;
	Mon, 20 Mar 2017 15:07:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id STLREXum8TYt; Mon, 20 Mar 2017 15:07:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7CFA9208DA;
	Mon, 20 Mar 2017 15:07:17 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 0D132162413; Mon, 20 Mar 2017 11:07:17 -0400 (EDT)
Date: Mon, 20 Mar 2017 11:07:17 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20170320150717.GZ15664@denix.org>
References: <1489793040-52384-1-git-send-email-denis@denix.org>
	<20170320140612.GX15664@denix.org>
	<1490021741.13980.140.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1490021741.13980.140.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Denys Dmytriyenko <denys@ti.com>, Christos Zoulas <christos@zoulas.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [morty][PATCH] file: update SRCREV for 5.28 to fix fetch fail on missing commit
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
X-List-Received-Date: Mon, 20 Mar 2017 15:07:20 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Mar 20, 2017 at 02:55:41PM +0000, Richard Purdie wrote:
> On Mon, 2017-03-20 at 10:06 -0400, Denys Dmytriyenko wrote:
> > Ping.
> > 
> > This is getting quickly escalated by my teams and customers. Can we
> > merge this 
> > to morty right away? Thanks!
> > 
> > There's another patch for krogoth, that's not as urgent yet, but
> > probably will 
> > be soon too...
> > 
> > BTW, I believe Armin was traveling last week, not sure if he's back
> > yet.
> 
> Thanks for the patches, I'd been away this weekend but having them
> available helped a lot!

Sure, happy to help!

-- 
Denys

