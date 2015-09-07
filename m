Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DF772763F8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Sep 2015 01:48:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t871mDBp027938
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 6 Sep 2015 18:48:13 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Sun, 6 Sep 2015 18:48:13 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 6 Sep 2015 18:48:12 -0700
Message-ID: <cover.1441590457.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] package_manager.py: search provides when not found by pkgname
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
X-List-Received-Date: Mon, 07 Sep 2015 01:48:18 -0000
Content-Type: text/plain

The following changes since commit 8402958cd2cb87b8283c8ee4e2d08e1a6717d67a:

  pseudo_1.7.3.bb: New version of pseudo (2015-09-06 15:24:28 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/smart
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/smart

Robert Yang (1):
  package_manager.py: search provides when not found by pkgname

 meta/lib/oe/package_manager.py |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)

-- 
1.7.9.5


