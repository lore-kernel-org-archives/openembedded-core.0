Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SgfKF-0002Ob-T0
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Jun 2012 19:01:16 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 18 Jun 2012 09:50:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="181667525"
Received: from unknown (HELO [10.255.12.105]) ([10.255.12.105])
	by fmsmga002.fm.intel.com with ESMTP; 18 Jun 2012 09:50:32 -0700
Message-ID: <4FDF5C58.2000808@linux.intel.com>
Date: Mon, 18 Jun 2012 09:50:32 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1339703427.git.mark.hatle@windriver.com>
In-Reply-To: <cover.1339703427.git.mark.hatle@windriver.com>
Subject: Re: [PATCH 0/1] Fix incorrect busybox alternative
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
X-List-Received-Date: Mon, 18 Jun 2012 17:01:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/14/2012 12:50 PM, Mark Hatle wrote:
> The following changes since commit ba380813c0198f95b1e786aa7f49b80c68cfe9b9:
>
>    gcc-configure-target: Fix sysroot option breakage I introduced (sorry) (2012-06-14 19:48:07 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib mhatle/misc
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/misc
>
> Mark Hatle (1):
>    busybox: Fix syslog configuration file
>
>   meta/recipes-core/busybox/busybox.inc       |    1 +
>   meta/recipes-core/busybox/busybox_1.19.4.bb |    2 +-
>   2 files changed, 2 insertions(+), 1 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


