Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T1LOi-0001BQ-SV
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Aug 2012 19:59:21 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 14 Aug 2012 10:47:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,766,1336374000"; d="scan'208";a="181005249"
Received: from unknown (HELO [10.255.12.219]) ([10.255.12.219])
	by azsmga001.ch.intel.com with ESMTP; 14 Aug 2012 10:47:22 -0700
Message-ID: <502A8F29.6090806@linux.intel.com>
Date: Tue, 14 Aug 2012 20:47:21 +0300
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1344860952.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1344860952.git.liezhi.yang@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 0/1] qemu.inc: disable curl for qemu-nativesdk
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
X-List-Received-Date: Tue, 14 Aug 2012 17:59:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/13/2012 04:01 PM, Robert Yang wrote:
> The following changes since commit 2dec760b79bb7e2e79c33c5127fa64685bd86a18:
>
>    foomatic: fix perl path for target (2012-08-08 10:06:00 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib robert/qemu
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/qemu
>
> Robert Yang (1):
>    qemu.inc: disable curl for qemu-nativesdk
>
>   meta/recipes-devtools/qemu/qemu.inc       |    4 +++-
>   meta/recipes-devtools/qemu/qemu_0.15.1.bb |    2 +-
>   meta/recipes-devtools/qemu/qemu_git.bb    |    2 +-
>   3 files changed, 5 insertions(+), 3 deletions(-)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
Merged into OE-Core

Thanks
	Sau!



