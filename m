Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 20A5961585
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jun 2014 16:32:09 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 09 Jun 2014 09:27:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="352552382"
Received: from mmckenna-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.49])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Jun 2014 09:28:10 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jun 2014 17:31:46 +0100
Message-Id: <cover.1402331462.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [dora][PATCH 0/1] x264 SRCREV fix
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
X-List-Received-Date: Mon, 09 Jun 2014 16:32:14 -0000

The following changes since commit 68da848e0f7f026bf18707d8d59143177ff66f9b:

  gnutls: patch for CVE-2014-3466 backported (2014-06-06 10:27:11 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/x264-dora
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/x264-dora

Khem Raj (1):
  x264: Update SRCREV to match commit in upstream git repo

 meta/recipes-multimedia/x264/x264_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.9.3


