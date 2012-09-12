Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TBqtt-0003Mi-5H
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 19:38:57 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 12 Sep 2012 10:26:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,410,1344236400"; d="scan'208";a="221148217"
Received: from unknown (HELO [10.255.13.93]) ([10.255.13.93])
	by fmsmga002.fm.intel.com with ESMTP; 12 Sep 2012 10:26:23 -0700
Message-ID: <5050C5BE.5030108@linux.intel.com>
Date: Wed, 12 Sep 2012 10:26:22 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@windriver.com>
References: <cover.1347300360.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1347300360.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] linux-yocto: 3.4 kernel updates
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
X-List-Received-Date: Wed, 12 Sep 2012 17:38:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/10/2012 11:11 AM, Bruce Ashfield wrote:
> Richard/Saul,
>
> Here's a small bump to 3.4.10 (32 commits) and an update to
> pickup some configuration changes from TomZ (no impact on existing
> features). All in all, it's a nice set of small fixes, with no risk.
>
> Cheers,
>
> Bruce
>
> cc: Tom Zanussi <tom.zanussi@intel.com>
>
> The following changes since commit 21816355c00eadb2273d61b456f06239ca300b47:
>
>    bitbake: cooker: fix handling of exceptions during exception handling (2012-09-10 13:14:08 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib zedd/kernel
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>
> Bruce Ashfield (1):
>    linux-yocto/3.4: v3.4.10 and uprobes/kprobes configuration updates
>
>   meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |    8 ++++----
>   meta/recipes-kernel/linux/linux-yocto_3.4.bb    |   16 ++++++++--------
>   2 files changed, 12 insertions(+), 12 deletions(-)
>
Merged into OE-Core

Thanks
	Sau!



