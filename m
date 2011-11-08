Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RNukV-0005f0-VQ
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 00:06:36 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 08 Nov 2011 15:00:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,479,1315206000"; d="scan'208";a="34657751"
Received: from unknown (HELO [10.255.12.14]) ([10.255.12.14])
	by AZSMGA002.ch.intel.com with ESMTP; 08 Nov 2011 15:00:19 -0800
Message-ID: <4EB9B483.4060608@linux.intel.com>
Date: Tue, 08 Nov 2011 15:00:19 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1320664163.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1320664163.git.xiaofeng.yan@windriver.com>
Subject: Re: [PATCH 0/2] libarchive: update to 2.8.5
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
X-List-Received-Date: Tue, 08 Nov 2011 23:06:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/07/2011 03:13 AM, Xiaofeng Yan wrote:
> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>
> Hi Saul,
>
> I have modified my fault in distro_tracking_fields.inc.
> Please check it.
>
> Pull URL: git://git.pokylinux.org/poky-contrib.git
>    Branch: xiaofeng/update_libarchive
>    Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/update_libarchive
>
> Thanks,
>      Xiaofeng Yan<xiaofeng.yan@windriver.com>
> ---
>
>
> Xiaofeng Yan (2):
>    libarchive:  update to 2.8.5
>    distro_tracking_fields.inc: update libarchive to 2.8.5
>
>   .../conf/distro/include/distro_tracking_fields.inc |    5 ++++-
>   ...rchive_2.8.4.yocto.1.bb =>  libarchive_2.8.5.bb} |    8 ++++----
>   2 files changed, 8 insertions(+), 5 deletions(-)
>   rename meta/recipes-extended/libarchive/{libarchive_2.8.4.yocto.1.bb =>  libarchive_2.8.5.bb} (76%)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

Merged your updated version to OE-Core

Thanks
	Sau!


