Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SuTvV-0000rH-C3
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 21:40:49 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 26 Jul 2012 12:29:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="171882493"
Received: from unknown (HELO [10.255.12.157]) ([10.255.12.157])
	by orsmga001.jf.intel.com with ESMTP; 26 Jul 2012 12:29:16 -0700
Message-ID: <50119A8C.6070002@linux.intel.com>
Date: Thu, 26 Jul 2012 12:29:16 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1343022482.git.wenzong.fan@windriver.com>
In-Reply-To: <cover.1343022482.git.wenzong.fan@windriver.com>
Cc: "Zhao, Zhenfeng1" <Zhenfeng.Zhao@windriver.com>
Subject: Re: [PATCH 0/1] remake: Add remake-native and remake
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
X-List-Received-Date: Thu, 26 Jul 2012 19:40:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/22/2012 10:50 PM, wenzong.fan@windriver.com wrote:
> From: Wenzong Fan <wenzong.fan@windriver.com>
>
> Add remake-native and remake to yocto
>
> [YOCTO #2402]
>
> The following changes since commit 315d52934693b14f08b62f3f5f361d834484e180:
>
>    Pyphon-native: Fix typo (2012-07-22 14:20:57 +0100)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib wenzong/2402
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/2402
>
> Wenzong Fan (1):
>    remake: Add remake-native and remake
>
>   meta/recipes-devtools/remake/remake.inc            |   16 +++++++++++++
>   .../remake/remake/version-remake.texi.patch        |   16 +++++++++++++
>   meta/recipes-devtools/remake/remake_git.bb         |   25 ++++++++++++++++++++
>   3 files changed, 57 insertions(+)
>   create mode 100644 meta/recipes-devtools/remake/remake.inc
>   create mode 100644 meta/recipes-devtools/remake/remake/version-remake.texi.patch
>   create mode 100644 meta/recipes-devtools/remake/remake_git.bb
>

Merged into OE-Core

Thanks
	Sau!


