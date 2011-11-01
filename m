Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RLCzu-0001gz-0F
	for openembedded-core@lists.openembedded.org;
	Tue, 01 Nov 2011 12:59:18 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 01 Nov 2011 04:53:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="69966909"
Received: from unknown (HELO helios.localnet) ([10.252.121.93])
	by orsmga001.jf.intel.com with ESMTP; 01 Nov 2011 04:53:10 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 01 Nov 2011 11:53:09 +0000
Message-ID: <2908890.eKOgJmF2nS@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.2 (Linux/3.0.0-12-generic-pae; KDE/4.7.2; i686; ; )
In-Reply-To: <cover.1319382376.git.paul.eggleton@linux.intel.com>
References: <cover.1319382376.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH 0/3] Misc metadata fixes
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
X-List-Received-Date: Tue, 01 Nov 2011 11:59:18 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sunday 23 October 2011 16:07:14 Paul Eggleton wrote:
> The following changes since commit 99da9a4e65f9dffb04efc3ad60125194c476d6b3:
> 
>   distro-tracking-fields: update fields for tzdata and gst-plugins-good
> (2011-10-20 13:07:16 +0100)
> 
> are available in the git repository at:
>   git://git.openembedded.org/openembedded-core-contrib paule/fixes7
>  
> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paul
> e/fixes7
> 
> Paul Eggleton (3):
>   dbus: remove unused initscript
>   util-linux: split out mkfs into its own package
>   e2fsprogs: move mke2fs.conf to e2fsprogs-mke2fs package
> 
>  meta/recipes-core/dbus/dbus.inc                    |    3 +++
>  meta/recipes-core/dbus/dbus_1.4.12.bb              |    3 +++
>  meta/recipes-core/util-linux/util-linux.inc        |    6 ++++--
>  meta/recipes-core/util-linux/util-linux_2.19.1.bb  |    2 +-
>  .../e2fsprogs/e2fsprogs_1.41.14.bb                 |    4 ++--
>  5 files changed, 13 insertions(+), 5 deletions(-)

Ping...?

-- 

Paul Eggleton
Intel Open Source Technology Centre


