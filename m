Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AF4CE65CED
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Nov 2014 01:54:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAD1sHDk019501
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 12 Nov 2014 17:54:17 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Wed, 12 Nov 2014 17:54:17 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Thu, 13 Nov 2014 09:54:13 +0800
Message-ID: <cover.1415843582.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] postinst-intercept: rename recipe for nativesdk only
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
X-List-Received-Date: Thu, 13 Nov 2014 01:54:25 -0000
Content-Type: text/plain

The following changes since commit 3c741a8d33acbf4b3d5eecc04533bc76e2f37253:

  oprofile: 0.9.9 -> 1.0.0 (2014-11-09 10:21:24 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-nonexist-pkg
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-nonexist-pkg

Hongxu Jia (1):
  postinst-intercept: rename recipe for nativesdk only

 ...ostinst-intercept_1.0.bb => nativesdk-postinst-intercept_1.0.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-devtools/postinst-intercept/{postinst-intercept_1.0.bb => nativesdk-postinst-intercept_1.0.bb} (83%)

-- 
1.9.1


