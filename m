Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3357F606E8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Feb 2015 02:37:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t1L2b6x6008997
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 18:37:06 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 20 Feb 2015 18:37:06 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 20 Feb 2015 18:37:05 -0800
Message-ID: <cover.1424486192.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] groff: skip file-rdeps checking
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
X-List-Received-Date: Sat, 21 Feb 2015 02:37:06 -0000
Content-Type: text/plain

The following changes since commit 530565c6cb77319f4cc49edeea6fec6be997415d:

  glibc: Update to glibc 2.21 release tag (2015-02-19 17:04:19 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/groff
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/groff

Robert Yang (1):
  groff: skip file-rdeps checking

 meta/recipes-extended/groff/groff_1.18.1.4.bb |    1 +
 meta/recipes-extended/groff/groff_1.22.2.bb   |    2 ++
 2 files changed, 3 insertions(+)

-- 
1.7.9.5


