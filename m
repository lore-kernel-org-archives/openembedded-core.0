Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QstOk-00015D-Hz
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 11:23:54 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 15 Aug 2011 02:19:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,373,1309762800"; d="scan'208";a="41524050"
Received: from unknown (HELO helios.localnet) ([10.255.18.70])
	by fmsmga001.fm.intel.com with ESMTP; 15 Aug 2011 02:19:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Mon, 15 Aug 2011 10:19:16 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-10-generic-pae; KDE/4.6.2; i686; ; )
References: <CAGiJk9fq+p3LcBOOz=V+_kprRppAOR-nOAOW6tgK3zwE78Skwg@mail.gmail.com>
	<9A00A881-7C5C-4053-BEDF-DE26572945C6@dominion.thruhere.net>
	<CAGiJk9dDp_CwiS2GL5+Cy6HNgjRZMmJqt+KGBWiwYTbYCSxY3w@mail.gmail.com>
In-Reply-To: <CAGiJk9dDp_CwiS2GL5+Cy6HNgjRZMmJqt+KGBWiwYTbYCSxY3w@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201108151019.16878.paul.eggleton@linux.intel.com>
Subject: Re: Questions about the layer structure in OpenEmbedded-Core
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Aug 2011 09:23:54 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Monday 15 August 2011 10:06:33 Samuel Stirtzel wrote:
> 2011/8/12 Koen Kooi <koen@dominion.thruhere.net>:
> > There's also:
> > 
> > https://github.com/ebutera/meta-igep
> > http://gitorious.org/schnitzeltony-oe-meta/meta-freescale
> > http://gitorious.org/schnitzeltony-oe-meta/meta-gumstix
> > https://github.com/koenkooi/meta-ettus
> > 
> > and likely much more
> 
> I'd guess there is no list for third party components/repositories, or
> am I wrong?

I had intended the list to cover all available layers. However for layers that 
refer to other projects/manufacturers/products where the layer is not an 
official one, I think it's fine to list it there but important to mark it 
"unofficial".

BTW I plan to add the above to the list some time today if I get time to do 
so.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


