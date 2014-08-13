Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AB55365CAD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 08:23:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7D8NE6S009487
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Aug 2014 01:23:14 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 13 Aug 2014 01:23:13 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Aug 2014 01:23:12 -0700
Message-ID: <cover.1407918169.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] python-pygtk: fix native python path
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
X-List-Received-Date: Wed, 13 Aug 2014 08:23:14 -0000
Content-Type: text/plain

The following changes since commit 4321c553d5ae816e566234e981a0815bba046d39:

  SIGGEN_EXCLUDERECIPES_ABISAFE: add initscripts (2014-08-11 17:44:09 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/pygtk
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/pygtk

Robert Yang (1):
  python-pygtk: fix native python path

 .../recipes-devtools/python/python-pygtk_2.24.0.bb |    1 +
 1 file changed, 1 insertion(+)

-- 
1.7.9.5


