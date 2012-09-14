Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TCY4G-0005O3-84
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Sep 2012 17:44:32 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 14 Sep 2012 08:31:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,423,1344236400"; d="scan'208";a="145111028"
Received: from unknown (HELO [10.255.13.94]) ([10.255.13.94])
	by AZSMGA002.ch.intel.com with ESMTP; 14 Sep 2012 08:31:56 -0700
Message-ID: <50534DEB.5030500@linux.intel.com>
Date: Fri, 14 Sep 2012 08:31:55 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Andrei Gherzan <andrei@gherzan.ro>
References: <cover.1347574891.git.andrei@gherzan.ro>
In-Reply-To: <cover.1347574891.git.andrei@gherzan.ro>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] Update to taglib v1.8
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
X-List-Received-Date: Fri, 14 Sep 2012 15:44:32 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/13/2012 03:22 PM, Andrei Gherzan wrote:
> The following changes since commit 7401ed019196313a7ae7cab0b9f3820356cfee29:
>
>    Update to upstream_tracking.inc (2012-09-12 17:56:58 +0100)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/poky-contrib ag/taglib
>    http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ag/taglib
>
> Andrei Gherzan (1):
>    taglib: Update to v1.8
>
>   .../taglib/taglib-1.6.3/configuretweak.patch       |   73 -
>   .../taglib/taglib-1.6.3/nolibtool.patch            | 5916 --------------------
>   .../taglib/{taglib_1.6.3.bb => taglib_1.8.bb}      |   17 +-
>   3 files changed, 8 insertions(+), 5998 deletions(-)
>   delete mode 100644 meta/recipes-support/taglib/taglib-1.6.3/configuretweak.patch
>   delete mode 100644 meta/recipes-support/taglib/taglib-1.6.3/nolibtool.patch
>   rename meta/recipes-support/taglib/{taglib_1.6.3.bb => taglib_1.8.bb} (56%)
>
Merged into OE-Core

Thanks
	Sau!



