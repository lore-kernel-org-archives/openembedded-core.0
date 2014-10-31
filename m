Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id F25F565E94
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Oct 2014 18:05:13 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 31 Oct 2014 10:59:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="409244994"
Received: from kcathuko-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.isw.intel.com) ([10.252.122.50])
	by FMSMGA003.fm.intel.com with ESMTP; 31 Oct 2014 10:56:58 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Oct 2014 18:05:07 +0000
Message-Id: <cover.1414778669.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH 0/1] wget upgrade
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
X-List-Received-Date: Fri, 31 Oct 2014 18:05:21 -0000

The following change since commit b7936bacf0cc89bdda6722d317274bd4a3af840a:

  elfutils: fix elf_cvt_gnuhash (2014-10-30 13:12:58 +0000)

is available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/wget
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/wget

Paul Eggleton (1):
  wget: upgrade to 1.16

 meta/recipes-extended/wget/{wget_1.15.bb => wget_1.16.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/wget/{wget_1.15.bb => wget_1.16.bb} (45%)

-- 
1.9.3


