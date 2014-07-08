Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 77F8C65CC9
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Jul 2014 14:30:32 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 08 Jul 2014 07:25:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,625,1400050800"; d="scan'208";a="570002652"
Received: from unknown (HELO [10.255.13.46]) ([10.255.13.46])
	by orsmga002.jf.intel.com with ESMTP; 08 Jul 2014 07:30:33 -0700
Message-ID: <53BC0089.7020200@linux.intel.com>
Date: Tue, 08 Jul 2014 07:30:33 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Armin Kuster <akuster@mvista.com>, 
	openembedded-core@lists.openembedded.org
References: <1404768785-24026-1-git-send-email-akuster@mvista.com>
	<1404768785-24026-3-git-send-email-akuster@mvista.com>
In-Reply-To: <1404768785-24026-3-git-send-email-akuster@mvista.com>
Subject: Re: [PATCH 2/2] lz4: Add self to maintainers list
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Jul 2014 14:30:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/07/2014 02:33 PM, Armin Kuster wrote:
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>   meta-yocto/conf/distro/include/maintainers.inc | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta-yocto/conf/distro/include/maintainers.inc b/meta-yocto/conf/distro/include/maintainers.inc
> index 4d2f46b..4c566d1 100644
> --- a/meta-yocto/conf/distro/include/maintainers.inc
> +++ b/meta-yocto/conf/distro/include/maintainers.inc
> @@ -419,6 +419,7 @@ RECIPE_MAINTAINER_pn-lttng-tools = "Richard Purdie <richard.purdie@linuxfoundati
>   RECIPE_MAINTAINER_pn-lttng-ust = "Richard Purdie <richard.purdie@linuxfoundation.org>"
>   RECIPE_MAINTAINER_pn-lzop = "Saul Wold <sgw@linux.intel.com>"
>   RECIPE_MAINTAINER_pn-lzo = "Saul Wold <sgw@linux.intel.com>"
> +RECIPE_MAINTAINER_pn-lz4 = "Armin Kuster <akuster@mvista.com>"
>   RECIPE_MAINTAINER_pn-m4 = "Robert Yang <liezhi.yang@windriver.com>"
>   RECIPE_MAINTAINER_pn-mailx = "Kai Kang <kai.kang@windriver.com>"
>   RECIPE_MAINTAINER_pn-make = "Robert Yang <liezhi.yang@windriver.com>"
>
This as an independant patch should go to poky@yoctoproject.org as this 
is part of the poky distro files.

Thanks
	Sau!


