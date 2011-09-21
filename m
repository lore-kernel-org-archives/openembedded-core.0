Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R6VuI-00026h-Nz
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 01:08:46 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 21 Sep 2011 16:03:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,420,1312182000"; d="scan'208";a="57204428"
Received: from unknown (HELO [10.255.15.16]) ([10.255.15.16])
	by fmsmga001.fm.intel.com with ESMTP; 21 Sep 2011 16:03:26 -0700
Message-ID: <4E7A6D3E.3090700@linux.intel.com>
Date: Wed, 21 Sep 2011 16:03:26 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); en-US;
	rv:1.9.2.22) Gecko/20110902 Thunderbird/3.1.14
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1316441889.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1316441889.git.paul.eggleton@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 0/1] Fix for combo-layer default hook script
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
X-List-Received-Date: Wed, 21 Sep 2011 23:08:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/19/2011 07:20 AM, Paul Eggleton wrote:
> Otavio Salvador reported another issue with the hook script which I have
> fixed; the circumstances are briefly described in the patch.
>
> The following changes since commit 81274f4488fbc4d68d150870735ec0181b60b451:
>
>    freetype: disable bzip2 compressed font support (2011-09-19 13:14:03 +0100)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib paule/combo-layer-hook-fix-2
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/combo-layer-hook-fix-2
>
> Paul Eggleton (1):
>    scripts/combo-layer: fix still overzealous regex in default hook
>      script
>
>   scripts/combo-layer-hook-default.sh |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


