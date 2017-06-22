Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E007777E58
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 08:30:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v5M8U7vd018047
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jun 2017 01:30:07 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 22 Jun 2017 01:30:06 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Jun 2017 01:30:05 -0700
Message-ID: <cover.1498120161.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH 0/1] runqemu: drop RPC ports
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
X-List-Received-Date: Thu, 22 Jun 2017 08:30:07 -0000
Content-Type: text/plain

The following changes since commit 9ea5a31776440abd6468f003c5e1905f079446d3:

  ovmf: fix secureboot PACKAGECONFIG + OpenSSL update (2017-06-16 10:58:23 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/runqemu
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/runqemu

Robert Yang (1):
  runqemu: drop RPC ports

 scripts/runqemu | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

-- 
2.11.0


