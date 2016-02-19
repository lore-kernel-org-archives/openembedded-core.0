Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id B174D60111
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 09:42:01 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 19 Feb 2016 01:42:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,469,1449561600"; d="scan'208";a="916466755"
Received: from eyeoh10-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.132.216])
	by orsmga002.jf.intel.com with ESMTP; 19 Feb 2016 01:42:00 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Feb 2016 22:41:57 +1300
Message-Id: <cover.1455874891.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH 0/1] Improve ext SDK config extension mechanism
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
X-List-Received-Date: Fri, 19 Feb 2016 09:42:02 -0000

The following changes since commit 58b45240739da210ef2fecea931c8b8daa9a4c07:

  epiphany: Add libxml2-native to DEPENDS (2016-02-18 22:55:12 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/extsdkfixes6-oe
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/extsdkfixes6-oe

Paul Eggleton (1):
  classes/populate_sdk_ext: add a better config extension mechanism

 meta/classes/populate_sdk_ext.bbclass | 8 ++++++++
 1 file changed, 8 insertions(+)

-- 
2.5.0


