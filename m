Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UcgiE-0006g4-2b
	for openembedded-core@lists.openembedded.org;
	Wed, 15 May 2013 20:46:12 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 15 May 2013 11:24:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,678,1363158000"; d="scan'208";a="242048972"
Received: from unknown (HELO helios.localnet) ([10.255.12.118])
	by AZSMGA002.ch.intel.com with ESMTP; 15 May 2013 11:24:04 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Wed, 15 May 2013 19:24:03 +0100
Message-ID: <1671648.4UWfFTD1eS@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-19-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <CAP9ODKqQ-TXBwUqPVZ_oZOK2MLRQhSp_9Xb7a=dOiPaQ+zUw5A@mail.gmail.com>
References: <518A6B25.5000108@r-finger.com> <1368639038.18324.6.camel@ted>
	<CAP9ODKqQ-TXBwUqPVZ_oZOK2MLRQhSp_9Xb7a=dOiPaQ+zUw5A@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: proposal to move cogl, clutter and related recipes from oe-core to dedicated meta-clutter layer
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
X-List-Received-Date: Wed, 15 May 2013 18:46:25 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 15 May 2013 14:36:16 Otavio Salvador wrote:
> On Wed, May 15, 2013 at 2:30 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > I'd ask that we give trying to make this work from OE-Core a fair try.
> > 
> > If in say 3 months from now OE-Core is causing clutter users pain we can
> > look again at the problem. Equally, if nobody has sent me any clutter
> > patches in the next three months, I wouldn't consider than a fair try.
> 
> No, this is not fair. If you wish to keep it you need to do the work
> or find someone to make it. Tomas is willing to work in meta-clutter
> and he has the right to work in his solution.

Nobody's suggesting Tomas can't work on meta-clutter. This is an open source 
project, people are pretty much free to contribute as they see fit. For my 
part, I will try to make sure the clutter recipes in OE-Core are better 
maintained in future.

However, I do think it's important for us to try to work together for the 
benefit of everyone, and when it comes to OE-Core and other central pieces of 
the OE ecosystem, that means trying to understand the bigger picture outside 
of the day-to-day requirements that we all have on the projects we work on 
individually.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


