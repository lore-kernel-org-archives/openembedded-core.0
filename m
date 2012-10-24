Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TR2mk-00042N-CK
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Oct 2012 17:22:22 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 24 Oct 2012 08:08:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,640,1344236400"; d="scan'208";a="239539727"
Received: from unknown (HELO [10.255.14.104]) ([10.255.14.104])
	by fmsmga002.fm.intel.com with ESMTP; 24 Oct 2012 08:08:53 -0700
Message-ID: <50880485.1050008@linux.intel.com>
Date: Wed, 24 Oct 2012 08:08:53 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: Robert Yang <liezhi.yang@windriver.com>
References: <cover.1348645880.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1348645880.git.liezhi.yang@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] rootfs_rpm.bbclass: maybe no rpm postinst script
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
X-List-Received-Date: Wed, 24 Oct 2012 15:22:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/26/2012 02:22 AM, Robert Yang wrote:
> The following changes since commit b1f37e51e40774418a1b4c6e3df78df6ac6ee938:
>
>    package_rpm.bbclass: no initial_solution in the second build (2012-09-26 10:15:20 +0800)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib robert/rpm_head
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/rpm_head
>
> Robert Yang (1):
>    rootfs_rpm.bbclass: maybe no rpm postinst script
>
>   meta/classes/rootfs_rpm.bbclass | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>
Merged into OE-Core

Thanks
	Sau!


