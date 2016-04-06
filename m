Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DBB6B731B9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Apr 2016 04:45:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u364j03P008938
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Apr 2016 21:45:00 -0700
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 5 Apr 2016 21:44:59 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Apr 2016 00:44:56 -0400
Message-ID: <cover.1459917622.git.dengke.du@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] coreutils: correct the case for class-native
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
X-List-Received-Date: Wed, 06 Apr 2016 04:45:01 -0000
Content-Type: text/plain

The following changes since commit f4f1d206f4ebafcde18c96c88a1bfc4ab7b0c119:

  scripts/lib/bsp/help.py: Typo in help for yocto-bsp create (2016-04-05 14:33:58 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib dengke/correct_the_case_for_class-native
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=dengke/correct_the_case_for_class-native

Dengke Du (1):
  coreutils: correct the case for class-native

 meta/recipes-core/coreutils/coreutils_8.25.bb | 4 ++++
 1 file changed, 4 insertions(+)

-- 
1.9.1


