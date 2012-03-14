Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S7ne7-0007YQ-51
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 13:49:39 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 14 Mar 2012 05:40:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="117596392"
Received: from unknown (HELO helios.localnet) ([10.252.123.190])
	by orsmga001.jf.intel.com with ESMTP; 14 Mar 2012 05:39:51 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 14 Mar 2012 12:39:50 +0000
Message-ID: <2970280.1QavEf7R15@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <CADkTA4M6XgC3vo-GR5MnK1HcS58tz0-WrwSX0KOhaeRMMhqnvA@mail.gmail.com>
References: <cover.1331685330.git.paul.eggleton@linux.intel.com>
	<5205752.2zb4P1afWQ@helios>
	<CADkTA4M6XgC3vo-GR5MnK1HcS58tz0-WrwSX0KOhaeRMMhqnvA@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 6/6] linux-yocto-tiny: add dependency on xz-native
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
X-List-Received-Date: Wed, 14 Mar 2012 12:49:39 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Bruce,

On Wednesday 14 March 2012 08:29:20 Bruce Ashfield wrote:
> In this case, you wouldn't go through the fragments, you'd just add one that
> turns it on when you want it. Don't audit a defconfig, push the few options
> that you want onto the build.

I'm not sure what you mean here, in the context of generically figuring out 
whether lzma is needed...?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


