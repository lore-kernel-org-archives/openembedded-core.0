Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SFTnl-0004Ky-Dx
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Apr 2012 19:15:21 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 04 Apr 2012 10:06:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="137623812"
Received: from unknown (HELO [10.255.12.141]) ([10.255.12.141])
	by fmsmga001.fm.intel.com with ESMTP; 04 Apr 2012 10:06:09 -0700
Message-ID: <4F7C7F81.1040100@linux.intel.com>
Date: Wed, 04 Apr 2012 10:06:09 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1333493785.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1333493785.git.nitin.a.kamble@intel.com>
Subject: Re: [PATCH 0/2] Few bugfixes
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
X-List-Received-Date: Wed, 04 Apr 2012 17:15:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/03/2012 03:57 PM, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble<nitin.a.kamble@intel.com>
>
> The following changes since commit 46600e37cf87e9aa68e70f1d21caad8eac974a24:
>
>    elfutils: disable lzma (and bzip2 for native) (2012-04-03 21:32:34 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib nitin/bugfixes
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/bugfixes
>
> Nitin A Kamble (2):
>    gcc-cross-intermediate: fix do_install for x32
>    eglibc packaging: locale packaging configuration
>
>   meta/classes/libc-package.bbclass                  |    8 ++++++++
>   meta/recipes-core/eglibc/eglibc-options.inc        |    6 ------
>   .../gcc/gcc-cross-intermediate.inc                 |    3 ++-
>   3 files changed, 10 insertions(+), 7 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


