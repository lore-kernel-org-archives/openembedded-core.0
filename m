Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXxlJ-0004qy-Pk
	for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 18:53:14 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 25 May 2012 09:42:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="171344446"
Received: from unknown (HELO [10.255.12.24]) ([10.255.12.24])
	by fmsmga002.fm.intel.com with ESMTP; 25 May 2012 09:41:49 -0700
Message-ID: <4FBFB64D.2010305@linux.intel.com>
Date: Fri, 25 May 2012 09:41:49 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1337874862.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1337874862.git.liezhi.yang@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 0/1] oe/process.py: remove it since it is unused and duplicated
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
X-List-Received-Date: Fri, 25 May 2012 16:53:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/24/2012 08:55 AM, Robert Yang wrote:
> The following changes since commit 6558abda67956e4fab1304b0cdf03c65f18fabd5:
>
>    qemu: disable vnc-jpeg compression (2012-05-24 08:53:57 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib robert/process
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/process
>
> Robert Yang (1):
>    oe/process.py: remove it since it is unused and duplicated
>
>   meta/lib/oe/process.py |   74 ------------------------------------------------
>   1 files changed, 0 insertions(+), 74 deletions(-)
>   delete mode 100644 meta/lib/oe/process.py
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>

Merged into OE-Core

Thanks
	Sau!


