Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id DC479781CE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Dec 2017 09:22:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vB49M52G006984
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Dec 2017 01:22:05 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 4 Dec 2017 01:22:04 -0800
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Dec 2017 04:22:02 -0500
Message-ID: <cover.1512379098.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH V2 0/1] ltp: remove ltp-staticdev package
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
X-List-Received-Date: Mon, 04 Dec 2017 09:22:05 -0000
Content-Type: text/plain

Changed in V2:
    Remove the pointless package: ltp-staticdev.

The following changes since commit 4469acdf1d0338220f3fe2ecb5e079eea6fda375:

  lib/oe/utils: remove param_bool() (2017-12-02 11:25:34 +0000)

are available in the git repository at:

  https://github.com/DengkeDu/openembedded-core.git fix-nm01-failed
  https://github.com//tree/fix-nm01-failed

Dengke Du (1):
  ltp: remove ltp-staticdev package

 meta/recipes-extended/ltp/ltp_20170929.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

-- 
2.8.1


