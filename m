Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 44BC87F35C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2019 03:27:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x8A3QooF028084
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Sep 2019 20:27:01 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Mon, 9 Sep 2019 20:26:39 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 9 Sep 2019 23:26:33 -0400
Message-ID: <20190910032634.33785-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
Subject: [PATCH v2 0/1] systemd: provides ${base_sbindir}/udevadm
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
X-List-Received-Date: Tue, 10 Sep 2019 03:27:10 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

v2:
* update commit message

Kai Kang (1):
  systemd: provides ${base_sbindir}/udevadm

 meta/recipes-core/systemd/systemd_242.bb | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.20.0


