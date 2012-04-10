Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SHd7R-0006SG-4w
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 17:36:34 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 10 Apr 2012 08:27:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="127352157"
Received: from unknown (HELO [10.255.12.159]) ([10.255.12.159])
	by orsmga001.jf.intel.com with ESMTP; 10 Apr 2012 08:27:05 -0700
Message-ID: <4F845149.2090202@linux.intel.com>
Date: Tue, 10 Apr 2012 08:27:05 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1333744298.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1333744298.git.dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>, Rahul Saxena <rahul.saxena@intel.com>
Subject: Re: [PATCH 0/1][Yocto 1.2] grub-efi: Include GPT partition EXT FS support
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
X-List-Received-Date: Tue, 10 Apr 2012 15:36:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/06/2012 01:32 PM, Darren Hart wrote:
> The following changes since commit 1a82989345fb98becb487d270fd93a5e6dffeb47:
>
>    runqemu-internal: Add console=tty for qemuppc and NFS (2012-04-06 01:12:15 +0100)
>
> are available in the git repository at:
>    git://git.yoctoproject.org/user-contrib/dvhart/oe-core efi
>    http://git.yoctoproject.org/cgit.cgi/user-contrib/dvhart/oe-core/log/?h=efi
>
> Darren Hart (1):
>    grub-efi: Include GPT partition EXT FS support
>
>   meta/recipes-bsp/grub/grub-efi-native_1.99.bb |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


