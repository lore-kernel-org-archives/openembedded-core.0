Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sof1N-0006PP-6C
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 20:18:49 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 10 Jul 2012 11:07:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="190872769"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by fmsmga002.fm.intel.com with ESMTP; 10 Jul 2012 11:07:37 -0700
Message-ID: <4FFC6F69.8080508@linux.intel.com>
Date: Tue, 10 Jul 2012 11:07:37 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1341854902.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1341854902.git.bruce.ashfield@windriver.com>
Subject: Re: [PATCH 0/1] linux-yocto/3.2: perf scripting changes
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
X-List-Received-Date: Tue, 10 Jul 2012 18:18:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/09/2012 10:31 AM, Bruce Ashfield wrote:
> Richard/Saul,
>
> I had meant to send these along with the 3.4 update, and managed to get
> distracted and miss them.
>
> These are the SRCREV updates for the 3.2 kernel to support TomZ's recent
> perf scripting work.
>
> Cheers,
>
> Bruce
>
> cc: Tom Zanussi <tom.zanussi@intel.com>
>
> The following changes since commit 90ad663909c0c8a405b22a510c9f957007d02669:
>
>    upstream_tracking: update boost (2012-07-09 17:21:38 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib zedd/kernel-oe
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>
> Bruce Ashfield (1):
>    linux-yocto/3.2: perf scripting updates
>
>   meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb   |    6 +++---
>   meta/recipes-kernel/linux/linux-yocto-tiny_3.2.bb |    4 ++--
>   meta/recipes-kernel/linux/linux-yocto_3.2.bb      |   14 +++++++-------
>   3 files changed, 12 insertions(+), 12 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


