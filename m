Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1StbT2-0003uK-Oa
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jul 2012 11:31:49 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 24 Jul 2012 02:20:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="172420481"
Received: from unknown (HELO helios.localnet) ([10.252.121.60])
	by azsmga001.ch.intel.com with ESMTP; 24 Jul 2012 02:20:19 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jul 2012 10:20:18 +0100
Message-ID: <1386136.0joZJkJK2h@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.4 (Linux/3.2.0-26-generic-pae; KDE/4.8.4; i686; ; )
In-Reply-To: <1610928.T7hSJDQ7P6@helios>
References: <alpine.DEB.2.02.1207240455440.18822@oneiric>
	<1610928.T7hSJDQ7P6@helios>
MIME-Version: 1.0
Subject: Re: more pedantry: inconsistent presentation of how to introduce layers
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
X-List-Received-Date: Tue, 24 Jul 2012 09:31:49 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 24 July 2012 10:15:32 Paul Eggleton wrote:
> > but every single meta-openembedded sub-layer uses the *other* form:
> > 
> > BBPATH .= ":${LAYERDIR}"
> 
> Again, only as of quite recently

Actually it seems that may not be true. This change was made in May 2011. 

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


