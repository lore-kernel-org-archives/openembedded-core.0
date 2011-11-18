Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RRQTG-0005B3-SY
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Nov 2011 16:35:20 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 18 Nov 2011 07:28:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,533,1315206000"; d="scan'208";a="92487469"
Received: from unknown (HELO helios.localnet) ([10.252.121.185])
	by fmsmga002.fm.intel.com with ESMTP; 18 Nov 2011 07:28:38 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 18 Nov 2011 15:28:22 +0000
Message-ID: <1707586.L5PGoRtkiK@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-12-generic-pae; KDE/4.7.3; i686; ; )
In-Reply-To: <0CB9A931-9EFF-42DB-B83C-9EBAF02962E8@dominion.thruhere.net>
References: <cover.1321628513.git.paul.eggleton@linux.intel.com>
	<dee6ab006094693ede5ec6669fa5616a3a00b067.1321628513.git.paul.eggleton@linux.intel.com>
	<0CB9A931-9EFF-42DB-B83C-9EBAF02962E8@dominion.thruhere.net>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 1/1] qt4: disable pulseaudio
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
X-List-Received-Date: Fri, 18 Nov 2011 15:35:20 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 18 November 2011 16:22:37 Koen Kooi wrote:
> What follows is a generic question and in no way a criticism or comment on
> your RFC: Have you thought about using git am'able patches for these
> things?Upstream for QT is using git, so it would be nice to use somethings
> as close to the upstream submission as we can get. I've been trying to do
> this for meta-oe and found it helpfull when coming back to do the actual
> upstream push later.

I hadn't thought about it, but anything that makes these patches easier to 
upstream sounds like a good idea to me, and I would have thought this 
particular one would definitely be a candidate so I'll do it for this one once 
people have had a chance to comment.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


