Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RzvEl-0003Ax-UA
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Feb 2012 20:18:56 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 21 Feb 2012 11:10:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="110491846"
Received: from unknown (HELO [10.255.15.72]) ([10.255.15.72])
	by orsmga001.jf.intel.com with ESMTP; 21 Feb 2012 11:10:34 -0800
Message-ID: <4F43EC2A.5010808@linux.intel.com>
Date: Tue, 21 Feb 2012 11:10:34 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0) Gecko/20120131 Thunderbird/10.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1328859334.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1328859334.git.lianhao.lu@intel.com>
Subject: Re: [PATCH 0/1] Fixing guile cross configure failure
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
X-List-Received-Date: Tue, 21 Feb 2012 19:18:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/09/2012 11:37 PM, Lianhao Lu wrote:
> This patch fixed the cross configure failure of guile, as for yocto bug #1978.
>
> The following changes since commit 4ef5e70f531f48cef90805402c16ec02ad3f2b92:
>    Christopher Larson (1):
>          tcmode-default: add preference for gdb/gdbserver
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib llu/bug1978
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/bug1978
>
> Lianhao Lu (1):
>    guile: fix cross configure failure
>
>   meta/recipes-devtools/guile/guile_2.0.3.bb |    4 +++-
>   1 files changed, 3 insertions(+), 1 deletions(-)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

Merged into OE-core

Thanks
	Sau!


