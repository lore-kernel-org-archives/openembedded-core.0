Received: from [192.55.52.88] (helo=mga01.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T61Vx-0002IC-JZ
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Aug 2012 17:46:09 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 Aug 2012 08:33:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,321,1344236400"; d="scan'208";a="214470146"
Received: from unknown (HELO [10.255.13.20]) ([10.255.13.20])
	by fmsmga002.fm.intel.com with ESMTP; 27 Aug 2012 08:33:55 -0700
Message-ID: <503B9363.90901@linux.intel.com>
Date: Mon, 27 Aug 2012 08:33:55 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Mark Hatle <mark.hatle@windriver.com>
References: <cover.1345836240.git.mark.hatle@windriver.com>
In-Reply-To: <cover.1345836240.git.mark.hatle@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] Whitelist parallel build variables
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
X-List-Received-Date: Mon, 27 Aug 2012 15:46:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/24/2012 12:24 PM, Mark Hatle wrote:
> The following changes since commit 968cfc0b630fb409430a46b1512d6bf0de225ad1:
>
>    build-appliance-image: Add vmx* files and build zip file (2012-08-24 17:32:34 +0100)
>
> are available in the git repository at:
>    git://git.yoctoproject.org/poky-contrib mhatle/whitelist
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mhatle/whitelist
>
> Mark Hatle (1):
>    bitbake.conf: add variables to exclude from hash.
>
>   meta/conf/bitbake.conf |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
Merged into OE-Core

Thanks
	Sau!



