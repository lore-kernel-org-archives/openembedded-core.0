Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TFBnp-0005Wy-4b
	for openembedded-core@lists.openembedded.org;
	Sat, 22 Sep 2012 00:34:29 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 21 Sep 2012 15:21:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,464,1344236400"; d="scan'208";a="147735579"
Received: from unknown (HELO [10.255.14.14]) ([10.255.14.14])
	by AZSMGA002.ch.intel.com with ESMTP; 21 Sep 2012 15:21:41 -0700
Message-ID: <505CE875.8090001@linux.intel.com>
Date: Fri, 21 Sep 2012 15:21:41 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@windriver.com>
References: <cover.1348162346.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1348162346.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] linux-yocto/3.4: latency/profiling option consistency
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
X-List-Received-Date: Fri, 21 Sep 2012 22:34:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/20/2012 10:34 AM, Bruce Ashfield wrote:
> Richard/Saul,
>
> Here's a change from Tom that I've had for a few days, to make
> more BSPs use the common profiling/latency configuration fragments.
> Everything checks out fine here.
>
> Cheers,
>
> Bruce
>
> The following changes since commit df5f9a3e6dfcf8e8f57132843a024b44c0bd90fc:
>
>    gtk+: enable gtk+-native (2012-09-20 13:33:50 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib zedd/kernel
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>
> Bruce Ashfield (1):
>    linux-yocto/3.4: use profiling and latencytop features in yocto bsps
>
>   meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |    2 +-
>   meta/recipes-kernel/linux/linux-yocto_3.4.bb    |    2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!



