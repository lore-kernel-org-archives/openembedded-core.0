Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A7B257029C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 08:02:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6G82Pqn020785
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 01:02:25 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Wed, 16 Jul 2014 01:02:24 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Jul 2014 16:00:24 +0800
Message-ID: <cover.1405497586.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] perf: split package
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
X-List-Received-Date: Wed, 16 Jul 2014 08:02:30 -0000
Content-Type: text/plain

The following changes since commit 1dcdd877c7946be4c0b1203deb14e2f842f9d0c2:

  bitbake: toasterui: fix build - project identification (2014-07-14 14:10:03 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/perf
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/perf

Chong Lu (1):
  perf: split package

 meta/recipes-kernel/perf/perf.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

-- 
1.9.1


