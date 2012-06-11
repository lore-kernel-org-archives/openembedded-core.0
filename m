Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Se6ct-0003nX-Lo
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jun 2012 17:33:55 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 11 Jun 2012 08:23:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="156200199"
Received: from unknown (HELO [10.255.12.133]) ([10.255.12.133])
	by orsmga002.jf.intel.com with ESMTP; 11 Jun 2012 08:23:21 -0700
Message-ID: <4FD60D68.4040809@linux.intel.com>
Date: Mon, 11 Jun 2012 08:23:20 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: 'Patches and discussions about the oe-core layer'
	<openembedded-core@lists.openembedded.org>
Subject: Missing Patch Headers
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
X-List-Received-Date: Mon, 11 Jun 2012 15:33:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit


Folks,

We recently had a spat of new patches added without patch headers, ie no 
patch comment, Signed-off-by or Upstream-Status.

Please review this list and update the patch and submit a new commit.

Zhai Edwin - 
meta/recipes-graphics/pango/pango-1.28.4/multilib-fix-clean.patch
Laurentiu Palcu - 
meta/recipes-graphics/directfb/directfb/libdirect-remove-include-of-linux-config.h.patch
Cristian Iorga - 
meta/recipes-extended/ltp/ltp/fix_building_fom_archive.patch
Xiaofeng Yan - meta/recipes-extended/lsb/lsbinitscripts/functions.patch
Mark Hatle - meta/recipes-devtools/binutils/binutils/binutils-armv5e.patch
Mark Hatle - meta/recipes-devtools/rpm/rpm/rpm-resolvedep.patch
Andreas Müller - 
meta/recipes-kernel/systemtap/systemtap/runtime-staprun-configure.ac-support-without-nss-for.patch
Bruce Ashfield - 
meta/recipes-kernel/lttng-2.0/lttng-modules/lttng-sycalls-protect-is_compat_task-from-redefiniti.patch


Thanks
-- 
     Sau!

Saul Wold
Yocto Component Wrangler @ Intel
Yocto Project / Poky Build System



