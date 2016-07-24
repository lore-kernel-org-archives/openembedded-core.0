Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 56CA8607A5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Jul 2016 05:16:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6O5Gfun021143
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Jul 2016 22:16:41 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sat, 23 Jul 2016 22:16:40 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 23 Jul 2016 22:16:39 -0700
Message-ID: <cover.1469337362.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
MIME-Version: 1.0
Subject: [PATCH 0/1] epiphany: inherit perlnative
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
X-List-Received-Date: Sun, 24 Jul 2016 05:16:42 -0000
Content-Type: text/plain

The following changes since commit 0a2df616a5c3316704742f1dcf37b450920e0280:

  boost: fix CVE-2012-2677 (2016-07-21 07:45:01 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/epiphany
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/epiphany

Robert Yang (1):
  epiphany: inherit perlnative

 meta/recipes-gnome/epiphany/epiphany_3.20.3.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

-- 
2.9.0


