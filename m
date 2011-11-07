Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RNUQY-0006kT-56
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Nov 2011 20:00:14 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 07 Nov 2011 10:53:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,471,1315206000"; d="scan'208";a="71474808"
Received: from unknown (HELO [10.255.12.14]) ([10.255.12.14])
	by azsmga001.ch.intel.com with ESMTP; 07 Nov 2011 10:53:59 -0800
Message-ID: <4EB82947.8000107@linux.intel.com>
Date: Mon, 07 Nov 2011 10:53:59 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1320252973.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1320252973.git.scott.a.garman@intel.com>
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: Re: [PATCH 0/1] distro tracking updates for some recipes
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
X-List-Received-Date: Mon, 07 Nov 2011 19:00:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/02/2011 09:58 AM, Scott Garman wrote:
> Hello,
>
> Now that the date formatting is normalized in the distro tracking file,
> here are updates for the recipes that I recently updated: sudo, mtools,
> grep, and openssh.
>
> The following changes since commit 37579d7d74d127c90c1e078d05c5bf4ba0b3f755:
>
>    meta: glib-2.0: don't apply qsort_r test removable patch for native version (2011-11-02 09:08:21 +0000)
>
> are available in the git repository at:
>    git://git.yoctoproject.org/poky-contrib sgarman/distro-tracking
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=sgarman/distro-tracking
>
> Scott Garman (1):
>    distro_tracking_fields: updates for sudo, mtools, grep, and openssh
>
>   .../conf/distro/include/distro_tracking_fields.inc |   32 ++++++++++----------
>   1 files changed, 16 insertions(+), 16 deletions(-)
>

Merged int OE-Core

Thanks
	Sau!


