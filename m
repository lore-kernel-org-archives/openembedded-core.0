Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QrvxH-0001Zo-ML
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 19:55:35 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 12 Aug 2011 10:51:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,363,1309762800"; 
   d="scan'208";a="6593513"
Received: from unknown (HELO [10.255.14.248]) ([10.255.14.248])
	by AZSMGA002.ch.intel.com with ESMTP; 12 Aug 2011 10:51:01 -0700
Message-ID: <4E456805.7010102@linux.intel.com>
Date: Fri, 12 Aug 2011 10:51:01 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1313036597.git.lei.mei@intel.com>
In-Reply-To: <cover.1313036597.git.lei.mei@intel.com>
Subject: Re: [PATCH 0/1]Fix bug 1151
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
X-List-Received-Date: Fri, 12 Aug 2011 17:55:35 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/10/2011 09:28 PM, Mei Lei wrote:
> The following changes since commit a1f87ec65fa1a6d5ce9a010548dbe7c01ab9b711:
>    Kumar Gala (1):
>          eglibc: force GLIBC_EXTRA_OECONF to not be uset for nativesdk
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib lmei3/bug1151
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=lmei3/bug1151
>
> Mei Lei (1):
>    init-install.sh: Fix make partition and make file system issues
>
>   .../initrdscripts/files/init-install.sh            |    6 +++---
>   1 files changed, 3 insertions(+), 3 deletions(-)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

Merged into OE-Core

Thanks
	Sau!


