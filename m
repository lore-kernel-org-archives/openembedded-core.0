Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1QNETW-000778-Vq
	for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 03:25:59 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 19 May 2011 18:23:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,239,1304319600"; d="scan'208";a="439442935"
Received: from unknown (HELO [10.255.12.39]) ([10.255.12.39])
	by azsmga001.ch.intel.com with ESMTP; 19 May 2011 18:23:01 -0700
Message-ID: <4DD5C275.9000101@intel.com>
Date: Thu, 19 May 2011 18:23:01 -0700
From: Saul Wold <saul.wold@intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1305756151.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1305756151.git.dvhart@linux.intel.com>
Cc: Robert Berger <pokylinux@reliableembeddedsystems.com>,
	Darren Hart <dvhart@linux.intel.com>, Yi Zhao <yi.zhao@windriver.com>
Subject: Re: [PATCH 0/1] u-boot: update SRCREV to 2011.03
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
X-List-Received-Date: Fri, 20 May 2011 01:25:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/18/2011 03:05 PM, Darren Hart wrote:
> From: Darren Hart<dvhart@linux.intel.com>
>
> Pull URL: git://git.pokylinux.org/poky-contrib.git
>    Branch: dvhart/beagle
>    Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dvhart/beagle
>
> Thanks,
>      Darren Hart<dvhart@linux.intel.com>
> ---
>
>
> Darren Hart (1):
>    u-boot: update SRCREV to 2011.03
>
>   meta/recipes-bsp/uboot/u-boot_git.bb |    8 ++++----
>   1 files changed, 4 insertions(+), 4 deletions(-)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
Pulled, but it had a problem with MD5SUM for the readme!

I did not catch that as I should have, I have an updated recipe and will 
send it up in tonight's pull request.

Sau!



