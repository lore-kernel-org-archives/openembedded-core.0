Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UT80j-0005Po-UY
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Apr 2013 11:53:45 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 19 Apr 2013 02:36:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,507,1363158000"; d="scan'208";a="229216043"
Received: from unknown (HELO helios.localnet) ([10.255.13.209])
	by AZSMGA002.ch.intel.com with ESMTP; 19 Apr 2013 02:36:05 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Date: Fri, 19 Apr 2013 10:36:04 +0100
Message-ID: <2331359.GEXl2c1JQe@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.5.0-27-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <alpine.DEB.2.02.1304181311590.32433@oneiric>
References: <alpine.DEB.2.02.1304180833040.10184@oneiric>
	<51701918.8070001@windriver.com>
	<alpine.DEB.2.02.1304181311590.32433@oneiric>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: tweaking insane.bbclass to handle MIPS SEAD-3?
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
X-List-Received-Date: Fri, 19 Apr 2013 09:54:05 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 18 April 2013 13:14:51 Robert P. J. Day wrote:
>   if one created a BSP for the MIPS SEAD-3, where would it go? i
> notice there's no current MIPS-related OE layer anywhere. i'm assuming
> http://layers.openembedded.org/layerindex/ is the canonical source
> these days for layer locations, yes? the only MIPS match one gets
> there is for the qemumips machine.

I guess there isn't one yet, so if you'd like to create and publish one, go 
for it. There's some info on how that should be done in the OE layers FAQ:

http://www.openembedded.org/Layers_FAQ

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


