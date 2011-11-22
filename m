Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RSwbl-0001nn-Rd
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Nov 2011 21:06:22 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 22 Nov 2011 11:59:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="78918830"
Received: from unknown (HELO [10.255.12.15]) ([10.255.12.15])
	by orsmga001.jf.intel.com with ESMTP; 22 Nov 2011 11:59:23 -0800
Message-ID: <4ECBFF1A.9060002@linux.intel.com>
Date: Tue, 22 Nov 2011 11:59:22 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1321921040.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1321921040.git.nitin.a.kamble@intel.com>
Subject: Re: [PATCH 0/1] netbase.bbappend version fix - version 2
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
X-List-Received-Date: Tue, 22 Nov 2011 20:06:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/21/2011 04:18 PM, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble<nitin.a.kamble@intel.com>
>
> The following changes since commit 7022a8f8045bdf82b9209b8cd62fb09c4a7a24f8:
>
>    gcc-4.6: Fix gcc ICE on qt4-x11-free/armv7-a (2011-11-21 16:55:12 +0000)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib nitin/misc
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/misc
>
> Nitin A Kamble (1):
>    netbase.bbappend: sync up with oecore/yocto layer
>
>   .../beagleboard/interfaces                         |    0
>   ...netbase_4.46.bbappend =>  netbase_4.47.bbappend} |    0
>   2 files changed, 0 insertions(+), 0 deletions(-)
>   rename meta-yocto/recipes-core/netbase/{netbase-4.46 =>  netbase-4.47}/beagleboard/interfaces (100%)
>   rename meta-yocto/recipes-core/netbase/{netbase_4.46.bbappend =>  netbase_4.47.bbappend} (100%)
>

This should really go to the poky@yoctoproject.org list since it's poky 
specific.

Thanks
	Sau!


