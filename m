Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0BE5373163
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Feb 2016 20:13:30 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 14 Feb 2016 12:13:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,447,1449561600"; d="scan'208";a="884576051"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.133.221])
	by orsmga001.jf.intel.com with ESMTP; 14 Feb 2016 12:13:27 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Feb 2016 09:13:02 +1300
Message-Id: <cover.1455480748.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH 0/1] Fix buildhistory for python function parsing change
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
X-List-Received-Date: Sun, 14 Feb 2016 20:13:33 -0000

I wonder how many more of these are lurking...


The following changes since commit bd06944249c3de3f629c013e14f446464441c4da:

  lib/oe/terminal: set workdir for konsole terminal (2016-02-13 08:27:18 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/buildhistory-parse
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/buildhistory-parse

Paul Eggleton (1):
  classes/buildhistory: fix for python function parsing change

 meta/classes/buildhistory.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.5.0


