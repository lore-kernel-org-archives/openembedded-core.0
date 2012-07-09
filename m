Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SoHb7-0006IH-N5
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 19:18:09 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jul 2012 10:06:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="190328403"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jul 2012 10:06:59 -0700
Message-ID: <4FFB0FB3.7070109@linux.intel.com>
Date: Mon, 09 Jul 2012 10:06:59 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1341508255.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1341508255.git.scott.a.garman@intel.com>
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: Re: [PATCH 0/2] runqemu minor fixes
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
X-List-Received-Date: Mon, 09 Jul 2012 17:18:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/05/2012 10:12 AM, Scott Garman wrote:
> Hello,
>
> These two commits fix yocto bug #2611.
>
> Scott
>
> The following changes since commit dcc43c34bfa9304233ecfd3f518a84ddfdc2fd90:
>
>    perf: remove unconditional python-ext install (2012-07-05 15:56:17 +0100)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib sgarman/runqemu-minor-fixes-oe
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=runqemu-minor-fixes-oe
>
> Scott Garman (2):
>    runqemu: fix support for ext4 rootfs images
>    runqemu: fix usage() help for MACHINE setting
>
>   scripts/runqemu |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


