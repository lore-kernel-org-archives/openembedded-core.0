Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T7TqP-0004Yv-AQ
	for openembedded-core@lists.openembedded.org;
	Fri, 31 Aug 2012 18:13:17 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 31 Aug 2012 09:00:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,347,1344236400"; d="scan'208";a="216774601"
Received: from unknown (HELO [10.255.12.251]) ([10.255.12.251])
	by fmsmga001.fm.intel.com with ESMTP; 31 Aug 2012 09:00:55 -0700
Message-ID: <5040DFB7.3020909@linux.intel.com>
Date: Fri, 31 Aug 2012 09:00:55 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Christopher Larson <kergoth@gmail.com>
References: <1346348289-28470-1-git-send-email-kergoth@gmail.com>
In-Reply-To: <1346348289-28470-1-git-send-email-kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Update lttng-2.0 versions
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
X-List-Received-Date: Fri, 31 Aug 2012 16:13:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/30/2012 10:38 AM, Christopher Larson wrote:
> From: Christopher Larson <chris_larson@mentor.com>
>
> lttng-modules: 2.0.pre11 -> 2.0.5
> lttng-tools: 2.0.1 -> 2.0.4
> lttng2-ust: 2.0.2 -> 2.0.5
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
>   ...modules_2.0.pre11.bb => lttng-modules_2.0.5.bb} |    0
>   .../{lttng-tools_2.0.1.bb => lttng-tools_2.0.4.bb} |    0
>   .../{lttng2-ust_2.0.2.bb => lttng2-ust_2.0.5.bb}   |    0
>   3 files changed, 0 insertions(+), 0 deletions(-)
>   rename meta/recipes-kernel/lttng-2.0/{lttng-modules_2.0.pre11.bb => lttng-modules_2.0.5.bb} (100%)
>   rename meta/recipes-kernel/lttng-2.0/{lttng-tools_2.0.1.bb => lttng-tools_2.0.4.bb} (100%)
>   rename meta/recipes-kernel/lttng-2.0/{lttng2-ust_2.0.2.bb => lttng2-ust_2.0.5.bb} (100%)
>
> diff --git a/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.pre11.bb b/meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.5.bb
> similarity index 100%
> rename from meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.pre11.bb
> rename to meta/recipes-kernel/lttng-2.0/lttng-modules_2.0.5.bb
> diff --git a/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.1.bb b/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.4.bb
> similarity index 100%
> rename from meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.1.bb
> rename to meta/recipes-kernel/lttng-2.0/lttng-tools_2.0.4.bb
> diff --git a/meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.2.bb b/meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.5.bb
> similarity index 100%
> rename from meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.2.bb
> rename to meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.5.bb
>
Merged into OE-Core

Thanks
	Sau!



