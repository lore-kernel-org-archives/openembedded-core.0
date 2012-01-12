Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RlTdC-0007VJ-BB
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jan 2012 00:00:35 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 11 Jan 2012 22:39:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="95017804"
Received: from unknown (HELO [10.255.13.168]) ([10.255.13.168])
	by azsmga001.ch.intel.com with ESMTP; 11 Jan 2012 22:39:37 -0800
Message-ID: <4F0E8029.7040307@linux.intel.com>
Date: Wed, 11 Jan 2012 22:39:37 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1326148886.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1326148886.git.andrea.adami@gmail.com>
Subject: Re: [PATCH 0/2 v3] kexec-tools packaging
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
X-List-Received-Date: Thu, 12 Jan 2012 23:00:35 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/09/2012 02:46 PM, Andrea Adami wrote:
> * This patchset proposes to package separately
> * kexec and kdump.
> * Referring to oe-core, task-core-tools has been adapted.
>
> Andrea Adami (2):
>    kexec-tools: split packaging of kexec and kdump
>    task-core-tools: adapt to kexec-tools package split
>
>   meta/recipes-core/tasks/task-core-tools.bb     |    4 ++--
>   meta/recipes-kernel/kexec/kexec-tools_2.0.2.bb |    7 ++++++-
>   2 files changed, 8 insertions(+), 3 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


