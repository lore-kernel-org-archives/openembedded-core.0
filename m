Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TCY8Z-0005TK-Fl
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Sep 2012 17:48:59 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 14 Sep 2012 08:36:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,423,1344236400"; d="scan'208";a="203960921"
Received: from unknown (HELO [10.255.13.94]) ([10.255.13.94])
	by orsmga002.jf.intel.com with ESMTP; 14 Sep 2012 08:36:15 -0700
Message-ID: <50534EEE.5090407@linux.intel.com>
Date: Fri, 14 Sep 2012 08:36:14 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>
References: <1347357435-22083-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1347357435-22083-1-git-send-email-ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] connman: remove trailing whitespace
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
X-List-Received-Date: Fri, 14 Sep 2012 15:48:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/11/2012 02:57 AM, Ross Burton wrote:
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/recipes-connectivity/connman/connman.inc |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
> index 59ec1fa..5b94a1e 100644
> --- a/meta/recipes-connectivity/connman/connman.inc
> +++ b/meta/recipes-connectivity/connman/connman.inc
> @@ -1,5 +1,5 @@
>   SUMMARY = "A daemon for managing internet connections within embedded devices"
> -DESCRIPTION = "The ConnMan project provides a daemon for managing \
> +DESCRIPTION = "The ConnMan project provides a daemon for managing \
>   internet connections within embedded devices running the Linux \
>   operating system.  The Connection Manager is designed to be slim and \
>   to use as few resources as possible, so it can be easily integrated. \
>

Merged into OE-Core

Thanks
	Sau!



