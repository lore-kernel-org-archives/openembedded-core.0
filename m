Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E61816AC43
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 09:01:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5491BkY015807
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Jun 2015 02:01:11 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 4 Jun 2015 02:01:11 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 4 Jun 2015 02:01:09 -0700
Message-ID: <cover.1433408433.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] rpm: remove extra dev and dbg packages
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
X-List-Received-Date: Thu, 04 Jun 2015 09:01:11 -0000
Content-Type: text/plain

The following changes since commit c91ffdb8fff4a62ccb80196a3d735e4b9a3056a3:

  dosfstools: Add recipe for v3.0.28 (2015-06-03 16:38:14 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/dev
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/dev

Robert Yang (1):
  rpm: remove extra dev and dbg packages

 meta/recipes-devtools/rpm/rpm_5.4.14.bb |   14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

-- 
1.7.9.5


