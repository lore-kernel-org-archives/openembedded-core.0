Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DFCFA65DA3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Oct 2014 09:07:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9B97dYA009650
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 11 Oct 2014 02:07:39 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sat, 11 Oct 2014 02:07:38 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Sat, 11 Oct 2014 17:07:34 +0800
Message-ID: <cover.1413018367.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] file: add wrapper to nativesdk-file
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
X-List-Received-Date: Sat, 11 Oct 2014 09:07:40 -0000
Content-Type: text/plain

The following changes since commit 0172cded27d73437784fe1578110937aede563eb:

  build-appliance-image: Update to dizzy head revision (2014-10-10 22:40:57 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-nativesdk-file
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-nativesdk-file

Hongxu Jia (1):
  file: add wrapper to nativesdk-file

 meta/recipes-devtools/file/file_5.18.bb | 5 +++++
 1 file changed, 5 insertions(+)

-- 
1.9.1


