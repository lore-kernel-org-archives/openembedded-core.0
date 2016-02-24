Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2329B772F3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 20:30:37 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 24 Feb 2016 12:30:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,494,1449561600"; d="scan'208";a="752638296"
Received: from mmsaini-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.138.207])
	by orsmga003.jf.intel.com with ESMTP; 24 Feb 2016 12:30:35 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Feb 2016 09:29:54 +1300
Message-Id: <cover.1456345722.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [jethro][PATCH 0/1] One backport for jethro
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
X-List-Received-Date: Wed, 24 Feb 2016 20:30:38 -0000

This is intended for after the imminent point release of course.


The following changes since commit 0c702756dd0009c4112028fbf2479a346867b32c:

  build-appliance-image: Update to jethro head revision (2016-02-24 09:04:05 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/jethro-fixes3
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/jethro-fixes3

Craig McQueen (1):
  os-release: put double-quotes around variable contents

 meta/recipes-core/os-release/os-release.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.5.0


