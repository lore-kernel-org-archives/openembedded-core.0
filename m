Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RdoLt-0000bF-3o
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Dec 2011 20:30:53 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 22 Dec 2011 11:23:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="90577053"
Received: from unknown (HELO [10.255.12.90]) ([10.255.12.90])
	by orsmga002.jf.intel.com with ESMTP; 22 Dec 2011 11:23:45 -0800
Message-ID: <4EF383C1.8060408@linux.intel.com>
Date: Thu, 22 Dec 2011 11:23:45 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1324272052.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1324272052.git.dexuan.cui@intel.com>
Subject: Re: [PATCH 0/1] socat: add the latest stable version 1.7.2.0
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
X-List-Received-Date: Thu, 22 Dec 2011 19:30:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/18/2011 09:22 PM, Dexuan Cui wrote:
> The following changes since commit b281fd127bac9ba77ab63a5c2b812ddd5d56df37:
>
>    documentation/poky-ref-manual/technical-details.xml: edits per Richard Purdie (2011-12-16 16:58:41 +0000)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib dcui/socat
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/socat
>
> Dexuan Cui (1):
>    socat: add the latest stable version 1.7.2.0
>
>   .../recipes-connectivity/socat/files/compile.patch |  946 ++++++++++++++++++++
>   meta/recipes-connectivity/socat/socat_1.7.2.0.bb   |   28 +
>   2 files changed, 974 insertions(+), 0 deletions(-)
>   create mode 100644 meta/recipes-connectivity/socat/files/compile.patch
>   create mode 100644 meta/recipes-connectivity/socat/socat_1.7.2.0.bb
>

Merged the updated version into OE-Core

Thanks
	Sau!


