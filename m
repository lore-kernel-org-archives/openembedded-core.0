Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1THGYb-0001bm-Cy
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 18:03:21 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 27 Sep 2012 08:50:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,496,1344236400"; d="scan'208";a="227330990"
Received: from unknown (HELO [10.255.13.173]) ([10.255.13.173])
	by fmsmga001.fm.intel.com with ESMTP; 27 Sep 2012 08:50:27 -0700
Message-ID: <506475C2.3040902@linux.intel.com>
Date: Thu, 27 Sep 2012 08:50:26 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
References: <cover.1348612198.git.elizabeth.flanagan@intel.com>
In-Reply-To: <cover.1348612198.git.elizabeth.flanagan@intel.com>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] Correcting LICENSE for ossp-uuid
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
X-List-Received-Date: Thu, 27 Sep 2012 16:03:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/25/2012 03:31 PM, Elizabeth Flanagan wrote:
> LICENSE information for ossp-uuid was tossing a warning. this fixes license
> as well as provides a more detailed LIC_FILES_CHKSUM.
>
> The following changes since commit a8edf79fce381d0433f18bd38df6cd74008e5179:
>
>    bitbake: fetch2/git: Don't use deprecated API (2012-09-25 15:55:57 +0100)
>
> are available in the git repository at:
>    git://git.yoctoproject.org/poky-contrib eflanagan/ossp-uuid-native
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=eflanagan/ossp-uuid-native
>
> Elizabeth Flanagan (1):
>    ossp-uuid: LICENSE type corrections.
>
>   meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb |    7 ++++---
>   1 files changed, 4 insertions(+), 3 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!



