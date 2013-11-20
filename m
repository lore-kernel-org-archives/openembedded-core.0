Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1F7676C73F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 10:39:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAKAdAih025476
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 20 Nov 2013 02:39:11 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Wed, 20 Nov 2013 02:39:10 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Nov 2013 18:39:01 +0800
Message-ID: <cover.1384943898.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 0/1] license.bbclass: fix copying license directories failed
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
X-List-Received-Date: Wed, 20 Nov 2013 10:39:13 -0000
Content-Type: text/plain

The following changes since commit 215dab864e7cf74394840621ad0754db593708f1:

  bitbake: fetch2: Fix handling of SCM mirrors in MIRRORS (2013-11-19 13:22:48 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-license
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-license

Hongxu Jia (1):
  license.bbclass: fix copying license directories failed

 meta/classes/license.bbclass | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

-- 
1.8.1.2


