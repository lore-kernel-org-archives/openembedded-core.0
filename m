Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TFBiq-0005H0-Mp
	for openembedded-core@lists.openembedded.org;
	Sat, 22 Sep 2012 00:29:20 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 21 Sep 2012 15:16:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,464,1344236400"; d="scan'208";a="196221646"
Received: from unknown (HELO [10.255.14.14]) ([10.255.14.14])
	by orsmga001.jf.intel.com with ESMTP; 21 Sep 2012 15:16:33 -0700
Message-ID: <505CE741.7000300@linux.intel.com>
Date: Fri, 21 Sep 2012 15:16:33 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <cover.1347993827.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1347993827.git.dvhart@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] mkefidisk.sh: Add script to do an EFI install on the host
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
X-List-Received-Date: Fri, 21 Sep 2012 22:29:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/18/2012 11:45 AM, Darren Hart wrote:
> The following changes since commit 7887b99646d8e1e736ad6e4a306e47df9955221e:
>
>    local.conf.sample: change valgrind support architecture comment (2012-09-14 17:05:59 +0100)
>
> are available in the git repository at:
>
>    git://git.yoctoproject.org/user-contrib/dvhart/oe-core dvhart/efidisk
>    http://git.yoctoproject.org/cgit.cgi/user-contrib/dvhart/oe-core/log/?h=dvhart/efidisk
>
> Darren Hart (1):
>    mkefidisk.sh: Add script to do an EFI install on the host
>
>   scripts/contrib/mkefidisk.sh | 255 +++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 255 insertions(+)
>   create mode 100755 scripts/contrib/mkefidisk.sh
>
Merged into OE-Core

Thanks
	Sau!



