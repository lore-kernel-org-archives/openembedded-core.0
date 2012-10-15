Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TNgVH-0003fy-PF
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Oct 2012 10:58:27 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 15 Oct 2012 01:45:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,587,1344236400"; d="scan'208";a="235051550"
Received: from unknown (HELO helios.localnet) ([10.252.122.76])
	by fmsmga002.fm.intel.com with ESMTP; 15 Oct 2012 01:45:10 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Oct 2012 09:45:09 +0100
Message-ID: <2676506.R2vmua6UYz@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.2 (Linux/3.2.0-32-generic-pae; KDE/4.9.2; i686; ; )
In-Reply-To: <20121015053414.GA9736@ad.chargestorm.se>
References: <1349962030-9309-1-git-send-email-paul.eggleton@linux.intel.com>
	<50786000.7010008@linaro.org>
	<20121015053414.GA9736@ad.chargestorm.se>
MIME-Version: 1.0
Subject: Re: [PATCH] local.conf.sample: add PATH to SSTATE_MIRRORS comments
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
X-List-Received-Date: Mon, 15 Oct 2012 08:58:28 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 15 October 2012 07:34:15 Anders Darander wrote:
> * Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org> [121012 20:19]:
> > W dniu 12.10.2012 20:07, Saul Wold pisze:
> > > On 10/11/2012 06:27 AM, Paul Eggleton wrote:
> > >>   meta/conf/local.conf.sample |    7 +++++--
> > >>   1 file changed, 5 insertions(+), 2 deletions(-)
> > > 
> > > I think this is really a Poky File, so should go to the
> > > poky@yoctoproject.org!
> > 
> > For me this file is part of OE-Core so list is proper. If OE-Core has
> > some Poky files then maybe consider moving them to separate layer?
> 
> For me, that's also correct.
> 
> If a file exists in oe-core, it's an oe-core file and patches goes here.

I don't think anyone's actually disputing that. OE-Core patches always go to 
the OE-Core list, as happened in this case.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


