Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S4ftr-0006wk-7i
	for openembedded-core@lists.openembedded.org;
	Mon, 05 Mar 2012 22:57:00 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 05 Mar 2012 13:47:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="73888642"
Received: from unknown (HELO [10.255.15.110]) ([10.255.15.110])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Mar 2012 13:47:15 -0800
Message-ID: <4F553462.80302@linux.intel.com>
Date: Mon, 05 Mar 2012 13:47:14 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1330400450.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1330400450.git.lianhao.lu@intel.com>
Subject: Re: [PATCH 0/1] bitbake-prserv-tool adepted to new bitbake cache
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
X-List-Received-Date: Mon, 05 Mar 2012 21:57:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/27/2012 07:42 PM, Lianhao Lu wrote:
> Modified the bitbake-prserv-tool scripts to trigger reparse according to the
> new content-based bitbake cache mechanism.
>
> The following changes since commit 8d4db8e6dcd2d25637cb77515fe776552f2fdd6d:
>    Dongxiao Xu (1):
>          bitbake.conf: Create a new filter variable BB_HASHCONFIG_WHITELIST
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib llu/prserv-tool
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/prserv-tool
>
> Lianhao Lu (1):
>    scripts/prserv-tool: Adepted to new bitbake cache.
>
>   scripts/bitbake-prserv-tool |   28 +++++++++++++++++-----------
>   1 files changed, 17 insertions(+), 11 deletions(-)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

Merged into OE-core

Thanks
	Sau!



