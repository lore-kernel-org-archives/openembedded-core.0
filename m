Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S8D7y-0005Rn-Dv
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Mar 2012 17:02:11 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 15 Mar 2012 08:51:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="119364252"
Received: from unknown (HELO helios.localnet) ([10.252.123.170])
	by azsmga001.ch.intel.com with ESMTP; 15 Mar 2012 08:51:31 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Thu, 15 Mar 2012 15:51:30 +0000
Message-ID: <11790022.uJz4gazy17@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <alpine.DEB.2.02.1203081834340.8057@oneiric>
References: <alpine.DEB.2.02.1203081834340.8057@oneiric>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: README reference to yocto project seems wrong
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
X-List-Received-Date: Thu, 15 Mar 2012 16:02:11 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 08 March 2012 18:35:49 Robert P. J. Day wrote:
>   in the top-level oe-core README file, one reads:
> 
> The Yocto Project has extensive documentation about OE including a
> reference manual
> which can be found at:
>     http://yoctoproject.org/community/documentation
> 
> 
> however, that URL isn't technically correct, and i don't see any OE
> manual there.

As mentioned in the other mail, the Yocto Project manuals are the most likely 
to be useful for OE-Core rather than the old OE manual. Perhaps we could tweak 
the comment above to make this a little more clear though.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


