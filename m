Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QMOzP-0002q6-G1
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 20:27:27 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 17 May 2011 11:24:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,226,1304319600"; 
   d="scan'208";a="2918623"
Received: from unknown (HELO [10.255.12.160]) ([10.255.12.160])
	by fmsmga002.fm.intel.com with ESMTP; 17 May 2011 11:24:32 -0700
Message-ID: <4DD2BD60.1080103@linux.intel.com>
Date: Tue, 17 May 2011 11:24:32 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1305575014.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1305575014.git.bruce.ashfield@windriver.com>
Subject: Re: [PATCH/PULL 0/1] linux-yocto: update meta SRCREV
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
X-List-Received-Date: Tue, 17 May 2011 18:27:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/16/2011 12:48 PM, Bruce Ashfield wrote:
> Richard/Saul,
>
> Just a quick update of the linux-yocto SRCREV to pickup a
> couple of x86 BSP changes that have been done recently, and
> will be used in some upcoming development work.
>
> cc: Tom Zanussi<tom.zanussi@intel.com>
>
> Pull URL: git://git.pokylinux.org/poky-contrib.git
>    Branch: zedd/emgd
>    Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/emgd
>
> Thanks,
>      Bruce Ashfield<bruce.ashfield@windriver.com>
> ---
>
>
> Bruce Ashfield (1):
>    linux-yocto: update meta SRCREV
>
>   meta/recipes-kernel/linux/linux-yocto_git.bb |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
Merged into oe-core & poky

Thanks
	Sau!



