Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1ROYTO-0000A7-HA
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 18:31:34 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 10 Nov 2011 09:25:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,489,1315206000"; d="scan'208";a="35482714"
Received: from unknown (HELO [10.255.15.157]) ([10.255.15.157])
	by AZSMGA002.ch.intel.com with ESMTP; 10 Nov 2011 09:25:16 -0800
Message-ID: <4EBC08FC.4040707@linux.intel.com>
Date: Thu, 10 Nov 2011 09:25:16 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1320779076.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1320779076.git.dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>, tom_rini@mentor.com
Subject: Re: [PATCH 0/1] ncurses: refactor configure to avoid configuring widec when disabled
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
X-List-Received-Date: Thu, 10 Nov 2011 17:31:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/08/2011 11:08 AM, Darren Hart wrote:
> The following changes since commit e5226b1e44052b2fe5370f4922397a1d68985aaf:
>
>    clutter-1.8: add bbappend for new clutter-1.8 recipe (2011-11-08 17:53:18 +0000)
>
> are available in the git repository at:
>    git://git.pokylinux.org/poky-contrib dvhart/tiny
>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dvhart/tiny
>
> Darren Hart (1):
>    ncurses: refactor configure to avoid configuring widec when disabled
>
>   meta/recipes-core/ncurses/ncurses.inc |   64 +++++++++++++++++---------------
>   1 files changed, 34 insertions(+), 30 deletions(-)
>

Merged into OE-Core

Thanks
	Sau!


