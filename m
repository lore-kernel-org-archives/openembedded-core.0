Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Smq1o-0003Ma-OY
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jul 2012 19:39:45 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 05 Jul 2012 10:28:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="188834662"
Received: from unknown (HELO [10.255.12.176]) ([10.255.12.176])
	by fmsmga002.fm.intel.com with ESMTP; 05 Jul 2012 10:28:30 -0700
Message-ID: <4FF5CEBE.80500@linux.intel.com>
Date: Thu, 05 Jul 2012 10:28:30 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120605 Thunderbird/13.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1341391695.git.liezhi.yang@windriver.com>
In-Reply-To: <cover.1341391695.git.liezhi.yang@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 0/1] dpkg 1.15.8.7: bad interpreter when long tmpdir
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
X-List-Received-Date: Thu, 05 Jul 2012 17:39:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/04/2012 03:15 AM, Robert Yang wrote:
> The following changes since commit a6b6df1350149c116050cb93c3c7b4802c709d31:
>
>    task-core-tools-debug: Added openssh-sftp-server. (2012-07-03 14:52:38 +0100)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib robert/dpkg
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/dpkg
>
> Robert Yang (1):
>    dpkg 1.15.8.7: bad interpreter when long tmpdir
>
>   meta/recipes-devtools/dpkg/dpkg.inc |   11 ++++++++++-
>   1 files changed, 10 insertions(+), 1 deletions(-)
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


