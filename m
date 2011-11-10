Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1ROYTi-0000Bx-Lj
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 18:31:54 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 10 Nov 2011 09:25:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,489,1315206000"; d="scan'208";a="35482790"
Received: from unknown (HELO [10.255.15.157]) ([10.255.15.157])
	by AZSMGA002.ch.intel.com with ESMTP; 10 Nov 2011 09:25:36 -0800
Message-ID: <4EBC0910.3040701@linux.intel.com>
Date: Thu, 10 Nov 2011 09:25:36 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1320851307.git.tom.zanussi@intel.com>
In-Reply-To: <cover.1320851307.git.tom.zanussi@intel.com>
Subject: Re: [PATCH 0/1] python: fix missing PR bump
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
X-List-Received-Date: Thu, 10 Nov 2011 17:31:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/09/2011 07:11 AM, tom.zanussi@intel.com wrote:
> From: Tom Zanussi<tom.zanussi@intel.com>
>
> Simple one-liner adding the missing PR bump for my previous python commit.
>
> Thanks to Koen Kooi for pointing it out...
>
> The following changes since commit 23d2eaf9d283cae47e52d1151f0d4ad53bbbe8a0:
>    Tom Zanussi (1):
>          python: skip setup.py 'import check' when cross-compiling
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib.git tzanussi/python-pr-bump
>    http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/python-pr-bump
>
> Tom Zanussi (1):
>    python: bump PR
>
>   meta/recipes-devtools/python/python_2.7.2.bb |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

Merged into OE-Core

Thanks
	Sau!


