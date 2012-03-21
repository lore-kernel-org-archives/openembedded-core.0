Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SAQm1-0007Lb-08
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 20:00:41 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 21 Mar 2012 11:51:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="131630310"
Received: from unknown (HELO [10.255.12.49]) ([10.255.12.49])
	by fmsmga001.fm.intel.com with ESMTP; 21 Mar 2012 11:51:25 -0700
Message-ID: <4F6A232D.3060002@linux.intel.com>
Date: Wed, 21 Mar 2012 11:51:25 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Dexuan Cui <dexuan.cui@intel.com>
References: <cover.1332127031.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1332127031.git.dexuan.cui@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] task-self-hosted: add nfs-utils and nfs-utils-client into the target
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
X-List-Received-Date: Wed, 21 Mar 2012 19:00:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/18/2012 08:28 PM, Dexuan Cui wrote:
> The following changes since commit 0882b5e0adb05d4f950c721fcb80b4cff42ce079:
>
>    self-hosted-image: pre-populate the builder user with poky source (2012-03-19 09:31:19 +0800)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib dcui/self
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/self
>
> Dexuan Cui (1):
>    task-self-hosted: add nfs-utils and nfs-utils-client into the target
>
>   meta/recipes-core/tasks/task-self-hosted.bb |    4 +++-
>   1 files changed, 3 insertions(+), 1 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


