Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SoHcC-0006TX-Rb
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 19:19:18 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jul 2012 10:08:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="190328798"
Received: from unknown (HELO [10.255.12.214]) ([10.255.12.214])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jul 2012 10:08:06 -0700
Message-ID: <4FFB0FF6.2040907@linux.intel.com>
Date: Mon, 09 Jul 2012 10:08:06 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1341462182.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1341462182.git.liezhi.yang@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 0/1] sanity.bbclass: the tmpdir can't be longer than 410
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
X-List-Received-Date: Mon, 09 Jul 2012 17:19:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/05/2012 01:57 AM, Robert Yang wrote:
> The following changes since commit 0b79c730f3e5c3c5329e439dffd137f2605b6cba:
>
>    prexport.bbclass: Fix typo in warning: "AUROPR" -> "AUTOPR". (2012-07-04 15:00:40 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib robert/tmpdir
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/tmpdir
>
> Robert Yang (1):
>    sanity.bbclass: the tmpdir can't be longer than 410
>
>   meta/classes/sanity.bbclass |    8 ++++++++
>   1 files changed, 8 insertions(+), 0 deletions(-)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>

Robert, great work digging into all the tail ends of getting this as 
large as you could!

Merged into OE-Core

Thanks
	Sau!


