Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 35B3575D6E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jul 2015 10:01:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t66A1U9F010947
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Jul 2015 03:01:30 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 6 Jul 2015 03:01:30 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 6 Jul 2015 03:01:29 -0700
Message-ID: <cover.1436176865.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] insane.bbclass: skip dev-deps QA checking for ptest package
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
X-List-Received-Date: Mon, 06 Jul 2015 10:01:32 -0000
Content-Type: text/plain

The following changes since commit dd09fab685de2eaf04aa5ab60f8220b89c1deae9:

  tune-core2.inc: set X86ARCH32 to i686 (instead of i586) (2015-07-02 23:08:27 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/insane
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/insane

Robert Yang (1):
  insane.bbclass: skip dev-deps QA checking for ptest package

 meta/classes/insane.bbclass |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
1.7.9.5


