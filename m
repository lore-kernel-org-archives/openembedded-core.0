Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RiEhR-0002t4-7S
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 01:27:25 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 03 Jan 2012 16:20:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="94148322"
Received: from unknown (HELO [10.255.13.127]) ([10.255.13.127])
	by orsmga002.jf.intel.com with ESMTP; 03 Jan 2012 16:20:03 -0800
Message-ID: <4F039B33.30407@linux.intel.com>
Date: Tue, 03 Jan 2012 16:20:03 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1324708839.git.shane.wang@intel.com>
In-Reply-To: <cover.1324708839.git.shane.wang@intel.com>
Subject: Re: [PATCH 0/2] Check Manual List, Dec 24, 2011
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
X-List-Received-Date: Wed, 04 Jan 2012 00:27:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/23/2011 10:42 PM, Shane Wang wrote:
> All,
>
> update the information for manual-check list after checking upstream.
> And take the ownership of Mei Lei's in distro_tracking_fields.inc.
>
> The following changes since commit d350b3168bab234e326c8cf1609d13803e6aba9e:
>
>    opkg: Fix installation order in feeds with mutiple providers of packages (2011-12-22 22:38:18 +0000)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib shane/manualchecking
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=shane/manualchecking
>
> Shane Wang (2):
>    distro_tracking_fields: update the info for the manual check list
>      (2011/12/24)
>    distro_tracking_fields: take the ownership of Mei Lei's
>
>   .../conf/distro/include/distro_tracking_fields.inc |  145 +++++++++++---------
>   1 files changed, 79 insertions(+), 66 deletions(-)
>
Merged into OE-Core

Thanks
	Sau!


