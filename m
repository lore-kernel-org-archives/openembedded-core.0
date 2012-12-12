Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TiniP-0007gt-Qt
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Dec 2012 15:55:18 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 12 Dec 2012 06:40:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,266,1355126400"; d="scan'208";a="262988185"
Received: from unknown (HELO helios.localnet) ([10.252.122.189])
	by fmsmga002.fm.intel.com with ESMTP; 12 Dec 2012 06:40:24 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>,
	Tom King <ka6sox@gmail.com>, Michael Halstead <michael@yoctoproject.org>
Date: Wed, 12 Dec 2012 14:40:23 +0000
Message-ID: <4844076.8ODi5JQrU5@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.3 (Linux/3.5.0-19-generic; KDE/4.9.3; i686; ; )
In-Reply-To: <CAOHjBZvqGWByQ+v60GDfMOxoiB8XyTsfyFxFb4RvYE2FQQvffA@mail.gmail.com>
References: <CAOHjBZvqGWByQ+v60GDfMOxoiB8XyTsfyFxFb4RvYE2FQQvffA@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Download of bitbake doesn't work properly
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
X-List-Received-Date: Wed, 12 Dec 2012 14:55:18 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 12 December 2012 15:17:05 Giuseppe Condorelli wrote:
> Hi, just to highlight that I'm unable to download the bitbake tar files.
> It seems that cgit.openembedded.org suffers of some problem in that case.
> 
> Please can you verify?

Yep, I also get a 503 error whenever I try these, for example:
http://cgit.openembedded.org/bitbake/snapshot/bitbake-1.17.0.tar.gz

Tom/Michael, would you mind looking into this?

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


