Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TB6HD-0004UB-8d
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Sep 2012 17:51:56 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 10 Sep 2012 08:39:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,398,1344236400"; d="scan'208";a="143376934"
Received: from unknown (HELO [10.255.13.123]) ([10.255.13.123])
	by AZSMGA002.ch.intel.com with ESMTP; 10 Sep 2012 08:39:16 -0700
Message-ID: <504E09A4.2090506@linux.intel.com>
Date: Mon, 10 Sep 2012 08:39:16 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Kang Kai <kai.kang@windriver.com>
References: <cover.1346830465.git.kai.kang@windriver.com>
In-Reply-To: <cover.1346830465.git.kai.kang@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] Update packages ltp and lsb
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
X-List-Received-Date: Mon, 10 Sep 2012 15:51:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/05/2012 12:36 AM, Kang Kai wrote:
> The following changes since commit 37c8597e7600385367257e8a513e003947ebef5b:
>
>    distro-tracking: remove xserver-kdrive (2012-09-02 05:52:16 -0700)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib kangkai/update-pkgs
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/update-pkgs
>
> Kang Kai (2):
>    ltp: update
>    lsb: update version
>
>   .../lsb/{lsb_1.4.bb => lsb_4.1.bb}                 |   34 ++++++++++----------
>   .../ltp/{ltp_20120614.bb => ltp_20120903.bb}       |    6 ++--
>   2 files changed, 20 insertions(+), 20 deletions(-)
>   rename meta/recipes-extended/lsb/{lsb_1.4.bb => lsb_4.1.bb} (84%)
>   rename meta/recipes-extended/ltp/{ltp_20120614.bb => ltp_20120903.bb} (96%)
>
Merged into OE-Core

Thanks
	Sau!



