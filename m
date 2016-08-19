Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BE98A755F8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 01:29:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7J1TDYW013875
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2016 18:29:18 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 18 Aug 2016 18:29:16 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Aug 2016 18:29:15 -0700
Message-ID: <cover.1471570130.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
MIME-Version: 1.0
Subject: [PATCH 0/1] kbd: remove PARALLEL_MAKEINST = ""
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
X-List-Received-Date: Fri, 19 Aug 2016 01:29:18 -0000
Content-Type: text/plain

The following changes since commit 5dca6cc2fcdb2799c19b1697f0647a16ce296290:

  systemd-compat-units: Only enable for systemd in DISTRO_FEATURES (2016-08-18 16:52:02 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/kbd
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/kbd

Robert Yang (1):
  kbd: remove PARALLEL_MAKEINST = ""

 meta/recipes-core/kbd/kbd_2.0.3.bb | 1 -
 1 file changed, 1 deletion(-)

-- 
2.9.0


