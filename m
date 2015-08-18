Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0B5CE60043
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Aug 2015 17:40:32 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 18 Aug 2015 10:40:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,703,1432623600"; d="scan'208";a="750978403"
Received: from aehernan-mobl1.zpn.intel.com ([10.219.26.251])
	by orsmga001.jf.intel.com with ESMTP; 18 Aug 2015 10:40:28 -0700
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Aug 2015 12:41:07 -0500
Message-Id: <cover.1439919346.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 0/1] terminal.py: Provides devshell support for gnome-terminal >= 3.10
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Aug 2015 17:40:35 -0000

The following changes since commit 645435a645a0817cec94ce1433eb74fbe7388416:

  bitbake: toastergui: Added IDs to elements used in testing (2015-08-17 08:48:28 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib hsalejandro/gnome-terminal-devshell
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=hsalejandro/gnome-terminal-devshell

Alejandro Hernandez (1):
  terminal.py: Provides devshell support for gnome-terminal >= 3.10

 meta/lib/oe/terminal.py | 46 ++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 38 insertions(+), 8 deletions(-)

-- 
1.9.1


