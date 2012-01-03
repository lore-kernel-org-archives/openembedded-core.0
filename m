Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RiEHn-0001zK-93
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 01:00:55 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 03 Jan 2012 15:53:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="102877610"
Received: from unknown (HELO [10.255.13.127]) ([10.255.13.127])
	by fmsmga001.fm.intel.com with ESMTP; 03 Jan 2012 15:53:33 -0800
Message-ID: <4F0394FD.9090201@linux.intel.com>
Date: Tue, 03 Jan 2012 15:53:33 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1325055284.git.lei.mei@intel.com>
In-Reply-To: <cover.1325055284.git.lei.mei@intel.com>
Subject: Re: [PATCH 0/1] rpm:fix bug 1769
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
X-List-Received-Date: Wed, 04 Jan 2012 00:00:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/27/2011 10:56 PM, Mei Lei wrote:
> Hi all,
> 	This patch will fix bug 1769. The discussion from community can be found here:
> 	http://rpm5.org/community/rpm-devel/5087.html
> 	Please review and merge it.	
> Thanks,
> Lei
>
>
>
> The following changes since commit 8f348ccad083d6c02c200652ff6295e701e88f0d:
>    Saul Wold (1):
>          coreutils: ensure --color works so DEPEND on libcap
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib lmei3/bug1769
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=lmei3/bug1769
>
> Mei Lei (1):
>    rpm: Fix rpm database files capacity issue.
>
>   meta/classes/rootfs_rpm.bbclass                   |    3 +++
>   meta/recipes-devtools/rpm/rpm/rpm-db-reduce.patch |   19 +++++++++++++++++++
>   meta/recipes-devtools/rpm/rpm_5.4.0.bb            |    3 ++-
>   3 files changed, 24 insertions(+), 1 deletions(-)
>   create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-db-reduce.patch
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
Merged into OE-Core

Good Luck in your future job and School.

Thanks for your contributions

Sau!


