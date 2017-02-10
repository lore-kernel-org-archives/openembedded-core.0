Return-Path: <stephano.cetola@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 36232773A2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 22:50:52 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Feb 2017 14:50:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,143,1484035200"; d="scan'208";a="57412673"
Received: from pequod.jf.intel.com ([10.7.201.50])
	by orsmga004.jf.intel.com with ESMTP; 10 Feb 2017 14:50:53 -0800
From: Stephano Cetola <stephano.cetola@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2017 14:50:01 -0800
Message-Id: <20170210225002.20610-1-stephano.cetola@linux.intel.com>
X-Mailer: git-send-email 2.11.1
Subject: [PATCH V2 0/1] remove call to non-existent method
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
X-List-Received-Date: Fri, 10 Feb 2017 22:50:53 -0000

Changed since V1:
reworded commit message

Stephano Cetola (1):
  insane.bbclass: print QA message correctly

 meta/classes/insane.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.11.1


