Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SFCNO-0004ym-Ef
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Apr 2012 00:38:58 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 03 Apr 2012 15:29:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="149318476"
Received: from unknown (HELO [10.255.12.141]) ([10.255.12.141])
	by fmsmga002.fm.intel.com with ESMTP; 03 Apr 2012 15:29:47 -0700
Message-ID: <4F7B79DB.70509@linux.intel.com>
Date: Tue, 03 Apr 2012 15:29:47 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1332822880.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1332822880.git.lianhao.lu@intel.com>
Subject: Re: [PATCH 0/1] Cleanup non shipped empty directories for gcc-cross-canadian
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
X-List-Received-Date: Tue, 03 Apr 2012 22:38:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/26/2012 09:38 PM, Lianhao Lu wrote:
> This patch improved the previous patch of commit id 04a08bf7 by hanlding the
> non-existent directory situation.
>
> The following changes since commit 644b7503c37fd73730dd3d7841463b158b8934ed:
>    Richard Purdie (1):
>          guile: Deal with hardcoded path issues
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib llu/warningfix2
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/warningfix2
>
> Lianhao Lu (1):
>    gcc-cross-canadian: Clean non shipped empty directories.
>
>   meta/recipes-devtools/gcc/gcc-package-sdk.inc |   10 +++++-----
>   1 files changed, 5 insertions(+), 5 deletions(-)
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


