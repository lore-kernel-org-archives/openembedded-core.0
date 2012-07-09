Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SoH21-0004gQ-Hs
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 18:41:53 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jul 2012 09:30:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="190311929"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jul 2012 09:30:43 -0700
Message-ID: <4FFB0733.1050902@linux.intel.com>
Date: Mon, 09 Jul 2012 09:30:43 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1341845577.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1341845577.git.bruce.ashfield@windriver.com>
Subject: Re: [PATCH 0/1] linux-yocto: update 3.4 SRCREVs (perf + unionfs fix)
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
X-List-Received-Date: Mon, 09 Jul 2012 16:41:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/09/2012 07:59 AM, Bruce Ashfield wrote:
> Saul/Richard,
>
> I was waiting on the resend of Tom's perf series to send the updated
> kernel parts for this. That's out, and the kernel parts now need to
> be updated.
>
> I've also staged a unionfs build fix along with the perf updates.
>
> Cheers,
>
> Bruce
>
> cc: Tom Zanussi <tom.zanussi@intel.com>
>
> The following changes since commit f40ce3e1f4ceebc90b3c058dc82750829149c21d:
>
>    package_rpm: Avoid duplicate package generation failures (2012-07-09 11:38:02 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib zedd/kernel
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>
> Bruce Ashfield (1):
>    linux-yocto/3.4: perf scripting & unionfs fixes
>
>   meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |    6 +++---
>   meta/recipes-kernel/linux/linux-yocto_3.4.bb    |   14 +++++++-------
>   2 files changed, 10 insertions(+), 10 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


