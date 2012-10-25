Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TRTrN-0007cR-3w
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Oct 2012 22:16:57 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 25 Oct 2012 13:03:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,648,1344236400"; d="scan'208";a="209359429"
Received: from unknown (HELO [10.255.14.104]) ([10.255.14.104])
	by azsmga001.ch.intel.com with ESMTP; 25 Oct 2012 13:03:26 -0700
Message-ID: <50899B0D.6000200@linux.intel.com>
Date: Thu, 25 Oct 2012 13:03:25 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Kang Kai <kai.kang@windriver.com>
References: <cover.1351155183.git.kai.kang@windriver.com>
In-Reply-To: <cover.1351155183.git.kai.kang@windriver.com>
Cc: "Zhao, Zhenfeng1" <Zhenfeng.Zhao@windriver.com>,
	'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] Fix Yocto 3069
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
X-List-Received-Date: Thu, 25 Oct 2012 20:16:57 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/25/2012 02:50 AM, Kang Kai wrote:
> The following changes since commit 33440ee70623394d06a4b214c2be10788cba6d08:
>
>    bitbake: hob/settings: add a scroll bar for the box with mirrors (2012-10-24 21:13:08 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib kangkai/fix-3069
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/fix-3069
>
> Kang Kai (1):
>    perl: update dependencies
>
>   .../recipes-devtools/perl/perl-rdepends_5.14.2.inc |    2 ++
>   meta/recipes-devtools/perl/perl_5.14.2.bb          |    2 +-
>   2 files changed, 3 insertions(+), 1 deletions(-)
>
Merged into OE-Core

Thanks
	Sau!



