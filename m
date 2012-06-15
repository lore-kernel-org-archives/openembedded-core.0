Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SfbAX-0001HT-MW
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2012 20:22:49 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 15 Jun 2012 11:12:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="156899932"
Received: from unknown (HELO [10.255.12.138]) ([10.255.12.138])
	by azsmga001.ch.intel.com with ESMTP; 15 Jun 2012 11:12:10 -0700
Message-ID: <4FDB7AF9.7030801@linux.intel.com>
Date: Fri, 15 Jun 2012 11:12:09 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1339764889-25852-1-git-send-email-laurentiu.palcu@intel.com>
	<1339764889-25852-2-git-send-email-laurentiu.palcu@intel.com>
In-Reply-To: <1339764889-25852-2-git-send-email-laurentiu.palcu@intel.com>
Subject: Re: [PATCH 1/2] directfb: added missing Upstream-status
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
X-List-Received-Date: Fri, 15 Jun 2012 18:22:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/15/2012 05:54 AM, Laurentiu Palcu wrote:
> Signed-off-by: Laurentiu Palcu<laurentiu.palcu@intel.com>
> ---
>   ...ibdirect-remove-include-of-linux-config.h.patch |    2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-graphics/directfb/directfb/libdirect-remove-include-of-linux-config.h.patch b/meta/recipes-graphics/directfb/directfb/libdirect-remove-include-of-linux-config.h.patch
> index eeb7738..dcf6736 100644
> --- a/meta/recipes-graphics/directfb/directfb/libdirect-remove-include-of-linux-config.h.patch
> +++ b/meta/recipes-graphics/directfb/directfb/libdirect-remove-include-of-linux-config.h.patch
> @@ -1,3 +1,5 @@
> +Upstream-status: backport from 1.6.0-pre1
> +
>   From cd575a84f10d90759e069f5f2e6092251a1b84bd Mon Sep 17 00:00:00 2001
>   From: Sven Neumann<s.neumann@raumfeld.com>
>   Date: Fri, 23 Sep 2011 10:00:02 +0200

Merged into OE-Core

Thanks
	Sau!


