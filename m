Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S7UlT-0003nK-1n
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 17:39:59 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 13 Mar 2012 09:31:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="77008554"
Received: from unknown (HELO [10.255.15.137]) ([10.255.15.137])
	by AZSMGA002.ch.intel.com with ESMTP; 13 Mar 2012 09:31:12 -0700
Message-ID: <4F5F7650.7030500@linux.intel.com>
Date: Tue, 13 Mar 2012 09:31:12 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1331569628.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1331569628.git.nitin.a.kamble@intel.com>
Subject: Re: [PATCH 0/1] a bugfix for cmake.bblcass
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
X-List-Received-Date: Tue, 13 Mar 2012 16:39:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/12/2012 09:28 AM, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble<nitin.a.kamble@intel.com>
>
> The following changes since commit c27b7aab3c37f182bf9acc5d459185f32fb195d0:
>
>    codeparser: Call intern over the set contents for better cache performance (2012-03-12 15:52:33 +0000)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib nitin/work
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/work
>
> Nitin A Kamble (1):
>    cmake.bbclass: add ${base_libdir} to CMAKE_LIBRARY_PATH
>
>   meta/classes/cmake.bbclass |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


