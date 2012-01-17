Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RnFUl-0003mU-Pq
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 21:19:04 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 17 Jan 2012 12:11:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="57383033"
Received: from unknown (HELO [10.255.14.6]) ([10.255.14.6])
	by AZSMGA002.ch.intel.com with ESMTP; 17 Jan 2012 12:11:25 -0800
Message-ID: <4F15D5ED.5030305@linux.intel.com>
Date: Tue, 17 Jan 2012 12:11:25 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1326477036.git.mark.hatle@windriver.com>
In-Reply-To: <cover.1326477036.git.mark.hatle@windriver.com>
Subject: Re: [PATCH 0/1] Update cross prelinker
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
X-List-Received-Date: Tue, 17 Jan 2012 20:19:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/13/2012 09:52 AM, Mark Hatle wrote:
> Update the cross prelinker to fix a MIPS issue.
>
> The following changes since commit 9b446e954b55e7d42c39ff87a42564a48786b60e:
>
>    prelink: Update to latest version (2012-01-13 11:47:01 -0600)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib.git mhatle/prelink
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/prelink
>
> Mark Hatle (1):
>    prelink: Update to latest version
>
>   .../conf/distro/include/distro_tracking_fields.inc |    6 +++---
>   meta/recipes-devtools/prelink/prelink_git.bb       |    4 ++--
>   2 files changed, 5 insertions(+), 5 deletions(-)
>
Merged into OE-Core

Thanks
	Sau!


