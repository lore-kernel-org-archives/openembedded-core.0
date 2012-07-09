Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SoGxN-0003wm-Of
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 18:37:05 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 09 Jul 2012 09:25:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="120389522"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by AZSMGA002.ch.intel.com with ESMTP; 09 Jul 2012 09:25:55 -0700
Message-ID: <4FFB0610.2040907@linux.intel.com>
Date: Mon, 09 Jul 2012 09:25:52 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1341846614.git.mark.hatle@windriver.com>
In-Reply-To: <cover.1341846614.git.mark.hatle@windriver.com>
Subject: Re: [PATCH 0/1] Image/SDK multilib fixes [resend]
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
X-List-Received-Date: Mon, 09 Jul 2012 16:37:06 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/09/2012 08:11 AM, Mark Hatle wrote:
> This is a rebased/resend of the "multilib: Enable multilib remapping for
> SDK generation fix"
>
> There have been no changes other then a rebase or current origin/master.
>
> --Mark
>
> The following changes since commit 68ea7d827710ae7c5cf402887d4c12319038e064:
>
>    package_rpm: Avoid duplicate package generation failures (2012-07-09 11:37:29 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib mhatle/sdk
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/sdk
>
> Mark Hatle (1):
>    multilib: Enable multilib remapping for SDK generation
>
>   meta/classes/multilib.bbclass |    6 ++++++
>   1 files changed, 6 insertions(+), 0 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


