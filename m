Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SpnC6-0002SI-UG
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jul 2012 23:14:35 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 13 Jul 2012 14:03:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="165652734"
Received: from unknown (HELO helios.localnet) ([10.252.121.20])
	by orsmga001.jf.intel.com with ESMTP; 13 Jul 2012 14:03:18 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andrei Gherzan <andrei@gherzan.ro>
Date: Fri, 13 Jul 2012 22:03:17 +0100
Message-ID: <30507362.5flLOTLR4H@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.4 (Linux/3.2.0-26-generic-pae; KDE/4.8.4; i686; ; )
In-Reply-To: <CAK18fxFBi0=eFEPPrr=O0FXNnivTSUvPe04pnqxpOKDSvT2ehw@mail.gmail.com>
References: <CAK18fxFBi0=eFEPPrr=O0FXNnivTSUvPe04pnqxpOKDSvT2ehw@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: http://xorg.freedesktop.org/ down
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
X-List-Received-Date: Fri, 13 Jul 2012 21:14:35 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Friday 13 July 2012 21:52:24 Andrei Gherzan wrote:
> http://xorg.freedesktop.org/ is down so libx11-trim will fail at fetch.
> 
> Use
> http://ftp.x.org/pub/individual/lib/
> temporary.

Isn't this why we have source mirrors? Are they not helping for this recipe?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


