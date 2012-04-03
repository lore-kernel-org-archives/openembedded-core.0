Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SFBMK-0003xL-1m
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Apr 2012 23:33:48 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 03 Apr 2012 14:24:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="128360662"
Received: from unknown (HELO [10.255.12.141]) ([10.255.12.141])
	by orsmga002.jf.intel.com with ESMTP; 03 Apr 2012 14:24:36 -0700
Message-ID: <4F7B6A94.4060308@linux.intel.com>
Date: Tue, 03 Apr 2012 14:24:36 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1332491511.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1332491511.git.lianhao.lu@intel.com>
Subject: Re: [PATCH 0/1] Populate libc's siteconfig file into metatoolchain
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
X-List-Received-Date: Tue, 03 Apr 2012 21:33:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/23/2012 01:33 AM, Lianhao Lu wrote:
> This fixed the Yocto bug #2159
>
> The following changes since commit b92aaf764e6de94fb9fdee610e8f6643ccf74894:
>    Richard Purdie (1):
>          gst-plugins-bluetooth: Don't install headers, man pages or .pc files
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib llu/siteconfig
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/siteconfig
>
> Lianhao Lu (1):
>    meta-toolchain: Popluated the libc siteconfig files.
>
>   meta/classes/toolchain-scripts.bbclass     |    8 ++------
>   meta/recipes-core/meta/meta-environment.bb |    2 +-
>   meta/recipes-core/meta/meta-toolchain.bb   |    2 +-
>   3 files changed, 4 insertions(+), 8 deletions(-)
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


