Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6D8156C68A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2018 10:51:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wANApYm7028915
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2018 02:51:44 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Fri, 23 Nov 2018 02:51:23 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 23 Nov 2018 19:08:40 +0800
Message-ID: <cover.1542971171.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1] uboot-sign.bbclass: Remove tab indentations in python code
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
X-List-Received-Date: Fri, 23 Nov 2018 10:51:53 -0000
Content-Type: text/plain

Note, I send this patch separately is because it depends on another patch of
mine which was sent on Wed.:
uboot-sign.bbclass: fix signature and deployment

// Robert

The following changes since commit d29e9922e750bc1637f4fe454f4cc6dcfb74f09a:

  uboot-sign.bbclass: fix signature and deployment (2018-11-23 19:05:39 +0800)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/uboot_py
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/uboot_py

Robert Yang (1):
  uboot-sign.bbclass: Remove tab indentations in python code

 meta/classes/uboot-sign.bbclass | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

-- 
2.7.4


