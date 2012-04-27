Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SNsKk-00082X-J7
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Apr 2012 23:04:06 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 27 Apr 2012 13:54:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="134550006"
Received: from unknown (HELO [10.255.12.123]) ([10.255.12.123])
	by orsmga001.jf.intel.com with ESMTP; 27 Apr 2012 13:54:27 -0700
Message-ID: <4F9B0782.5000508@linux.intel.com>
Date: Fri, 27 Apr 2012 13:54:26 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1335345819.git.shane.wang@intel.com>
In-Reply-To: <cover.1335345819.git.shane.wang@intel.com>
Subject: Re: [PATCH 0/1] Manual check for later package upgrade
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
X-List-Received-Date: Fri, 27 Apr 2012 21:04:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/25/2012 02:26 AM, Shane Wang wrote:
> Update the distro tracking info after manually checking.
>
> The following changes since commit 492a58cabdc053b2312712681dbcffa8270d4ea4:
>
>    self-hosted-image: Update poky revision to point at the 1.2 release branch (2012-04-24 10:21:11 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib shane/manual-check
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=shane/manual-check
>
> Shane Wang (1):
>    distro_tracking_fields: manual checks for some recipes
>
>   .../conf/distro/include/distro_tracking_fields.inc |   83 ++++++++++----------
>   1 files changed, 43 insertions(+), 40 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


