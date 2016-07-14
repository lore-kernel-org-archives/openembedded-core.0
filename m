Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 24A266AC4B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2016 18:45:56 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6EIjuPJ016268
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2016 11:45:56 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 14 Jul 2016 11:45:55 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Jul 2016 11:45:54 -0700
Message-ID: <1468521955-14769-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH 0/1] add license info for libidn
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
X-List-Received-Date: Thu, 14 Jul 2016 18:46:00 -0000
Content-Type: text/plain

This might be a re-send of something I sent last week.  It
avoids the appearance of GPLV3 on a target including libidn
but not idn.

Joe Slater (1):
  libidn: add license per package

 meta/recipes-extended/libidn/libidn_1.32.bb |    3 +++
 1 file changed, 3 insertions(+)

-- 
1.7.9.5


