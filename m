Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RiBmE-0005Nh-Fq
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jan 2012 22:20:10 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 03 Jan 2012 13:12:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="94092476"
Received: from unknown (HELO [10.255.13.127]) ([10.255.13.127])
	by orsmga002.jf.intel.com with ESMTP; 03 Jan 2012 13:12:48 -0800
Message-ID: <4F036F50.4060803@linux.intel.com>
Date: Tue, 03 Jan 2012 13:12:48 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1324574345.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1324574345.git.paul.eggleton@linux.intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 0/1] Fix buildhistory issue with recommends and RPM
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
X-List-Received-Date: Tue, 03 Jan 2012 21:20:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/22/2011 09:20 AM, Paul Eggleton wrote:
> The following changes since commit db446421933d640528328e46a29f828a36d6649b:
>
>    multilib.conf: Enable shadow-sysroot and libffi (2011-12-21 17:24:37 +0000)
>
> are available in the git repository at:
>    git://git.openembedded.org/openembedded-core-contrib paule/rpm-suggests
>    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/rpm-suggests
>
> Paul Eggleton (1):
>    classes/rootfs_rpm: handle recommends in query functions
>
>   meta/classes/rootfs_rpm.bbclass |    6 ++++--
>   1 files changed, 4 insertions(+), 2 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


