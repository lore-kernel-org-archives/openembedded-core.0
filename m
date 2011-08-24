Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QwMKH-0006OO-Nj
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Aug 2011 00:53:37 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 24 Aug 2011 15:48:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,277,1312182000"; d="scan'208";a="44769041"
Received: from unknown (HELO [10.255.14.203]) ([10.255.14.203])
	by fmsmga001.fm.intel.com with ESMTP; 24 Aug 2011 15:48:50 -0700
Message-ID: <4E557FD2.8010206@linux.intel.com>
Date: Wed, 24 Aug 2011 15:48:50 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1313982402.git.wenzong.fan@windriver.com>
In-Reply-To: <cover.1313982402.git.wenzong.fan@windriver.com>
Subject: Re: [PATCH v2 0/1] libpam: Setting suid bit for unix_chkpwd
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
X-List-Received-Date: Wed, 24 Aug 2011 22:53:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/21/2011 08:11 PM, wenzong.fan@windriver.com wrote:
> From: Wenzong Fan<wenzong.fan@windriver.com>
>
> v2 updates: with ${sbindir} to replace the hardcode '/usr/sbin'
>
> The following changes since commit 36396b6ecb0c84c6752cdc8118c496e8ec05a388:
>    Richard Purdie (1):
>          xcb/libpthreads: Add BBCLASSEXTEND to resolve missing providers in world builds
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib wenzong/1252
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/1252
>
> Wenzong Fan (1):
>    libpam: Setting suid bit for unix_chkpwd
>
>   meta/recipes-extended/pam/libpam_1.1.4.bb |    8 +++++++-
>   1 files changed, 7 insertions(+), 1 deletions(-)
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


