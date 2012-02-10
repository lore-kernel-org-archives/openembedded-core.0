Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rvsvk-0005nY-SH
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 17:02:37 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 10 Feb 2012 07:54:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="116345506"
Received: from unknown (HELO [10.255.14.208]) ([10.255.14.208])
	by fmsmga001.fm.intel.com with ESMTP; 10 Feb 2012 07:54:29 -0800
Message-ID: <4F353DB5.9010402@linux.intel.com>
Date: Fri, 10 Feb 2012 07:54:29 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1328563142.git.chris_larson@mentor.com>
In-Reply-To: <cover.1328563142.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 0/4] 2nd pass of external-csl-toolchain improvements
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
X-List-Received-Date: Fri, 10 Feb 2012 16:02:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/06/2012 01:20 PM, Christopher Larson wrote:
> From: Christopher Larson<chris_larson@mentor.com>
>
> The following changes since commit 18d9fcfc4bc4b01f73e89f3b988c9d3d543c7705:
>
>    libzypp: add missing runtime dependences on gzip and gnupg (2012-02-03 17:23:28 +0000)
>
> are available in the git repository at:
>    https://github.com/kergoth/oe-core external-toolchain-fixes
>
> Christopher Larson (4):
>        external-csl-toolchain: set PKG/PKGV for staticdev
>        external-csl-toolchain: fix mtd-user.h issue
>        external-csl-toolchain: correct binary packaging
>        external-csl-toolchain: split out gdbserver packages
>
>   meta/recipes-core/meta/external-csl-toolchain.bb |   18 +++++++++++++++---
>   1 files changed, 15 insertions(+), 3 deletions(-)
>
> Christopher Larson (4):
>    external-csl-toolchain: set PKG/PKGV for staticdev
>    external-csl-toolchain: fix mtd-user.h issue
>    external-csl-toolchain: correct binary packaging
>    external-csl-toolchain: split out gdbserver packages
>
>   meta/recipes-core/meta/external-csl-toolchain.bb |   18 +++++++++++++++---
>   1 files changed, 15 insertions(+), 3 deletions(-)
>
Merged all of these to OE-core

Thanks
	Sau!


