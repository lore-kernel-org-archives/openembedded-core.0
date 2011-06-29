Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QbuaB-0002im-H5
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 15:13:31 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 29 Jun 2011 06:09:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,443,1304319600"; d="scan'208";a="20290280"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.71])
	by azsmga001.ch.intel.com with ESMTP; 29 Jun 2011 06:09:47 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jun 2011 21:09:39 +0800
Message-Id: <c6704dff44896cee7aabba9b86253c59a063dec6.1309352791.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1309352791.git.dexuan.cui@intel.com>
References: <cover.1309352791.git.dexuan.cui@intel.com>
In-Reply-To: <cover.1309352791.git.dexuan.cui@intel.com>
References: <cover.1309352791.git.dexuan.cui@intel.com>
Subject: [PATCH 2/3] lttng-ust: change the patch's Upstream-Status to Accepted.
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
X-List-Received-Date: Wed, 29 Jun 2011 13:13:31 -0000

Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
---
 .../lttng/lttng-ust/uclibc-sched_getcpu.patch      |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-kernel/lttng/lttng-ust/uclibc-sched_getcpu.patch b/meta/recipes-kernel/lttng/lttng-ust/uclibc-sched_getcpu.patch
index a6aa6a7..f4ea196 100644
--- a/meta/recipes-kernel/lttng/lttng-ust/uclibc-sched_getcpu.patch
+++ b/meta/recipes-kernel/lttng/lttng-ust/uclibc-sched_getcpu.patch
@@ -6,7 +6,7 @@ this header is not needed even in eglibc case so it can be removed
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Upstream-Status: Submitted
+Upstream-Status: Accepted
 
 Index: ust-0.12/libust/tracer.h
 ===================================================================
-- 
1.7.6



