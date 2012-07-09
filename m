Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SoH41-0004ly-IG
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 18:43:57 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 09 Jul 2012 09:32:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="190312911"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jul 2012 09:32:47 -0700
Message-ID: <4FFB07AE.6060007@linux.intel.com>
Date: Mon, 09 Jul 2012 09:32:46 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1341605152.git.mark.hatle@windriver.com>
In-Reply-To: <cover.1341605152.git.mark.hatle@windriver.com>
Subject: Re: [PATCH 0/1] Small RPM package fix
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
X-List-Received-Date: Mon, 09 Jul 2012 16:43:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/06/2012 01:06 PM, Mark Hatle wrote:
> A couple of minor RPM fixes that affect non-default configurations.
>
> The following changes since commit 8f16811a8d51982a8b3d70e6087aef4a41926840:
>
>    bootimg: Use STAGING_KERNEL_DIR (2012-07-06 09:38:17 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib mhatle/misc
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/misc
>
> Mark Hatle (1):
>    rpm: Fix PACKAGECONFIG dependencies
>
>   meta/recipes-devtools/rpm/rpm_5.4.9.bb |    8 ++++----
>   1 files changed, 4 insertions(+), 4 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


