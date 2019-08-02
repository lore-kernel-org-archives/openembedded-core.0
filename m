Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 32CC57C410
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Aug 2019 09:59:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x729xCRK030207
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Aug 2019 02:59:22 -0700
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Fri, 2 Aug 2019 02:59:01 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Aug 2019 18:24:35 +0800
Message-ID: <cover.1564741458.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1] kill-bb: Add it for killing abnormal bitbake processes
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
X-List-Received-Date: Fri, 02 Aug 2019 09:59:31 -0000
Content-Type: text/plain

The following changes since commit fc634c41e4b3fbaf29dc0104ae6b15757e77f60a:

  Apache-2.0-with-LLVM-exception: Add new license file (2019-07-31 23:02:56 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/kill-bb
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/kill-bb

Robert Yang (1):
  kill-bb: Add it for killing abnormal bitbake processes

 scripts/kill-bb | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100755 scripts/kill-bb

-- 
2.7.4


