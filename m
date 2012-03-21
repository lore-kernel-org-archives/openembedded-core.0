Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SAQkZ-0006vr-UA
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 19:59:12 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 21 Mar 2012 11:50:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="131629942"
Received: from unknown (HELO [10.255.12.49]) ([10.255.12.49])
	by fmsmga001.fm.intel.com with ESMTP; 21 Mar 2012 11:50:17 -0700
Message-ID: <4F6A22E8.4070100@linux.intel.com>
Date: Wed, 21 Mar 2012 11:50:16 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1331859725.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1331859725.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 0/1] native.bbclass: make TOOLCHAIN_OPTIONS empty
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
X-List-Received-Date: Wed, 21 Mar 2012 18:59:12 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/15/2012 06:04 PM, Robert Yang wrote:
> Testinfo:
> Has tested on qemux86, qemuppc and qemuarm.
>
> // Robert
>
> The following changes since commit d4f1ef6b8297826230a68e535098709d07de1f48:
>
>    qt4: package static libraries correctly to fix warnings (2012-03-15 13:33:37 +0000)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib robert/native
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/native
>
> Robert Yang (1):
>    native.bbclass: make TOOLCHAIN_OPTIONS empty
>
>   meta/classes/native.bbclass |    3 +++
>   1 files changed, 3 insertions(+), 0 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


