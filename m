Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TB69w-00008X-Lu
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Sep 2012 17:44:24 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 10 Sep 2012 08:31:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,398,1344236400"; d="scan'208";a="191191160"
Received: from unknown (HELO [10.255.13.123]) ([10.255.13.123])
	by orsmga001.jf.intel.com with ESMTP; 10 Sep 2012 08:31:53 -0700
Message-ID: <504E07E9.70001@linux.intel.com>
Date: Mon, 10 Sep 2012 08:31:53 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Robert Yang <liezhi.yang@windriver.com>
References: <cover.1346559111.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1346559111.git.liezhi.yang@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] bin_package.bbclass: binary package recipe class
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
X-List-Received-Date: Mon, 10 Sep 2012 15:44:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/01/2012 09:15 PM, Robert Yang wrote:
> The following changes since commit 9ba1e33e2d14362971d6441ee6142bcb0857df1a:
>
>    sstate: Ensure master.list exists if it doesn't already (2012-08-30 22:45:56 -0700)
>
> are available in the git repository at:
>
>    git://git.pokylinux.org/poky-contrib robert/binary_package
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/binary_package
>
> Robert Yang (1):
>    bin_package.bbclass: binary package recipe class
>
>   meta/classes/bin_package.bbclass | 36 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 36 insertions(+)
>   create mode 100644 meta/classes/bin_package.bbclass
>

Merged into OE-Core

Thanks
	Sau!



