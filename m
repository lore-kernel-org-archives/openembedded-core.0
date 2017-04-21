Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 848486FEF5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Apr 2017 04:15:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v3L4Ft0m029168
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 21:15:55 -0700 (PDT)
Received: from pek-ddu-u1642.wrs.com (128.224.162.189) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Thu, 20 Apr 2017 21:15:56 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 21 Apr 2017 12:15:52 +0800
Message-ID: <cover.1492745551.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1] lsbtest: add option --ignoreos to rpm install command
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
X-List-Received-Date: Fri, 21 Apr 2017 04:15:57 -0000
Content-Type: text/plain

The following changes since commit 55a53f53263ff4bf7bd6d0c454c464e595e11e4c:

  build-appliance-image: Update to master head revision (2017-04-20 08:16:46 +0100)

are available in the git repository at:

  https://github.com/DengkeDu/openembedded-core.git dengke/LSB_Test
  https://github.com//tree/dengke/LSB_Test

Dengke Du (1):
  lsbtest: add option --ignoreos to rpm install command

 meta/recipes-extended/lsb/lsbtest/LSB_Test.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.7.4


