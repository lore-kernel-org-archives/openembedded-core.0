Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S0maH-0003dp-CY
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 05:16:41 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 23 Feb 2012 20:08:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="111422993"
Received: from unknown (HELO [10.255.15.58]) ([10.255.15.58])
	by orsmga001.jf.intel.com with ESMTP; 23 Feb 2012 20:06:55 -0800
Message-ID: <4F470CDE.9030904@linux.intel.com>
Date: Thu, 23 Feb 2012 20:06:54 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1329500798.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1329500798.git.otavio@ossystems.com.br>
Subject: Re: [PATCH 0/3] Pending O.S. Systems' tree patches
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
X-List-Received-Date: Fri, 24 Feb 2012 04:16:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/17/2012 09:47 AM, Otavio Salvador wrote:
> The following changes since commit e5ad03093dfc4364d1407183f458df79f347c7a1:
>
>    guile: fix cross configure failure (2012-02-10 13:38:16 +0000)
>
> are available in the git repository at:
>    git://github.com/OSSystems/oe-core master
>    https://github.com/OSSystems/oe-core/tree/HEAD
>
> Otavio Salvador (3):
>    update-rc.d.bbclass: do nothing for extended cross packages
>    rootfs_ipk.bbclass: fix status file location in rootfs
Merged these first 2 into OE-core

>    rootfs_ipk.bbclass: fix unpacked postinst support if no package
>      management
>
Not sure where this one stand with your discussion with Phil

Thanks
	Sau!


>   meta/classes/rootfs_ipk.bbclass  |   21 ++++++++++++++++++---
>   meta/classes/update-rc.d.bbclass |    1 +
>   2 files changed, 19 insertions(+), 3 deletions(-)
>


