Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SRQlF-0002Nl-F7
	for openembedded-core@lists.openembedded.org;
	Mon, 07 May 2012 18:26:09 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 07 May 2012 09:16:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="137850725"
Received: from unknown (HELO [10.255.12.143]) ([10.255.12.143])
	by orsmga001.jf.intel.com with ESMTP; 07 May 2012 09:16:18 -0700
Message-ID: <4FA7F551.4000108@linux.intel.com>
Date: Mon, 07 May 2012 09:16:17 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120424 Thunderbird/12.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1335931960.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1335931960.git.dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>, scott.a.garman@intel.com
Subject: Re: [PATCH 0/1][1.2.1] initrdscripts: Update install.sh to work with mmc devices
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
X-List-Received-Date: Mon, 07 May 2012 16:26:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/01/2012 09:14 PM, Darren Hart wrote:
> The following changes since commit 35b5fb2dd2131d4c7dc6635c14c6e08ea6926457:
>
>    eglibc-package: remove /var (2012-05-01 12:36:18 +0100)
>
> are available in the git repository at:
>    git://git.yoctoproject.org/user-contrib/dvhart/oe-core installer
>    http://git.yoctoproject.org/cgit.cgi/user-contrib/dvhart/oe-core/log/?h=installer
>
> Darren Hart (1):
>    [1.2.1] initrdscripts: Update install.sh to work with mmc devices
>
>   .../initrdscripts/files/init-install.sh            |   45 ++++++++++---------
>   .../initrdscripts/initramfs-live-install_1.0.bb    |    2 +-
>   2 files changed, 25 insertions(+), 22 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


