Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8AE427CE5A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 08:36:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x2R8ZX7g008684
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Mar 2019 01:35:54 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.190) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Wed, 27 Mar 2019 01:35:29 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Mar 2019 16:45:50 +0800
Message-ID: <cover.1553676312.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] libarchive: fix up CVE IDs in patches
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
X-List-Received-Date: Wed, 27 Mar 2019 08:36:03 -0000
Content-Type: text/plain

*** BLURB HERE ***
The following changes since commit 35742c10f531ba451c06a4e360fecfb55f358b35:

  ref-manual: Removed DISK_DESCRIPTION variable from glossary (2019-03-26 15:38:56 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/libarchive-fixup
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/libarchive-fixup

Chen Qi (1):
  libarchive: fix up CVE IDs in patches

 meta/recipes-extended/libarchive/libarchive/CVE-2019-1000019.patch | 2 +-
 meta/recipes-extended/libarchive/libarchive/CVE-2019-1000020.patch | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
1.9.1


