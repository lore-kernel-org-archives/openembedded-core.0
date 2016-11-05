Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 87B6D71AD1
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 Nov 2016 05:29:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uA55Tqro014800
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Nov 2016 22:29:52 -0700 (PDT)
Received: from pek-lpgtest20.wrs.com (128.224.179.28) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Fri, 4 Nov 2016 22:29:51 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 5 Nov 2016 13:29:49 +0800
Message-ID: <cover.1478323482.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1] trace-cmd: fix QA warning
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
X-List-Received-Date: Sat, 05 Nov 2016 05:29:52 -0000
Content-Type: text/plain

The following changes since commit c3d2df883a9d6d5036277114339673656d89a728:

  oeqa/selftest/kernel.py: Add new file destined for kernel related tests (2016-11-01 10:05:46 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib dengke/fix-trace_cmd-QA-warning
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=dengke/fix-trace_cmd-QA-warning

Dengke Du (1):
  trace-cmd: fix QA warning

 meta/recipes-kernel/trace-cmd/trace-cmd_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.7.4


