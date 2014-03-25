Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D2B886E40A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 10:20:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2PAKjao007950
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 25 Mar 2014 03:20:45 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 25 Mar 2014 03:20:45 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 25 Mar 2014 18:20:35 +0800
Message-ID: <cover.1395739247.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [dora][PATCH 0/1] license.bbclass: fix copying license directories failed
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
X-List-Received-Date: Tue, 25 Mar 2014 10:20:46 -0000
Content-Type: text/plain

The following changes since commit 023c35795ff8edd79bb27848a01dd49239f052d4:

  lsbtest: fix comparison bashism (2014-03-13 15:38:08 -0700)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-license-dora
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-license-dora

Hongxu Jia (1):
  license.bbclass: fix copying license directories failed

 meta/classes/license.bbclass | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

-- 
1.8.1.2


