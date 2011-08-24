Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qw4Ua-0004hK-JX
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Aug 2011 05:51:04 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 23 Aug 2011 20:46:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,273,1312182000"; d="scan'208";a="10430622"
Received: from unknown (HELO [10.255.14.203]) ([10.255.14.203])
	by AZSMGA002.ch.intel.com with ESMTP; 23 Aug 2011 20:46:17 -0700
Message-ID: <4E547409.7080705@linux.intel.com>
Date: Tue, 23 Aug 2011 20:46:17 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1313747056.git.jingdong.lu@windriver.com>
In-Reply-To: <cover.1313747056.git.jingdong.lu@windriver.com>
Cc: Jingdong.Lu@windriver.com
Subject: Re: [PATCH 0/1]mpc8315e-rdb: add kernel modules to rootfs
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
X-List-Received-Date: Wed, 24 Aug 2011 03:51:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/19/2011 02:46 AM, Jingdong.Lu@windriver.com wrote:
> From: Jingdong Lu<jingdong.lu@windriver.com>
>
> Fix bug: [YOCTO #817]
>
> Add kernel modules to rootfs for mpc8315e.
>
> The following changes since commit 081e010443a3436dbd5415968aeb3ef4383e2686:
>    Jingdong Lu (1):
>          initrdscripts: fix init-live.sh
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib jingdonglu/bug817
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jingdonglu/bug817
>
> Jingdong Lu (1):
>    mpc8315e-rdb: add kernel modules to rootfs
>
>   meta-yocto/conf/machine/mpc8315e-rdb.conf |    2 ++
>   1 files changed, 2 insertions(+), 0 deletions(-)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

In the future meta-yocto changes should got to poky@yoctoproject.org

Merged these into Poky/Master

Thanks
	Sau!


