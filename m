Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QJLNT-0005uQ-PK
	for openembedded-core@lists.openembedded.org;
	Mon, 09 May 2011 09:59:39 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 May 2011 00:56:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,339,1301900400"; d="scan'208";a="744327694"
Received: from shxpwgzhai1a.ccr.corp.intel.com (HELO [10.239.48.130])
	([10.239.48.130])
	by orsmga001.jf.intel.com with ESMTP; 09 May 2011 00:56:54 -0700
Message-ID: <4DC79E45.3020601@intel.com>
Date: Mon, 09 May 2011 15:56:53 +0800
From: "Zhai, Edwin" <edwin.zhai@intel.com>
User-Agent: Thunderbird 2.0.0.17 (Windows/20080914)
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1304670670.git.edwin.zhai@intel.com>
	<4DC49C10.4060507@linux.intel.com>
In-Reply-To: <4DC49C10.4060507@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] qemu-script: Fix qemu segfault with Nvidia's proprietary driver
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
X-List-Received-Date: Mon, 09 May 2011 07:59:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



Saul Wold wrote:
>
> On 05/06/2011 01:36 AM, Zhai Edwin wrote:
> >
> >
> > Pull URL: git://git.pokylinux.org/poky-contrib.git
> >    Branch: gzhai/fix3
> >    Browse: 
> http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/fix3
> >
> > Zhai Edwin (1):
> >    qemu-script: Fix qemu seg fault if install Nvidia proprietary 
> driver.
> >
> >   scripts/poky-qemu-internal |   13 +++++++++++--
>
> I think that you are using the old script name, I think that you should
> be changing runqemu-internal, not poky-qemu-internal
>

Done. Pls. pull @ the same branch
Thanks,
edwin

> Please correct this.
>
> Sau!
>
> >   1 files changed, 11 insertions(+), 2 deletions(-)
> >
> >
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


