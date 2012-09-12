Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TBqMw-0002he-7W
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 19:04:54 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 12 Sep 2012 09:52:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,410,1344236400"; d="scan'208";a="202322875"
Received: from unknown (HELO [10.255.13.93]) ([10.255.13.93])
	by orsmga002.jf.intel.com with ESMTP; 12 Sep 2012 09:52:18 -0700
Message-ID: <5050BDC2.3000104@linux.intel.com>
Date: Wed, 12 Sep 2012 09:52:18 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: jackie.huang@windriver.com
References: <cover.1347355729.git.jackie.huang@windriver.com>
In-Reply-To: <cover.1347355729.git.jackie.huang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] libgnome-keyring: add missing DEPENDS on intltool-native
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
X-List-Received-Date: Wed, 12 Sep 2012 17:04:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/11/2012 08:13 AM, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>
>
> The following changes since commit 48169c6bc44c546cecaa06207b6c36da558b81f7:
>
>    classes/packageinfo: use better method to check if package exists (2012-09-10 21:52:37 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib jhuang0/bug3081_libgnome-kering_0911
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/bug3081_libgnome-kering_0911
>
> Jackie Huang (1):
>    libgnome-keyring: add missing DEPENDS on intltool-native
>
>   .../recipes-gnome/gnome/libgnome-keyring_2.32.0.bb |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>
Merged into OE-Core

Thanks
	Sau!



