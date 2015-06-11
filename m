Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B51BE73E36
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 09:07:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5B977qq010572
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 02:07:07 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 11 Jun 2015 02:07:07 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Jun 2015 02:07:05 -0700
Message-ID: <cover.1434013599.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] beecrypt: DEPENDS on icu
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
X-List-Received-Date: Thu, 11 Jun 2015 09:07:10 -0000
Content-Type: text/plain

The following changes since commit 7f85e74d5c53b34e5f470967fdbdbd19fed1929a:

  sysvinit: Only enable recipe in builds where its applicable (2015-06-10 12:03:14 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/beecrypt
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/beecrypt

Robert Yang (1):
  beecrypt: DEPENDS on icu

 meta/recipes-support/beecrypt/beecrypt_4.2.1.bb |    2 ++
 1 file changed, 2 insertions(+)

-- 
1.7.9.5


