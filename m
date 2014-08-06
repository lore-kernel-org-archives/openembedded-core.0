Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 019237089F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Aug 2014 15:43:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s76FhtHZ028283
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Aug 2014 08:43:56 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 6 Aug 2014 08:43:55 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Aug 2014 08:43:54 -0700
Message-ID: <cover.1407338196.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] boot-directdisk.bbclass: use local HDDDIR
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
X-List-Received-Date: Wed, 06 Aug 2014 15:44:01 -0000
Content-Type: text/plain

The following changes since commit 1fafe7ccc563d5ac9e41f5c1de93d2736745b512:

  ghostscript: Remove bogus gsfonts reference from DESCRIPTION (2014-08-06 11:14:21 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/hdd
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/hdd

Robert Yang (1):
  boot-directdisk.bbclass: use local HDDDIR

 meta/classes/boot-directdisk.bbclass |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
1.7.9.5


