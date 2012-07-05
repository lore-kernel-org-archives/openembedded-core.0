Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SmqGF-0004vV-7S
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jul 2012 19:54:39 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 05 Jul 2012 10:43:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="167454181"
Received: from unknown (HELO [10.255.12.176]) ([10.255.12.176])
	by orsmga002.jf.intel.com with ESMTP; 05 Jul 2012 10:43:36 -0700
Message-ID: <4FF5D248.6010001@linux.intel.com>
Date: Thu, 05 Jul 2012 10:43:36 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1341319690-6848-1-git-send-email-cristian.iorga@intel.com>
In-Reply-To: <1341319690-6848-1-git-send-email-cristian.iorga@intel.com>
Subject: Re: [PATCH v2] telepathy-glib: update to ver. 0.19.1
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
X-List-Received-Date: Thu, 05 Jul 2012 17:54:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/03/2012 05:48 AM, Cristian Iorga wrote:
> Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
> ---
>   ...thy-glib_0.19.0.bb => telepathy-glib_0.19.1.bb} |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta/recipes-connectivity/telepathy/{telepathy-glib_0.19.0.bb => telepathy-glib_0.19.1.bb} (82%)
>
> diff --git a/meta/recipes-connectivity/telepathy/telepathy-glib_0.19.0.bb b/meta/recipes-connectivity/telepathy/telepathy-glib_0.19.1.bb
> similarity index 82%
> rename from meta/recipes-connectivity/telepathy/telepathy-glib_0.19.0.bb
> rename to meta/recipes-connectivity/telepathy/telepathy-glib_0.19.1.bb
> index 6c4e12c..082da70 100644
> --- a/meta/recipes-connectivity/telepathy/telepathy-glib_0.19.0.bb
> +++ b/meta/recipes-connectivity/telepathy/telepathy-glib_0.19.1.bb
> @@ -7,8 +7,8 @@ PR = "r0"
>
>   SRC_URI = "http://telepathy.freedesktop.org/releases/telepathy-glib/${BPN}-${PV}.tar.gz"
>
> -SRC_URI[md5sum] = "a4a01b748b6b7134853a561228fe70e4"
> -SRC_URI[sha256sum] = "f2ed6a5207cb579f6807f6f37d4d379a65208c3e094288e57655238b7afd3d66"
> +SRC_URI[md5sum] = "a2b7245057396318867af7925e927998"
> +SRC_URI[sha256sum] = "d9d1e48caf36aad0863e110230f10257e8dd53879282588d5ff720ad2bff3c80"
>
>   LIC_FILES_CHKSUM = "file://COPYING;md5=e413d83db6ee8f2c8e6055719096a48e"
>
>

Merged into OE-Core

Thanks
	Sau!


