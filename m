Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RdoHW-0000VU-EJ
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 20:26:22 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 22 Dec 2011 11:19:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="105201754"
Received: from unknown (HELO [10.255.12.90]) ([10.255.12.90])
	by fmsmga002.fm.intel.com with ESMTP; 22 Dec 2011 11:19:14 -0800
Message-ID: <4EF382B2.4010208@linux.intel.com>
Date: Thu, 22 Dec 2011 11:19:14 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1324271587.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1324271587.git.dexuan.cui@intel.com>
Subject: Re: [PATCH 0/1] fix wget build issue: /usr/lib/libssl.so: could not read symbols
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
X-List-Received-Date: Thu, 22 Dec 2011 19:26:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/18/2011 09:14 PM, Dexuan Cui wrote:
> The following changes since commit b281fd127bac9ba77ab63a5c2b812ddd5d56df37:
>
>    documentation/poky-ref-manual/technical-details.xml: edits per Richard Purdie (2011-12-16 16:58:41 +0000)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib dcui/wget
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/wget
>
> Dexuan Cui (1):
>    wget: fix a host intrusion issue introduced by adding
>      --with-ssl=openssl.
>
>   meta/recipes-extended/wget/wget.inc |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


