Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TBqGZ-0001tX-M0
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 18:58:19 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 12 Sep 2012 09:45:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,410,1344236400"; d="scan'208";a="221129265"
Received: from unknown (HELO [10.255.13.93]) ([10.255.13.93])
	by fmsmga002.fm.intel.com with ESMTP; 12 Sep 2012 09:45:46 -0700
Message-ID: <5050BC3A.8060906@linux.intel.com>
Date: Wed, 12 Sep 2012 09:45:46 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Mark Hatle <mark.hatle@windriver.com>
References: <cover.1347055585.git.mark.hatle@windriver.com>
In-Reply-To: <cover.1347055585.git.mark.hatle@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] Minor fix to qt4 -dbg packages
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Sep 2012 16:58:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/07/2012 03:07 PM, Mark Hatle wrote:
> The following changes since commit 0de1827a9601143b090f751ea702fdb65a936b77:
>
>    classes/mirrors: remove bogus gnutls mirror (2012-09-07 14:51:10 +0100)
>
> are available in the git repository at:
>    git://git.yoctoproject.org/poky-contrib mhatle/qt4
>    http://git.yoctoproject.org/cgit.cgi//log/?h=mhatle/qt4
>
> Mark Hatle (1):
>    qt4: Update qt4.inc to remove staticdev deps in -dbg packages
>
>   meta/recipes-qt/qt4/qt4-embedded.inc |    2 +-
>   meta/recipes-qt/qt4/qt4-x11-free.inc |    2 +-
>   meta/recipes-qt/qt4/qt4.inc          |    2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
>
Merged into OE-Core

Thanks
	Sau!



