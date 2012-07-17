Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SrAGx-0000zS-P9
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jul 2012 18:05:16 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 17 Jul 2012 08:53:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="167478878"
Received: from unknown (HELO [10.255.12.178]) ([10.255.12.178])
	by orsmga001.jf.intel.com with ESMTP; 17 Jul 2012 08:53:55 -0700
Message-ID: <50058A93.6030701@linux.intel.com>
Date: Tue, 17 Jul 2012 08:53:55 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1341867108-7823-1-git-send-email-ray.danks@se-eng.com>
In-Reply-To: <1341867108-7823-1-git-send-email-ray.danks@se-eng.com>
Subject: Re: [PATCH] mkelfimage: Upgrade to e1e6a91
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
X-List-Received-Date: Tue, 17 Jul 2012 16:05:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/09/2012 01:51 PM, Raymond Danks wrote:
> Packaging issues resolved with latest version from git.
>
> Signed-off-by: Raymond Danks <ray.danks@se-eng.com>
> ---
>   meta/recipes-devtools/mkelfimage/mkelfimage_git.bb |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb b/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
> index 1224a63..4b45c67 100644
> --- a/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
> +++ b/meta/recipes-devtools/mkelfimage/mkelfimage_git.bb
> @@ -4,7 +4,7 @@ SECTION = "devel"
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=ea5bed2f60d357618ca161ad539f7c0a"
>
> -SRCREV = "e13632a939e7dde8d7d44fc73e73a41dae8060c3"
> +SRCREV = "e1e6a91ce0738400fa1615179de88ebc0df29f66"
>   PV = "1.0.0+gitr${SRCPV}"
>   PR = "r1"
>
>
Merged into OE-Core

Thanks
	Sau!



