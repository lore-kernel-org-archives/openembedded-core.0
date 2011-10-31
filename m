Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RKnuT-00058Z-Jt
	for openembedded-core@lists.openembedded.org;
	Mon, 31 Oct 2011 10:12:01 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 31 Oct 2011 02:05:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,429,1315206000"; d="scan'208";a="31676540"
Received: from unknown (HELO helios.localnet) ([10.252.121.56])
	by AZSMGA002.ch.intel.com with ESMTP; 31 Oct 2011 02:05:54 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "McClintock Matthew-B29882" <B29882@freescale.com>,
	"Patches and discussions about the oe-core layer"
	<openembedded-core@lists.openembedded.org>
Date: Mon, 31 Oct 2011 09:05:46 +0000
User-Agent: KMail/1.13.6 (Linux/2.6.38-11-generic-pae; KDE/4.6.5; i686; ; )
References: <1319700362.15601.2.camel@ted>
	<1319817308.22985.448.camel@phil-desktop>
	<CAEsOVNd+p0U59Gpf+mA_cywMhOcnspbhe9xB2JvS2fhF31T1_g@mail.gmail.com>
In-Reply-To: <CAEsOVNd+p0U59Gpf+mA_cywMhOcnspbhe9xB2JvS2fhF31T1_g@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201110310905.49436.paul.eggleton@linux.intel.com>
Subject: Re: [PATCH v2 1/2] Add new strace-graph package to avoid making perl a dependecy for all of strace
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
X-List-Received-Date: Mon, 31 Oct 2011 09:12:01 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Friday 28 October 2011 21:07:44 McClintock Matthew-B29882 wrote:
> On Fri, Oct 28, 2011 at 10:54 AM, Phil Blundell <philb@gnu.org> wrote:
> > That logic sounds reasonable, but I think Richard's point was that it's
> > more conventional to use "=+" rather than an override for prepending.
> 
> I sort of forgot that += and =+ are different. Shall I resubmit this patch?

Yes please.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


