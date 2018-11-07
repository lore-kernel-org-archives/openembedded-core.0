Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7E7E96FF56
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Nov 2018 09:51:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wA79p2la025411
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Nov 2018 01:51:12 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Wed, 7 Nov 2018 01:50:51 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 7 Nov 2018 18:02:36 +0800
Message-ID: <cover.1541584926.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1] metadata_scm.bbclass: simplify base_detect_revision()
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
X-List-Received-Date: Wed, 07 Nov 2018 09:51:21 -0000
Content-Type: text/plain

The following changes since commit 14b5854d50c38e94fc0d1ce6af36698fc69f52b4:

  xserver-xorg: fix CVE-2018-14665 (2018-11-01 13:27:17 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/scm
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/scm

Robert Yang (1):
  metadata_scm.bbclass: simplify base_detect_revision()

 meta/classes/metadata_scm.bbclass | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

-- 
2.7.4


