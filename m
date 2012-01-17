Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RnEPN-0001jP-IT
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Jan 2012 20:09:25 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 17 Jan 2012 11:01:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="97521479"
Received: from unknown (HELO [10.255.14.6]) ([10.255.14.6])
	by orsmga001.jf.intel.com with ESMTP; 17 Jan 2012 11:01:29 -0800
Message-ID: <4F15C589.9070600@linux.intel.com>
Date: Tue, 17 Jan 2012 11:01:29 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111115 Thunderbird/8.0
MIME-Version: 1.0
To: Darren Hart <dvhart@linux.intel.com>
References: <cover.1326326259.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1326326259.git.dvhart@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] bootimg: Account for FAT filesystem overhead in image size
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
X-List-Received-Date: Tue, 17 Jan 2012 19:09:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/11/2012 03:58 PM, Darren Hart wrote:
> The following changes since commit 18c88fcec85f96d2495457928be913807971aea7:
>
>    package.bbclass: per recipe PRSERV_HOST support (2012-01-11 10:37:43 +0000)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib dvhart/bug/1852
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dvhart/bug/1852
>
> Darren Hart (1):
>    bootimg: Account for FAT filesystem overhead in image size
>
>   meta/classes/bootimg.bbclass |   45 +++++++++++++++++++++++++++++++++--------
>   1 files changed, 36 insertions(+), 9 deletions(-)
>
Merged into OE-Core

Thanks
	Sau!


