Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SpFy5-0006I6-Bd
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jul 2012 11:45:53 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 12 Jul 2012 02:34:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="164794684"
Received: from unknown (HELO helios.localnet) ([10.252.121.24])
	by orsmga001.jf.intel.com with ESMTP; 12 Jul 2012 02:34:39 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Damian, Alexandru" <alexandru.damian@intel.com>
Date: Thu, 12 Jul 2012 10:34:38 +0100
Message-ID: <1901411.bouqtbEZ1W@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.4 (Linux/3.2.0-26-generic-pae; KDE/4.8.4; i686; ; )
In-Reply-To: <CAJ2CSBt+NSLH0_WhdDfMN8GUw5epy_u31aeESaZxT=7rQ90WfQ@mail.gmail.com>
References: <CAJ2CSBuJYeUMYEa8RycpMzZA551xoR0Fe5QJi8GgBg7f=C1PLA@mail.gmail.com>
	<CAJ2CSBt+NSLH0_WhdDfMN8GUw5epy_u31aeESaZxT=7rQ90WfQ@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: python error when building various packages
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
X-List-Received-Date: Thu, 12 Jul 2012 09:45:53 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 12 July 2012 11:56:16 Damian, Alexandru wrote:
> Solved by do_clean on the packages.
> 
> Still Alex doesn't know what triggers the error.

I'm not sure either, but would you mind filing a bug for this?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


