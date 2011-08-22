Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QveIn-0002AW-R3
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2011 01:53:10 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 22 Aug 2011 16:48:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,266,1312182000"; 
   d="scan'208";a="9945202"
Received: from unknown (HELO [10.255.13.234]) ([10.255.13.234])
	by AZSMGA002.ch.intel.com with ESMTP; 22 Aug 2011 16:48:15 -0700
Message-ID: <4E52EABF.7090605@linux.intel.com>
Date: Mon, 22 Aug 2011 16:48:15 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1313567770.git.wenzong.fan@windriver.com>
In-Reply-To: <cover.1313567770.git.wenzong.fan@windriver.com>
Subject: Re: [PATCH v2 0/1] perl-native: Update find_perl to find the perl wrapper
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
X-List-Received-Date: Mon, 22 Aug 2011 23:53:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/17/2011 01:06 AM, wenzong.fan@windriver.com wrote:
> From: Wenzong Fan<wenzong.fan@windriver.com>
>
> v2 updates: Add patch header to the 'MM_Unix.pm.patch'
>
> The following changes since commit a21ff559e7c93e9da61104f4a33e42e6004189fd:
>    Richard Purdie (1):
>          Fixup remaining bb.msg.domain users
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib wenzong/perl
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/perl
>
> Wenzong Fan (1):
>    perl-native: Update find_perl to find the perl wrapper
>
>   .../perl/perl-5.12.3/MM_Unix.pm.patch              |   22 ++++++++++++++++++++
>   meta/recipes-devtools/perl/perl-native_5.12.3.bb   |    5 ++-
>   2 files changed, 25 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-devtools/perl/perl-5.12.3/MM_Unix.pm.patch
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


