Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D885B731C4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jun 2016 03:09:42 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 28 Jun 2016 20:09:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,544,1459839600"; d="scan'208";a="1007162924"
Received: from hkao-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.176.158])
	by orsmga002.jf.intel.com with ESMTP; 28 Jun 2016 20:09:40 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jun 2016 15:09:15 +1200
Message-Id: <cover.1467169702.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 0/1] Drop left-over RPM4 example
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
X-List-Received-Date: Wed, 29 Jun 2016 03:09:43 -0000

The following changes since commit 646c366c2566bd8dd6f73681cea9f5b021589a56:

  gst-player: upgrade to latest HEAD (2016-06-27 14:08:37 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/rpm4-remove
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/rpm4-remove

Paul Eggleton (1):
  local.conf.sample.extended: drop RPM4 example

 meta/conf/local.conf.sample.extended | 10 ----------
 1 file changed, 10 deletions(-)

-- 
2.5.5


