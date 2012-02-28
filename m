Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S2SF6-0002JL-L4
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Feb 2012 19:57:44 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 28 Feb 2012 10:49:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="122688172"
Received: from unknown (HELO [10.255.15.37]) ([10.255.15.37])
	by fmsmga001.fm.intel.com with ESMTP; 28 Feb 2012 10:49:16 -0800
Message-ID: <4F4D21AC.1050507@linux.intel.com>
Date: Tue, 28 Feb 2012 10:49:16 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1330441351.git.otavio@ossystems.com.br>
	<069c73ea80c568c07f893f084b5bf5c2259e5a59.1330441351.git.otavio@ossystems.com.br>
In-Reply-To: <069c73ea80c568c07f893f084b5bf5c2259e5a59.1330441351.git.otavio@ossystems.com.br>
Subject: Re: [PATCH 1/1] licenses.conf: fix quotting of SRC_DISTRIBUTE_LICENSES
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
X-List-Received-Date: Tue, 28 Feb 2012 18:57:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/28/2012 07:02 AM, Otavio Salvador wrote:
> Signed-off-by: Otavio Salvador<otavio@ossystems.com.br>
> ---
>   meta/conf/licenses.conf |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf
> index e2f6149..6ed4dfe 100644
> --- a/meta/conf/licenses.conf
> +++ b/meta/conf/licenses.conf
> @@ -35,7 +35,7 @@ SRC_DISTRIBUTE_LICENSES += "OFL-1.1 OGTSL OLDAP-2.8 OpenSSL OSL-1.0 OSL-2.0"
>   SRC_DISTRIBUTE_LICENSES += "OSL-3.0 PD PHP-3.0 PostgreSQL Proprietary"
>   SRC_DISTRIBUTE_LICENSES += "Python-2.0 QPL-1.0 RHeCos-1 RHeCos-1.1 RPL-1.5"
>   SRC_DISTRIBUTE_LICENSES += "RPSL-1.0 RSCPL Ruby SAX-PD Simple-2.0 Sleepycat"
> -SRC_DISTRIBUTE_LICENSES += "SPL-1.0 SugarCRM-1 SugarCRM-1.1.3 UCB VSL-1.0 W3C
> +SRC_DISTRIBUTE_LICENSES += "SPL-1.0 SugarCRM-1 SugarCRM-1.1.3 UCB VSL-1.0 W3C"
>   SRC_DISTRIBUTE_LICENSES += "Watcom-1.0 WXwindows XFree86-1.1 Xnet YPL-1.1"
>   SRC_DISTRIBUTE_LICENSES += "Zimbra-1.3 Zlib ZPL-1.1 ZPL-2.0 ZPL-2.1"
>

Merged into OE-core

Thanks
	Sau!


