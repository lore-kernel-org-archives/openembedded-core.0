Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C5A4171634
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jan 2015 12:23:12 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 13 Jan 2015 04:23:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,749,1413270000"; d="scan'208";a="650376242"
Received: from ikatz2-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.18.193])
	by fmsmga001.fm.intel.com with ESMTP; 13 Jan 2015 04:23:11 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Jan 2015 12:23:02 +0000
Message-Id: <cover.1421151750.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH 0/4] A few LICENSE fixes
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
X-List-Received-Date: Tue, 13 Jan 2015 12:23:19 -0000

The following changes since commit b61a2acc321489c3427f0afa3059486dc144a13b:

  bind: Update libxml2 check to make it deterministic. (2015-01-08 09:21:18 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/licenses
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/licenses

Paul Eggleton (4):
  pigz: add Apache-2.0 to LICENSE
  perl: fix LICENSE to be more accurate
  libxml-simple-perl: fix LICENSE to be more accurate
  libxml-parser-perl: fix LICENSE to be more accurate

 meta/recipes-devtools/perl/libxml-parser-perl_2.41.bb | 2 +-
 meta/recipes-devtools/perl/libxml-simple-perl_2.20.bb | 2 +-
 meta/recipes-devtools/perl/perl-native_5.20.0.bb      | 2 +-
 meta/recipes-devtools/perl/perl_5.20.0.bb             | 2 +-
 meta/recipes-extended/pigz/pigz.inc                   | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

-- 
1.9.3


