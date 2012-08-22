Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>)
	id 1T4EGQ-0002BO-2d; Wed, 22 Aug 2012 18:58:42 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 22 Aug 2012 09:46:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,809,1336374000"; d="scan'208";a="189952817"
Received: from unknown (HELO helios.localnet) ([10.252.121.122])
	by orsmga002.jf.intel.com with ESMTP; 22 Aug 2012 09:45:37 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 22 Aug 2012 17:45:36 +0100
Message-ID: <2181864.aYcJgUzL39@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-29-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <CAJTo0Lbhir=VLZZfeqn4UakxTkiFyeXK+zKfCtH2GMgrZ5aBpw@mail.gmail.com>
References: <CAJTo0LZpSd6LB+9W2kUcxfeU4GOVO5VOnLHMbHYT+1W6iVzcBQ@mail.gmail.com>
	<CAJTo0LYvK_Nbj-ThQRNGQxh6P1wZqzPmm0pGNYNGnTucQEV1ng@mail.gmail.com>
	<CAJTo0Lbhir=VLZZfeqn4UakxTkiFyeXK+zKfCtH2GMgrZ5aBpw@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] RFC: One X Server To Rule Them All
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
X-List-Received-Date: Wed, 22 Aug 2012 16:58:42 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 22 August 2012 17:39:45 Burton, Ross wrote:
> On 22 August 2012 17:18, Burton, Ross <ross.burton@intel.com> wrote:
> > -9892 ./usr/lib/libts-1.0.so.0.0.0
> > +8344 ./usr/lib/libts-1.0.so.0.0.0
> > 
> > Now *this* is weird.

Nothing off the top of my head, but is there any difference in the tslib 
configure/compile logs?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


