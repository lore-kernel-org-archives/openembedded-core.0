Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Sm8qr-0005AJ-0o
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 21:33:33 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 03 Jul 2012 12:22:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="173072417"
Received: from unknown (HELO helios.localnet) ([10.252.120.234])
	by fmsmga001.fm.intel.com with ESMTP; 03 Jul 2012 12:22:29 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Jack Mitchell <ml@communistcode.co.uk>
Date: Tue, 03 Jul 2012 20:22:28 +0100
Message-ID: <2056870.tdrijsDPYL@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.3 (Linux/3.2.0-26-generic-pae; KDE/4.8.3; i686; ; )
In-Reply-To: <4FF32E93.9050802@communistcode.co.uk>
References: <4FF320DD.8090301@palm.com> <4FF32E93.9050802@communistcode.co.uk>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: local.conf & bblayers.conf changes...
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
X-List-Received-Date: Tue, 03 Jul 2012 19:33:33 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 03 July 2012 18:40:35 Jack Mitchell wrote:
> What I did was create a new build directory and do a diff between my
> current config and the newly generated config.
> 
> I couldn't find the reference local.conf file that bitbake tells you to
> compare against...

It's in meta(-yocto)/conf/local.conf.sample.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


