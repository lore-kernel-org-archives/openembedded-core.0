Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T3VO8-0000UN-C9
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Aug 2012 19:03:40 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 20 Aug 2012 09:50:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,797,1336374000"; d="scan'208";a="183213460"
Received: from unknown (HELO [10.255.13.49]) ([10.255.13.49])
	by azsmga001.ch.intel.com with ESMTP; 20 Aug 2012 09:50:31 -0700
Message-ID: <50326AD7.6050705@linux.intel.com>
Date: Mon, 20 Aug 2012 09:50:31 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1345238651.git.mark.hatle@windriver.com>
In-Reply-To: <cover.1345238651.git.mark.hatle@windriver.com>
Subject: Re: [PATCH 0/1] Fix pseudo-native build when NO32LIBS = 0 is set
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
X-List-Received-Date: Mon, 20 Aug 2012 17:03:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/17/2012 02:24 PM, Mark Hatle wrote:
> The following changes since commit bb74035190c7794fcebaa7f6ba247672a4c34cde:
>
>    libsamplerate: depends on libsdnfile (2012-08-17 18:04:12 +0100)
>
> are available in the git repository at:
>    git://git.yoctoproject.org/poky-contrib mhatle/pseudo
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mhatle/pseudo
>
> Mark Hatle (1):
>    pseudo: Fix pseudo-native rebuild when triggered by dep change
>
>   meta/recipes-devtools/pseudo/pseudo.inc |    6 ++++++
>   1 files changed, 6 insertions(+), 0 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!



