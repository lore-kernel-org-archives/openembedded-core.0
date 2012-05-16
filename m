Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SUivq-0007l9-9F
	for openembedded-core@lists.openembedded.org;
	Wed, 16 May 2012 20:26:42 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 16 May 2012 11:16:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="144793330"
Received: from unknown (HELO [10.255.13.103]) ([10.255.13.103])
	by orsmga002.jf.intel.com with ESMTP; 16 May 2012 11:16:15 -0700
Message-ID: <4FB3EEEE.50800@linux.intel.com>
Date: Wed, 16 May 2012 21:16:14 +0300
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1337013858.git.chris_larson@mentor.com>
In-Reply-To: <cover.1337013858.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 0/3] Minor tcmode-external-csl fixes
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
X-List-Received-Date: Wed, 16 May 2012 18:26:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/14/2012 07:45 PM, Christopher Larson wrote:
> From: Christopher Larson<chris_larson@mentor.com>
>
> The following changes since commit 36d1717e2ad4ca1620ee9f01b524b5ff2f499b26:
>
>    classes/rootfs_*: fix splitting package dependency strings (2012-05-13 20:07:24 +0100)
>
> are available in the git repository at:
>    https://github.com/kergoth/oe-core external-csl-minor-fixes
>
> Christopher Larson (3):
>        tcmode-external-csl: drop unnecessary cppflags/ldflags
>        tcmode-external-csl: avoid hardcoding a list of ia32 archs
>        tcmode-external-csl: handle TUNE_PKGARCH=core2
>
>   meta/conf/distro/include/tcmode-external-csl.inc |   10 +++++-----
>   1 files changed, 5 insertions(+), 5 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


