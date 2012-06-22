Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Si8e5-0000s6-FQ
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jun 2012 20:31:49 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 22 Jun 2012 11:20:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="183800480"
Received: from unknown (HELO [10.255.12.175]) ([10.255.12.175])
	by fmsmga002.fm.intel.com with ESMTP; 22 Jun 2012 11:20:57 -0700
Message-ID: <4FE4B789.5080108@linux.intel.com>
Date: Fri, 22 Jun 2012 11:20:57 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1340177329.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1340177329.git.liezhi.yang@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 0/1] package_rpm.bbclass: fix incremental rpm generation
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
X-List-Received-Date: Fri, 22 Jun 2012 18:31:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/20/2012 07:29 PM, Robert Yang wrote:
> The following changes since commit e0a70547069fe7e8a2d6bdaffc985fb172d46c31:
>
>    perl: Allow perl to cross build and native build in a directory named "t" (2012-06-18 17:33:04 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib robert/rpm_inc
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/rpm_inc
>
> Robert Yang (1):
>    package_rpm.bbclass: fix incremental rpm generation
>
>   meta/classes/package_rpm.bbclass |   16 +++++++++++++---
>   1 files changed, 13 insertions(+), 3 deletions(-)
>
>
Merged into OE-Core

Thanks
	Sau!


> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


