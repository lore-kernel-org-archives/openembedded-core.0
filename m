Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SAmEx-0005MQ-3A
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 18:55:59 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 22 Mar 2012 10:47:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="80508611"
Received: from unknown (HELO [10.255.12.49]) ([10.255.12.49])
	by AZSMGA002.ch.intel.com with ESMTP; 22 Mar 2012 10:47:02 -0700
Message-ID: <4F6B6596.5080204@linux.intel.com>
Date: Thu, 22 Mar 2012 10:47:02 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1332397079.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1332397079.git.lianhao.lu@intel.com>
Subject: Re: [PATCH 0/1] tcf-agent using git instead of svn
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
X-List-Received-Date: Thu, 22 Mar 2012 17:55:59 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/21/2012 11:22 PM, Lianhao Lu wrote:
> tcf-agent upstream has changed to using git repository instead of svn.
>
> The following changes since commit d036265de1d9931bedb660e01a763d3d1d9e4097:
>    Saul Wold (1):
>          xserver-kdrive: Fix packaging warnings
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib llu/tcf-agent
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/tcf-agent
>
> Lianhao Lu (1):
>    tcf-agent: Using git repository instead of svn.
>
>   .../{tcf-agent_svn.bb =>  tcf-agent_git.bb}         |   12 ++++++------
>   1 files changed, 6 insertions(+), 6 deletions(-)
>   rename meta/recipes-devtools/tcf-agent/{tcf-agent_svn.bb =>  tcf-agent_git.bb} (83%)
>

Merged into OE-Core

Thanks
	Sau!

>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


