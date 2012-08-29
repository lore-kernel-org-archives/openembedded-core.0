Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T6qpe-0005kS-Ve
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Aug 2012 00:33:55 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 29 Aug 2012 15:21:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,335,1344236400"; d="scan'208";a="139467243"
Received: from unknown (HELO [10.255.13.94]) ([10.255.13.94])
	by AZSMGA002.ch.intel.com with ESMTP; 29 Aug 2012 15:21:30 -0700
Message-ID: <503E95E9.30204@linux.intel.com>
Date: Wed, 29 Aug 2012 15:21:29 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: tom.zanussi@intel.com
References: <cover.1345867875.git.tom.zanussi@intel.com>
In-Reply-To: <cover.1345867875.git.tom.zanussi@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] add ia32-base.inc
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
X-List-Received-Date: Wed, 29 Aug 2012 22:33:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/24/2012 09:32 PM, tom.zanussi@intel.com wrote:
> From: Tom Zanussi <tom.zanussi@intel.com>
>
> This adds ia32-base to meta/conf/machine/include.  See the following
> link for details:
>
>    https://bugzilla.yoctoproject.org/show_bug.cgi?id=2996
>
> The following changes since commit 86a6410fcbfb43e74aa1c9c995a21129d8434f75:
>
>    build-appliance-image: Add vmx* files and build zip file (2012-08-24 17:32:57 +0100)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib.git tzanussi/ia32-base-again.v1
>    http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/ia32-base-again.v1
>
> Tom Zanussi (1):
>    ia32-base.inc: new include file
>
>   meta/conf/machine/include/ia32-base.inc | 58 +++++++++++++++++++++++++++++++++
>   1 file changed, 58 insertions(+)
>   create mode 100644 meta/conf/machine/include/ia32-base.inc
>

Merged into OE-Core

Thanks
	Sau!



