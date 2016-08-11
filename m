Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A3B02731F6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 04:38:03 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 10 Aug 2016 21:38:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,503,1464678000"; d="scan'208";a="1012328484"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.171.53])
	by orsmga001.jf.intel.com with ESMTP; 10 Aug 2016 21:38:02 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Aug 2016 16:37:33 +1200
Message-Id: <cover.1470890224.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 0/1] oe-buildenv-internal: hint at specifying bitbake path in error message
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
X-List-Received-Date: Thu, 11 Aug 2016 04:38:04 -0000

The following changes since commit 5ed0d5a7d9b051a551a6de644bf6a42b87c12471:

  dbus: backport stdint.h build fix (2016-08-10 10:45:33 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/oe-init-bitbake
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/oe-init-bitbake

Paul Eggleton (1):
  oe-buildenv-internal: hint at specifying bitbake path in error message

 scripts/oe-buildenv-internal | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.5.5


