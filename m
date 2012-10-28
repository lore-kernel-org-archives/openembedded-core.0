Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TSHlu-0007mC-5h
	for openembedded-core@lists.openembedded.org;
	Sun, 28 Oct 2012 02:34:38 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 27 Oct 2012 18:20:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,663,1344236400"; d="scan'208";a="233580221"
Received: from unknown (HELO [10.255.14.47]) ([10.255.14.47])
	by orsmga002.jf.intel.com with ESMTP; 27 Oct 2012 18:21:04 -0700
Message-ID: <508C8880.3010206@linux.intel.com>
Date: Sat, 27 Oct 2012 18:21:04 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: tom.zanussi@intel.com
References: <cover.1351268333.git.tom.zanussi@intel.com>
In-Reply-To: <cover.1351268333.git.tom.zanussi@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] remove lttng-syscalls patch from lttng-modules
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
X-List-Received-Date: Sun, 28 Oct 2012 01:34:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/26/2012 09:21 AM, tom.zanussi@intel.com wrote:
> From: Tom Zanussi <tom.zanussi@intel.com>
>
> This removes a no-longer-used patch from lttng-modules.
>
> The following changes since commit 511f7f9d0422fe1a896361b53179c9f642c1fc0b:
>
>    zeroconf: remove (2012-10-26 14:12:55 +0100)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib.git tzanussi/lttng-modules-remove-syscalls-patch
>    http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/lttng-modules-remove-syscalls-patch
>
> Tom Zanussi (1):
>    lttng-modules: remove unused lttng-syscalls patch
>
>   ...ls-protect-is_compat_task-from-redefiniti.patch | 41 ----------------------
>   1 file changed, 41 deletions(-)
>   delete mode 100644 meta/recipes-kernel/lttng-2.0/lttng-modules/lttng-sycalls-protect-is_compat_task-from-redefiniti.patch
>
Merged into OE-Core

Thanks
	Sau!



