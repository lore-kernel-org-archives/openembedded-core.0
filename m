Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RV5Xk-0001xS-Kx
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Nov 2011 19:03:04 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 28 Nov 2011 09:56:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,585,1315206000"; d="scan'208";a="79876187"
Received: from unknown (HELO [10.255.15.251]) ([10.255.15.251])
	by azsmga001.ch.intel.com with ESMTP; 28 Nov 2011 09:56:25 -0800
Message-ID: <4ED3CB49.2060601@linux.intel.com>
Date: Mon, 28 Nov 2011 09:56:25 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1322466046.git.wenzong.fan@windriver.com>
In-Reply-To: <cover.1322466046.git.wenzong.fan@windriver.com>
Subject: Re: [PATCH 0/1] distro_tracking: update tracking fields for gettext and eds-tools
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
X-List-Received-Date: Mon, 28 Nov 2011 18:03:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/27/2011 11:57 PM, wenzong.fan@windriver.com wrote:
> From: Wenzong Fan<wenzong.fan@windriver.com>
>
> Update distro tracking fields for gettext and eds-tools.
>
> The eds-tools fails to build for now, so left its status as 'red'. A
> defect #1786 has been filed for tracking this.
>
> The following changes since commit 4cd96710785eb05abeff1f281878655118d4a7dd:
>    Richard Purdie (1):
>          bitbake: Update users of getVar/setVar to use the data store functions directly
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib wenzong/distro_tracking_fields_update
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/distro_tracking_fields_update
>
> Wenzong Fan (1):
>    distro_tracking: update tracking fields for gettext and eds-tools
>
>   .../conf/distro/include/distro_tracking_fields.inc |   11 ++++++-----
>   1 files changed, 6 insertions(+), 5 deletions(-)
>
This patch did not apply cleanly and seems to provide duplicate entries, 
please rebase and resubmit.

Thanks
	Sau!

>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


