Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TFBiW-0005EY-VS
	for openembedded-core@lists.openembedded.org;
	Sat, 22 Sep 2012 00:29:01 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 21 Sep 2012 15:16:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,464,1344236400"; d="scan'208";a="196221464"
Received: from unknown (HELO [10.255.14.14]) ([10.255.14.14])
	by orsmga001.jf.intel.com with ESMTP; 21 Sep 2012 15:16:13 -0700
Message-ID: <505CE72D.2040502@linux.intel.com>
Date: Fri, 21 Sep 2012 15:16:13 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Robert Yang <liezhi.yang@windriver.com>
References: <cover.1347950270.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1347950270.git.liezhi.yang@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] rpm 5.4.9: DEPENDS on bison-native
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
X-List-Received-Date: Fri, 21 Sep 2012 22:29:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/18/2012 03:18 AM, Robert Yang wrote:
> The following changes since commit 913944d904266bf90af0cad94b4f0fb3652bd29d:
>
>    upstream_tracking: update lsb and ltp (2012-09-14 17:12:52 +0100)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib robert/rpmdepend
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/rpmdepend
>
> Robert Yang (1):
>    rpm 5.4.9: DEPENDS on bison-native
>
>   meta/recipes-devtools/rpm/rpm_5.4.9.bb | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
Merged into OE-Core

Thanks
	Sau!



