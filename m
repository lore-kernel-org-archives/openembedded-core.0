Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QEDZA-0001mP-NX
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Apr 2011 06:38:32 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 24 Apr 2011 21:36:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,264,1301900400"; d="scan'208";a="913930525"
Received: from unknown (HELO [10.255.12.237]) ([10.255.12.237])
	by fmsmga001.fm.intel.com with ESMTP; 24 Apr 2011 21:36:03 -0700
Message-ID: <4DB4FA33.8030700@linux.intel.com>
Date: Sun, 24 Apr 2011 21:36:03 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Lightning/1.0b2pre
	Thunderbird/3.0.5
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1303421567.git.raj.khem@gmail.com>
In-Reply-To: <cover.1303421567.git.raj.khem@gmail.com>
Subject: Re: [PATCH V2 0/1] Upgrade pcmciautils 017 -> 018
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
X-List-Received-Date: Mon, 25 Apr 2011 04:38:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/21/2011 02:35 PM, Khem Raj wrote:
>
> Pull URL: git://git.openembedded.org/openembedded-core-contrib
>    Branch: kraj/pcmciautils
>    Browse: http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/pcmciautils
>
> Thanks,
>      Khem Raj<raj.khem@gmail.com>
> ---
>
>
> Khem Raj (1):
>    pcmciautils: Upgrade 017 ->  018
>
>   .../pcmciautils-017/version_workaround.patch       |   16 ------------
>   .../makefile_fix.patch                             |   25 +++++++++++--------
>   meta/recipes-bsp/pcmciautils/pcmciautils.inc       |    1 +
>   meta/recipes-bsp/pcmciautils/pcmciautils_017.bb    |   12 ---------
>   meta/recipes-bsp/pcmciautils/pcmciautils_018.bb    |   11 ++++++++
>   5 files changed, 26 insertions(+), 39 deletions(-)
>   delete mode 100644 meta/recipes-bsp/pcmciautils/pcmciautils-017/version_workaround.patch
>   rename meta/recipes-bsp/pcmciautils/{pcmciautils-017 =>  pcmciautils-018}/makefile_fix.patch (87%)
>   delete mode 100644 meta/recipes-bsp/pcmciautils/pcmciautils_017.bb
>   create mode 100644 meta/recipes-bsp/pcmciautils/pcmciautils_018.bb
>
Pulled in oe-core

Thanks
	Sau!


