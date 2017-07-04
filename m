Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0981C719B8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jul 2017 03:36:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v643aNvE017683
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 3 Jul 2017 20:36:24 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 3 Jul 2017 20:36:22 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 3 Jul 2017 23:36:20 -0400
Message-ID: <cover.1499139296.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 0/1] ltp: Reduce local Pending patches
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
X-List-Received-Date: Tue, 04 Jul 2017 03:36:28 -0000
Content-Type: text/plain

The following changes since commit 98099349e358a9caaec8ec81f0d4abe588909cfe:

  bitbake: npm fetcher: fix unknown variable name. (2017-06-29 14:33:42 +0100)

are available in the git repository at:

  https://github.com/DengkeDu/openembedded-core.git dengke/ltp-reduce-local-pending-patches

Dengke Du (1):
  ltp: Reduce local Pending patches

 ...TH_MAX-undeclared-when-building-with-musl.patch | 15 +++++++-------
 ...RDSIZE-undeclared-when-building-with-musl.patch | 23 +++++++++++-----------
 ...ition-of-struct-msgbuf-error-building-wit.patch |  9 +++++----
 3 files changed, 25 insertions(+), 22 deletions(-)

-- 
2.8.1


