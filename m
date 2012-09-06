Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T9Ye6-0003rO-Qz
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 11:45:13 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 06 Sep 2012 02:32:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,379,1344236400"; d="scan'208";a="142111730"
Received: from unknown (HELO helios.localnet) ([10.252.121.173])
	by AZSMGA002.ch.intel.com with ESMTP; 06 Sep 2012 02:32:44 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Thu, 06 Sep 2012 10:32:43 +0100
Message-ID: <1592942.MflME341bO@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-30-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <CAMKF1soNQdFWREGh5_BNmBdqgRNk9+Tri+zFR3fvjT_94pYWsA@mail.gmail.com>
References: <d45bc352092507d11c740fb85c37d1102fa7203d.1346250187.git.ross.burton@intel.com>
	<50462C35.6000400@windriver.com>
	<CAMKF1soNQdFWREGh5_BNmBdqgRNk9+Tri+zFR3fvjT_94pYWsA@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] tzdata: install /etc/localtime alongside /etc/timezone
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
X-List-Received-Date: Thu, 06 Sep 2012 09:45:14 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 04 September 2012 14:29:08 Khem Raj wrote:
> Linux was never supposed to have / and /usr different to begin with

So I agree this is hard to do properly now and is going to be impossible to 
keep up with as time goes on, but where do you get this from?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


