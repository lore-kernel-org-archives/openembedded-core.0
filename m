Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BA3F77851A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Dec 2017 06:58:03 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vB16w4IM006943
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Nov 2017 22:58:04 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 30 Nov 2017 22:58:03 -0800
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Dec 2017 01:58:01 -0500
Message-ID: <cover.1512111404.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 0/1] ltp: add runtime depends ltp-staticdev
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
X-List-Received-Date: Fri, 01 Dec 2017 06:58:03 -0000
Content-Type: text/plain

The following changes since commit ed48e7b4f0d11bf20e0be44d8403fc16dd6d4411:

  usbutils: remove uclibc-specific patch (2017-11-30 10:49:22 +0000)

are available in the git repository at:

  https://github.com/DengkeDu/openembedded-core.git fix-nm01-failed
  https://github.com//tree/fix-nm01-failed

Dengke Du (1):
  ltp: add runtime depends ltp-staticdev

 meta/recipes-extended/ltp/ltp_20170929.bb | 1 +
 1 file changed, 1 insertion(+)

-- 
2.8.1


