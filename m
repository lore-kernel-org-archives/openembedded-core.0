Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QozGr-0003R6-Gc
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 16:51:37 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 04 Aug 2011 07:47:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,316,1309762800"; d="scan'208";a="34411882"
Received: from unknown (HELO [10.255.14.76]) ([10.255.14.76])
	by orsmga002.jf.intel.com with ESMTP; 04 Aug 2011 07:47:12 -0700
Message-ID: <4E3AB0F0.1000504@linux.intel.com>
Date: Thu, 04 Aug 2011 07:47:12 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13
	Lightning/1.0b3pre Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1312158816.git.lei.mei@intel.com>
In-Reply-To: <cover.1312158816.git.lei.mei@intel.com>
Subject: Re: [PATCH 0/1]aspell: upgrade from 0.60.6 to 0.60.6.1
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
X-List-Received-Date: Thu, 04 Aug 2011 14:51:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/31/2011 05:41 PM, Mei Lei wrote:
> Hi Saul,
> 	This pull request upgrade aspell from 0.60.6 to 0.60.6.1, please review it.
>
> Thanks
> Lei
>
> The following changes since commit f94b781695cd8fa387daff16ecbf3987a0883018:
>    Bruce Ashfield (1):
>          poky.conf: explicitly referenced preferred linux-yocto version
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib lmei3/upgrade-0730
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=lmei3/upgrade-0730
>
> Mei Lei (1):
>    aspell: upgrade from 0.60.6 to 0.60.6.1
>
>   .../{aspell_0.60.6.bb =>  aspell_0.60.6.1.bb}       |    6 +++---
>   1 files changed, 3 insertions(+), 3 deletions(-)
>   rename meta/recipes-support/aspell/{aspell_0.60.6.bb =>  aspell_0.60.6.1.bb} (82%)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

Merged into OE-Core

Thanks
	Sau!



