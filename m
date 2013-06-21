Return-Path: <Sen.Zhang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8C3DC609B9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2013 07:33:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5L7XJoh019607
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2013 00:33:20 -0700 (PDT)
Received: from jesse-wrs-desktop.corp.ad.wrs.com (128.224.162.230) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Fri, 21 Jun 2013 00:33:19 -0700
From: Jesse Zhang <sen.zhang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 21 Jun 2013 15:35:28 +0800
Message-ID: <cover.1371800041.git.sen.zhang@windriver.com>
X-Mailer: git-send-email 1.7.11.7
MIME-Version: 1.0
Subject: [PATCH 0/1] update ltp to MAY 2013 STABLE release
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
X-List-Received-Date: Fri, 21 Jun 2013 07:33:20 -0000
Content-Type: text/plain

The following changes since commit 78bcf871c65a87df8b40a0b09654d74434e4d01c:

  bitbake: hob: save variables in conf/ directory (2013-06-20 16:26:22 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib szhang/ltp
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=szhang/ltp

Jesse Zhang (1):
  ltp: update to new release

 meta/recipes-extended/ltp/{ltp_20130109.bb => ltp_20130503.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/ltp/{ltp_20130109.bb => ltp_20130503.bb} (96%)

-- 
1.7.11.7


