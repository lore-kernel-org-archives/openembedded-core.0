Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RdgtX-0003pJ-9H
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 12:33:07 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 22 Dec 2011 03:26:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="49720108"
Received: from unknown (HELO helios.localnet) ([10.252.122.57])
	by AZSMGA002.ch.intel.com with ESMTP; 22 Dec 2011 03:25:59 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 Dec 2011 11:25:57 +0000
Message-ID: <5001068.cY7vLDoi1Z@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.4 (Linux/3.0.0-14-generic-pae; KDE/4.7.4; i686; ; )
In-Reply-To: <CAMKF1so8it8VVhVeidcpfmxd-5dgfXvrsX_w3z1U7WbrVpoRqQ@mail.gmail.com>
References: <CAMKF1so8it8VVhVeidcpfmxd-5dgfXvrsX_w3z1U7WbrVpoRqQ@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Fetch errors from projects.o-hand.com
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
X-List-Received-Date: Thu, 22 Dec 2011 11:33:07 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Khem,

On Sunday 20 November 2011 08:18:47 Khem Raj wrote:
> My build of core-image-sato is failing to fetch tars from
> projects.o-hand.com
> 
>...
>
> I dont have yocto project mirror in my fallback list.
> 
> Should these files be fetched from these urls or should urls be
> updated to fetch them from elsewhere ?

All references to *.o-hand.com in SRC_URI have now been fixed. Thanks for 
pointing this out and sorry for the delay in fixing it!

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


