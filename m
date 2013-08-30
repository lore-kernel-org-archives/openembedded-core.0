Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 98DD66BD74
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2013 06:57:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7U6v6xi014943
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 23:57:06 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Thu, 29 Aug 2013 23:57:05 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 30 Aug 2013 14:57:02 +0800
Message-ID: <cover.1377845594.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/1] binutils-cross: autotools dependence is needed
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
X-List-Received-Date: Fri, 30 Aug 2013 06:57:05 -0000
Content-Type: text/plain

The following changes since commit b467b99a5d25efe5eadfb07dbecba608575256ac:

  linux-yocto: switch genericx86 to use common-pc (2013-08-24 09:37:49 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-binutils-cross
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-binutils-cross

Hongxu Jia (1):
  binutils-cross: autotools dependence is needed

 meta/recipes-devtools/binutils/binutils-cross.inc | 1 -
 1 file changed, 1 deletion(-)

-- 
1.8.1.2


