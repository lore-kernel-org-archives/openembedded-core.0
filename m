Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5777D7547D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jun 2018 01:08:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w5818xAZ017771
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 7 Jun 2018 18:08:59 -0700 (PDT)
Received: from pek-lpg-core1-vm1.wrs.com (128.224.156.106) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Thu, 7 Jun 2018 18:08:58 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <ross.burton@intel.com>, <openembedded-core@lists.openembedded.org>
Date: Fri, 8 Jun 2018 09:18:31 +0800
Message-ID: <cover.1528420480.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH V2 0/1] trace-cmd: add PACKAGECONFIG for audit
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
X-List-Received-Date: Fri, 08 Jun 2018 01:08:59 -0000
Content-Type: text/plain

The following changes since commit 90a29096f47981e21e86594ca2310b659844c9c1:

  oe-pkgdata-util: package-info: Re-add support for the --extra option (2018-06-04 15:15:00 +0100)

are available in the git repository at:

  https://github.com/DengkeDu/openembedded-core.git dengke/trace-cmd
  https://github.com//tree/dengke/trace-cmd

Dengke Du (1):
  trace-cmd: add PACKAGECONFIG for audit

 meta/recipes-kernel/trace-cmd/trace-cmd_git.bb | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.7.4


