Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RGfiY-0003l2-Js
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 01:38:38 +0200
Received: from mail-bw0-f52.google.com ([209.85.214.52])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 19 Oct 2011 16:32:42 -0700
Received: by bkbzs2 with SMTP id zs2so2692101bkb.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2011 16:32:40 -0700 (PDT)
Received: by 10.223.36.193 with SMTP id u1mr3338371fad.27.1319067160418;
	Wed, 19 Oct 2011 16:32:40 -0700 (PDT)
Received: from [10.6.18.230] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id x22sm12225027faa.5.2011.10.19.16.32.37
	(version=SSLv3 cipher=OTHER); Wed, 19 Oct 2011 16:32:38 -0700 (PDT)
Message-ID: <4E9F5E14.5010203@intel.com>
Date: Wed, 19 Oct 2011 16:32:36 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1319012299.git.wenzong.fan@windriver.com>
In-Reply-To: <cover.1319012299.git.wenzong.fan@windriver.com>
Subject: Re: [PATCH 0/2] Update packages
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
X-List-Received-Date: Wed, 19 Oct 2011 23:38:38 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/19/2011 01:53 AM, wenzong.fan@windriver.com wrote:
> From: Wenzong Fan<wenzong.fan@windriver.com>
>
> Update ccache/chkconfig to latest version.
>
> The following changes since commit b4757833c3548b5ee3a1cce58e2f059b3f63cb09:
>    Martin Jansa (1):
>          fontconfig: fix fix-pkgconfig.patch
>
Please update the distro_tracking_fields file when updates recipes.

Thanks
	Sau!


> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib wenzong/update_pkgs
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/update_pkgs
>
> Wenzong Fan (2):
>    ccache: update to 3.1.6
>    chkconfig: Update to 1.3.55
>
>   .../ccache/{ccache_3.1.5.bb =>  ccache_3.1.6.bb}    |    4 ++--
>   .../{chkconfig_1.3.52.bb =>  chkconfig_1.3.55.bb}   |    6 +++---
>   2 files changed, 5 insertions(+), 5 deletions(-)
>   rename meta/recipes-devtools/ccache/{ccache_3.1.5.bb =>  ccache_3.1.6.bb} (47%)
>   rename meta/recipes-extended/chkconfig/{chkconfig_1.3.52.bb =>  chkconfig_1.3.55.bb} (83%)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



