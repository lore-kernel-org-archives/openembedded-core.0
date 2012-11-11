Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>)
	id 1TXdsy-0005ZC-Oq; Sun, 11 Nov 2012 21:12:07 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 11 Nov 2012 11:58:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,758,1344236400"; d="scan'208";a="245293163"
Received: from unknown (HELO helios.localnet) ([10.252.122.192])
	by fmsmga001.fm.intel.com with ESMTP; 11 Nov 2012 11:58:09 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 11 Nov 2012 19:58:09 +0000
Message-ID: <2026428.K88ggMmWnu@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.2 (Linux/3.2.0-32-generic-pae; KDE/4.9.2; i686; ; )
In-Reply-To: <20121111195226.GA3407@jama.jama.net>
References: <12301427.Yf0uchSh3U@helios> <20121111195226.GA3407@jama.jama.net>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: OE-Classic recipe migration status
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 11 Nov 2012 20:12:07 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sunday 11 November 2012 20:52:26 Martin Jansa wrote:
> On Sun, Nov 11, 2012 at 07:11:28PM +0000, Paul Eggleton wrote:
> > Hi all,
> > 
> > Whilst the OE-Core-based layer landscape has grown quite a bit over the
> > last year and we now have a wealth of clean and up-to-date recipes, I've
> > heard a few people commenting that we've still lost quite a few recipes
> > along the way. Nobody who did make that comment has seemed to be able to
> > be specific about what they thought we were missing however, so I figured
> > it would be worth trying to determine exactly which recipes are only
> > available in OE-Classic.
> > 
> > With the help of some scripts I've produced a list of the recipes, made
> > some notes and categorised some of them. I've published the list on the
> > wiki (unfortunately I had to split it into two pages since it was too
> > large to put> 
> > into one):
> >  http://www.openembedded.org/wiki/OE-Classic_Recipes_A-I
> >  http://www.openembedded.org/wiki/OE-Classic_Recipes_J-Z
> > 
> > I don't know much about a lot of these recipes, so if you can help to fill
> > in the gaps particularly by marking the obsolete ones as such or adding
> > other comments, that would be great. Either edit the pages directly or
> > make your comments here and I'll merge them.
> 
> I've noticed quite a few recipes listed here, which does exist in some
> layer (recipes mostly from meta-fso, meta-aurora, meta-shr), should I
> remove them from that wiki page or add layer name in 2nd column?

I did have all the layers in meta-smartphone included in the list I used to 
filter this one, so if there are items that somehow didn't get removed I'd like 
to figure out why. Can you list them here so I can look into that?

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


