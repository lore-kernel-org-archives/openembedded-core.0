Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1REkpy-0002bo-4y
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 18:42:29 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 14 Oct 2011 09:35:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,347,1315206000"; d="scan'208";a="78191650"
Received: from unknown (HELO [10.255.15.120]) ([10.255.15.120])
	by fmsmga002.fm.intel.com with ESMTP; 14 Oct 2011 09:35:50 -0700
Message-ID: <4E9864E6.8030304@linux.intel.com>
Date: Fri, 14 Oct 2011 09:35:50 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Xiaofeng Yan <xiaofeng.yan@windriver.com>
References: <cover.1318318965.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1318318965.git.xiaofeng.yan@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] distro_tracking_fields.inc: Add maintainer for some packages without maintainer
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
X-List-Received-Date: Fri, 14 Oct 2011 16:42:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/11/2011 01:51 AM, Xiaofeng Yan wrote:
> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>
> Add maintainer's name for the following packages:
>            bind
>            libx11-diet
>            qmmp
>            libarchive
>            xserver-kdrive
>            xserver-xf86-lite
>            directfb
>
> Pull URL: git://git.pokylinux.org/poky-contrib.git
>    Branch: xiaofeng/maintainer
>    Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/maintainer
>
> Thanks,
>      Xiaofeng Yan<xiaofeng.yan@windriver.com>
> ---
>
>
> Xiaofeng Yan (1):
>    distro_tracking_fields.inc: Add maintainer for some packages without
>      maintainer
>
>   .../conf/distro/include/distro_tracking_fields.inc |   15 +++++++++++++++
>   1 files changed, 15 insertions(+), 0 deletions(-)
>
>

Merged into OE-Core.

Please send any corrected updates for this file, I think I may have 
merged the older version.

Thanks
	Sau!


