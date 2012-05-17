Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SV8vP-0007EX-P0
	for openembedded-core@lists.openembedded.org;
	Fri, 18 May 2012 00:11:59 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 17 May 2012 15:01:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="154199904"
Received: from unknown (HELO helios.localnet) ([10.252.120.128])
	by fmsmga001.fm.intel.com with ESMTP; 17 May 2012 15:01:51 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Thu, 17 May 2012 23:01:50 +0100
Message-ID: <30398737.cYKCjogiDH@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.2 (Linux/3.2.0-24-generic-pae; KDE/4.8.2; i686; ; )
In-Reply-To: <CAP9ODKqc5eubLWKrbPowvunHaUX0Fhbk-XLFgH=b+pr8m+tGcQ@mail.gmail.com>
References: <1337074341-12708-1-git-send-email-koen@dominion.thruhere.net>
	<2398024.EpgDMcMvMx@helios>
	<CAP9ODKqc5eubLWKrbPowvunHaUX0Fhbk-XLFgH=b+pr8m+tGcQ@mail.gmail.com>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Revert "kmod: Use base_libdir for installing libkmod"
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
X-List-Received-Date: Thu, 17 May 2012 22:12:00 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 17 May 2012 18:51:05 Otavio Salvador wrote:
> It is important to state that if OE-Core breaks Meta-OE this is
> crticial. It is not Yocto that people use and many active contributors
> use Meta-OE so it is important and critical to that people. Seems more
> health to the project to give the deserved value to Meta-OE instead of
> badmouth it...

The sooner people can start using it without fear of it doing unexpected 
things, the sooner people will be able to have more confidence in it and stop 
making negative comments about it. As it stands the way a lot of people treat 
meta-oe is a source of recipes to be copied elsewhere because they feel they 
cannot use the layer as a whole. I think that's a big shame.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


