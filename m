Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SuTdG-0008Ct-O2
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 21:22:00 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 26 Jul 2012 12:10:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="127288354"
Received: from unknown (HELO [10.255.12.157]) ([10.255.12.157])
	by AZSMGA002.ch.intel.com with ESMTP; 26 Jul 2012 12:10:26 -0700
Message-ID: <50119622.9020907@linux.intel.com>
Date: Thu, 26 Jul 2012 12:10:26 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1343162715.git.mark.hatle@windriver.com>
In-Reply-To: <cover.1343162715.git.mark.hatle@windriver.com>
Subject: Re: [PATCH 0/1] Add missing Upstream-Status entries.
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
X-List-Received-Date: Thu, 26 Jul 2012 19:22:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/24/2012 01:46 PM, Mark Hatle wrote:
> Add missing Upstream-Status entries, no code changes.
>
> The following changes since commit 4148bc80c008d25c8a536c7c7dfdeac1669a6662:
>
>    libgcc: Add missing dependency on libc:do_package (2012-07-24 10:12:08 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib mhatle/status
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/status
>
> Mark Hatle (1):
>    Add missing Upstream-Status to various patches.
>
>   .../binutils/binutils/binutils-armv5e.patch        |    4 ++++
>   .../ossp-uuid/0001-Change-library-name.patch       |    7 +++++++
>   ...erve-m-option-status-in-v-option-handling.patch |    7 +++++++
>   .../ossp-uuid/0003-Fix-whatis-entries.patch        |    7 +++++++
>   .../ossp-uuid/0004-fix-data-uuid-from-string.patch |    7 +++++++
>   .../ossp-uuid/ossp-uuid/uuid-libtool.patch         |    3 +++
>   .../ossp-uuid/ossp-uuid/uuid-nostrip.patch         |    3 +++
>   meta/recipes-devtools/rpm/rpm/rpm-lua.patch        |    2 ++
>   meta/recipes-devtools/rpm/rpm/rpm-macros.patch     |    2 ++
>   .../rpm/rpm/rpm-no-perl-urpm.patch                 |    2 ++
>   meta/recipes-devtools/rpm/rpm/rpm-ossp-uuid.patch  |    2 ++
>   .../rpm/rpm/rpm-packageorigin.patch                |    2 ++
>   .../rpm/rpm/rpm-pkgconfigdeps.patch                |    2 ++
>   meta/recipes-devtools/rpm/rpm/rpm-resolvedep.patch |    2 ++
>   .../libzypp/libzypp/libzypp-rpm549.patch           |    4 ++++
>   .../createrepo/createrepo/createrepo-rpm549.patch  |    3 +++
>   16 files changed, 59 insertions(+), 0 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


