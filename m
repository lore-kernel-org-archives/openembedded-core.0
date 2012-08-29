Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T6qiN-0005Pp-0F
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Aug 2012 00:26:23 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 29 Aug 2012 15:14:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,335,1344236400"; d="scan'208";a="215494119"
Received: from unknown (HELO [10.255.13.94]) ([10.255.13.94])
	by fmsmga002.fm.intel.com with ESMTP; 29 Aug 2012 15:14:04 -0700
Message-ID: <503E942B.7090207@linux.intel.com>
Date: Wed, 29 Aug 2012 15:14:03 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Florin Sarbu <florin.sarbu@windriver.com>
References: <1346225825-24665-1-git-send-email-florin.sarbu@windriver.com>
In-Reply-To: <1346225825-24665-1-git-send-email-florin.sarbu@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] intltool: Add Upstream-Status and Signed-off-by to remove-xml-check.patch
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
X-List-Received-Date: Wed, 29 Aug 2012 22:26:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/29/2012 12:37 AM, Florin Sarbu wrote:
> Signed-off-by: Florin Sarbu <florin.sarbu@windriver.com>
> ---
>   .../intltool-0.50.0/remove-xml-check.patch         |    4 ++++
>   1 files changed, 4 insertions(+), 0 deletions(-)
>
> diff --git a/meta/recipes-devtools/intltool/intltool-0.50.0/remove-xml-check.patch b/meta/recipes-devtools/intltool/intltool-0.50.0/remove-xml-check.patch
> index 476d091..fc69e37 100644
> --- a/meta/recipes-devtools/intltool/intltool-0.50.0/remove-xml-check.patch
> +++ b/meta/recipes-devtools/intltool/intltool-0.50.0/remove-xml-check.patch
> @@ -1,3 +1,7 @@
> +Signed-off-by: Florin Sarbu <florin.sarbu@windriver.com>
> +
> +Upstream-Status: Inappropriate [OE specific]
> +
>   Index: intltool-0.40.6/intltool.m4
>   ===================================================================
>   --- intltool-0.40.6.orig/intltool.m4	2009-02-14 14:12:28.000000000 -0800
>

Merged into OE-Core

Thanks
	Sau!



