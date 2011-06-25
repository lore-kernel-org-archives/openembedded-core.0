Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QaYZV-0006Xr-HP
	for openembedded-core@lists.openembedded.org;
	Sat, 25 Jun 2011 21:31:13 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 25 Jun 2011 12:27:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,425,1304319600"; d="scan'208";a="20614311"
Received: from unknown (HELO [10.255.13.191]) ([10.255.13.191])
	by fmsmga002.fm.intel.com with ESMTP; 25 Jun 2011 12:27:33 -0700
Message-ID: <4E0636A5.7000707@linux.intel.com>
Date: Sat, 25 Jun 2011 12:27:33 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1308723458.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1308723458.git.xiaofeng.yan@windriver.com>
Subject: Re: [PATCH 0/1] meta-qt3: Resolve the compilation error when	building an lsb image for qemuarm
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
X-List-Received-Date: Sat, 25 Jun 2011 19:31:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/23/2011 12:47 AM, Xiaofeng Yan wrote:
> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>
> A compilation error arose when compiling qt3 for qemuarm. I fix this problem. Please check patch for
> detailed information.
>
> Pull URL: git://git.pokylinux.org/meta-qt3.git
>    Branch: xiaofeng/meta-qt3
>    Browse: http://git.pokylinux.org/cgit.cgi/meta-qt3/log/?h=xiaofeng/meta-qt3
>
> Thanks,
>      Xiaofeng Yan<xiaofeng.yan@windriver.com>
> ---
>
>
> Xiaofeng Yan (1):
>    meta-qt3: Resolve the compilation error when building an lsb image
>      for qemuarm
>
>   recipes-qt3/qt3/qt-x11-free-native_3.3.5.bb |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

Merged into the meta-qt3 Master

Thanks

	Sau!


