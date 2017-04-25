Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 74B5571B9E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Apr 2017 03:35:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v3P3ZhFZ027734
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Apr 2017 20:35:44 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 24 Apr 2017 20:35:42 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Apr 2017 20:35:41 -0700
Message-ID: <cover.1493091283.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [PATCH 0/1] oe-find-native-sysroot: don't clear OECORE_NATIVE_SYSROOT
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
X-List-Received-Date: Tue, 25 Apr 2017 03:35:47 -0000
Content-Type: text/plain

The following changes since commit e584be78f92ee6f08f570c239698d56ac78d05f9:

  build-appliance-image: Update to master head revision (2017-04-21 08:22:14 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/find-sysroot
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/find-sysroot

Robert Yang (1):
  oe-find-native-sysroot: don't clear OECORE_NATIVE_SYSROOT

 scripts/oe-find-native-sysroot | 1 -
 1 file changed, 1 deletion(-)

-- 
2.10.2


