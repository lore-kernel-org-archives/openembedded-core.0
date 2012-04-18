Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SKWYw-0003wC-S4
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 17:12:56 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 18 Apr 2012 08:03:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="131231114"
Received: from unknown (HELO [10.255.12.104]) ([10.255.12.104])
	by orsmga001.jf.intel.com with ESMTP; 18 Apr 2012 08:03:25 -0700
Message-ID: <4F8ED7BD.1090402@linux.intel.com>
Date: Wed, 18 Apr 2012 08:03:25 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1334700265.git.mark.hatle@windriver.com>
In-Reply-To: <cover.1334700265.git.mark.hatle@windriver.com>
Subject: Re: [PATCH 0/1] Fix incorrect update-alternative settings in matchbox-wm-2
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
X-List-Received-Date: Wed, 18 Apr 2012 15:12:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/17/2012 03:05 PM, Mark Hatle wrote:
> This looks like it was a simple copy/paste induced error.. fixed.w
>
> The following changes since commit 89788fbd10fdfbbe54927339d7ec516d0e4d7ef5:
>
>    libproxy: Allow to build in non-gplv3 configuration (2012-04-17 14:08:27 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib mhatle/fixes
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/fixes
>
> Mark Hatle (1):
>    matchbox-wm-2: Fix incorrect update-alternatives
>
>   .../matchbox-wm-2/matchbox-wm-2_git.bb             |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>
Merged into OE-Core

Thanks
	Sau!


