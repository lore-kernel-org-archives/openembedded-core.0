Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4F0B16060F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Nov 2016 08:03:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uA783N78002277
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Nov 2016 00:03:23 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 7 Nov 2016 00:03:22 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 7 Nov 2016 00:03:21 -0800
Message-ID: <cover.1478505779.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
MIME-Version: 1.0
Subject: [PATCH 0/1] populate_sdk_ext.bbclass: check unfsd before create it
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
X-List-Received-Date: Mon, 07 Nov 2016 08:03:22 -0000
Content-Type: text/plain

The following changes since commit 58de12eaaac9c60bb8fc84a3a965ef86d2a39ae0:

  distro_check: partial rewrite to make it work again (2016-11-06 23:35:23 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/ext
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/ext

Robert Yang (1):
  populate_sdk_ext.bbclass: check unfsd before create it

 meta/classes/populate_sdk_ext.bbclass | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

-- 
2.9.0


