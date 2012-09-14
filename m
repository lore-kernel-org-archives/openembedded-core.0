Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TCYQZ-0006If-TG
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Sep 2012 18:07:36 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 14 Sep 2012 08:55:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,423,1344236400"; d="scan'208";a="192814538"
Received: from unknown (HELO [10.255.13.94]) ([10.255.13.94])
	by azsmga001.ch.intel.com with ESMTP; 14 Sep 2012 08:54:59 -0700
Message-ID: <50535353.1030203@linux.intel.com>
Date: Fri, 14 Sep 2012 08:54:59 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <cover.1347553357.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1347553357.git.paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] Couple of fixes for combo-layer
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
X-List-Received-Date: Fri, 14 Sep 2012 16:07:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/13/2012 09:23 AM, Paul Eggleton wrote:
> The following changes since commit 835654994574c158d6324218ebe000bd2ef9a792:
>
>    rt: Add hwlatdetect to rt images (2012-09-12 15:11:12 +0100)
>
> are available in the git repository at:
>
>    git://git.openembedded.org/openembedded-core-contrib paule/combo-layer-fixes8
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/combo-layer-fixes8
>
> Paul Eggleton (2):
>    scripts/combo-layer: use last_revision if specified in init
>    scripts/combo-layer: ensure we validate branch/revision on init
>
>   scripts/combo-layer |   31 ++++++++++++++++++++-----------
>   1 file changed, 20 insertions(+), 11 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!



