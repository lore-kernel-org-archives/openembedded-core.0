Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qc8PS-0007QC-JY
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Jun 2011 05:59:22 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 29 Jun 2011 20:55:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,447,1304319600"; d="scan'208";a="22163020"
Received: from unknown (HELO [10.255.14.13]) ([10.255.14.13])
	by fmsmga002.fm.intel.com with ESMTP; 29 Jun 2011 20:55:38 -0700
Message-ID: <4E0BF3B9.5060909@linux.intel.com>
Date: Wed, 29 Jun 2011 20:55:37 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1308543589.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1308543589.git.dexuan.cui@intel.com>
Subject: Re: [PATCH 0/1] sanity.bbclass: only run check_pseudo_wrapper for bitbake
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
X-List-Received-Date: Thu, 30 Jun 2011 03:59:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/19/2011 09:25 PM, Dexuan Cui wrote:
> Please view it.
>
> The following changes since commit 2163461ec94528ecf046a04edc5db3d2dd3a6b8b:
>
>    systemtap: remove non-core COMPATIBLE_MACHINES (2011-06-16 22:14:06 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib dcui/sanity
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/sanity
>
> Dexuan Cui (1):
>    sanity.bbclass: only run check_pseudo_wrapper for bitbake
>
>   meta/classes/sanity.bbclass |    4 ++++
>   1 files changed, 4 insertions(+), 0 deletions(-)
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


