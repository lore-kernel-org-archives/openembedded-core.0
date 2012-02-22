Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S0Eda-0006Aa-FX
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 17:01:50 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 22 Feb 2012 07:53:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="110824539"
Received: from unknown (HELO helios.localnet) ([10.252.123.31])
	by orsmga001.jf.intel.com with ESMTP; 22 Feb 2012 07:53:28 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2012 15:53:27 +0000
Message-ID: <2032247.UMYq2ztU6u@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.0; i686; ; )
In-Reply-To: <CAP9ODKp9uc7UajJYHNZ_QJ_R+YOXmPt_ZU2phHWFQvG-2CnOng@mail.gmail.com>
References: <cover.1329916583.git.liezhi.yang@windriver.com>
	<1329923198.20261.160.camel@ted>
	<CAP9ODKp9uc7UajJYHNZ_QJ_R+YOXmPt_ZU2phHWFQvG-2CnOng@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH 0/1] A script to clean obsolete sstate cache files
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
X-List-Received-Date: Wed, 22 Feb 2012 16:01:50 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 22 February 2012 13:47:45 Otavio Salvador wrote:
> On Wed, Feb 22, 2012 at 13:06, Richard Purdie
> 
> <richard.purdie@linuxfoundation.org> wrote:
> > Or why can't people just cherry-pick the patch in, or apply the patch
> > manually? The latter is no different to people who just supply the
> > patches manually the the list with no corresponding git tree after all.
> 
> Because this mean to have and maintain a full clone of the repository
> and I don't want and I won't do that.

Except here we are talking about a single patch that adds a single file, which 
is easily downloadable from the web interface. If it were more complicated I 
could understand the fuss, but right now this is almost ridiculous.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


