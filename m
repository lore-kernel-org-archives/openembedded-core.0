Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RiESF-0002R2-Ss
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 01:11:45 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 03 Jan 2012 16:04:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="102880655"
Received: from unknown (HELO [10.255.13.127]) ([10.255.13.127])
	by fmsmga001.fm.intel.com with ESMTP; 03 Jan 2012 16:04:12 -0800
Message-ID: <4F03977C.60406@linux.intel.com>
Date: Tue, 03 Jan 2012 16:04:12 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1325232608.git.edwin.zhai@intel.com>
In-Reply-To: <cover.1325232608.git.edwin.zhai@intel.com>
Subject: Re: [PATCH 0/3] Package upgrade, Dec30, 2011
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
X-List-Received-Date: Wed, 04 Jan 2012 00:11:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/30/2011 12:11 AM, edwin.zhai@intel.com wrote:
> From: Zhai Edwin<edwin.zhai@intel.com>
>
> Packages upgrade for lighttpd, libassuan and apr-util.
>
> Thanks,
> Edwin
>
> The following changes since commit 429d3c9adae8b4bb166df22e70cc29aba41d6867:
>
>    matchbox-wm: Remove x-session-manager handling (2011-12-29 10:42:08 +0800)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib gzhai/build-appliance2
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/build-appliance2
>
> Zhai Edwin (3):
>    lighttpd: Upgrade to 1.4.30
>    apr-util: Upgrade to 1.4.1
>    libassuan: Upgrade to 2.0.3
>
>   .../{lighttpd_1.4.29.bb =>  lighttpd_1.4.30.bb}     |    6 +++---
>   .../apr/apr-util/configure_fixes.patch             |   10 ++++++----
>   .../apr/{apr-util_1.3.12.bb =>  apr-util_1.4.1.bb}  |    6 +++---
>   .../{libassuan_2.0.2.bb =>  libassuan_2.0.3.bb}     |    4 ++--
>   4 files changed, 14 insertions(+), 12 deletions(-)
>   rename meta/recipes-extended/lighttpd/{lighttpd_1.4.29.bb =>  lighttpd_1.4.30.bb} (92%)
>   rename meta/recipes-support/apr/{apr-util_1.3.12.bb =>  apr-util_1.4.1.bb} (91%)
>   rename meta/recipes-support/libassuan/{libassuan_2.0.2.bb =>  libassuan_2.0.3.bb} (82%)
>
>
Merged into OE-Core

Thanks
	Sau!

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


