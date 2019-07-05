Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5736E7EBA7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2019 01:18:26 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x651Hu1D019496
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 4 Jul 2019 18:18:17 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.148) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Thu, 4 Jul 2019 18:17:58 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 5 Jul 2019 09:30:26 +0800
Message-ID: <cover.1562290204.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] xmlcatalog.bbclass: execute xmlcatalog only if it's available
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
X-List-Received-Date: Fri, 05 Jul 2019 01:18:26 -0000
Content-Type: text/plain

*** BLURB HERE ***
The following changes since commit 4fd9ee4670293632cc0ca1e64b8833eb6014435d:

  bitbake: bitbake: Add --skip-setscene option (2019-07-03 17:00:57 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/xmlcatalog-esdk
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/xmlcatalog-esdk

Chen Qi (1):
  xmlcatalog.bbclass: execute xmlcatalog only if it's available

 meta/classes/xmlcatalog.bbclass | 2 ++
 1 file changed, 2 insertions(+)

-- 
1.9.1


