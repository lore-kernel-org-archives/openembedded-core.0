Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RTI3B-0005CH-OI
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Nov 2011 20:00:05 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 23 Nov 2011 10:53:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="79288285"
Received: from unknown (HELO [10.255.12.15]) ([10.255.12.15])
	by orsmga001.jf.intel.com with ESMTP; 23 Nov 2011 10:53:32 -0800
Message-ID: <4ECD412C.3040408@linux.intel.com>
Date: Wed, 23 Nov 2011 10:53:32 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1321942564.git.shane.wang@intel.com>
In-Reply-To: <cover.1321942564.git.shane.wang@intel.com>
Subject: Re: [PATCH 0/1] distro_tracking: update manual checks for recipes
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
X-List-Received-Date: Wed, 23 Nov 2011 19:00:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/21/2011 10:24 PM, Shane Wang wrote:
> Here are some updates for the distro_tracking.inc file for recipes that are owned by Dexuan and require manual version checks.
>
> The following changes since commit 17a92c4c9801396ce6aa82f7c1532b49b18dbad4:
>
>    netbase: update 4.46 ->  4.47 (2011-11-21 18:49:40 +0000)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib shane/dexuan-manual-checks
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=shane/dexuan-manual-checks
>
> Shane Wang (1):
>    distro_tracking: update manual checks for recipes
>
>   .../conf/distro/include/distro_tracking_fields.inc |   13 +++++++++----
>   1 files changed, 9 insertions(+), 4 deletions(-)
>
Merged into OE-Core

Thanks
	Sau!


