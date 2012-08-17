Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T2VMC-0002Y6-6R
	for openembedded-core@lists.openembedded.org;
	Sat, 18 Aug 2012 00:49:32 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 17 Aug 2012 15:37:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,788,1336374000"; d="scan'208";a="210075554"
Received: from unknown (HELO [10.255.12.253]) ([10.255.12.253])
	by fmsmga002.fm.intel.com with ESMTP; 17 Aug 2012 15:37:31 -0700
Message-ID: <502EC7AB.8010201@linux.intel.com>
Date: Fri, 17 Aug 2012 15:37:31 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1345220525.git.mark.hatle@windriver.com>
In-Reply-To: <cover.1345220525.git.mark.hatle@windriver.com>
Subject: Re: [PATCH 0/1] Fix broken attempt only installs with RPM
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
X-List-Received-Date: Fri, 17 Aug 2012 22:49:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/17/2012 09:25 AM, Mark Hatle wrote:
> The following changes since commit 99815eddd4e1eb5d939831704231537dd5a995ad:
>
>    classes/chrpath: improve chrpath failure handling (2012-08-17 15:25:01 +0100)
>
> are available in the git repository at:
>    git://git.yoctoproject.org/poky-contrib mhatle/rpm
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mhatle/rpm
>
> Mark Hatle (1):
>    package_rpm.bbclass: Fix attemptonly install failures
>
>   meta/classes/package_rpm.bbclass |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!



