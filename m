Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 988097CFF9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2019 07:23:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x2T7MiF0014673
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2019 00:23:00 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.190) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Fri, 29 Mar 2019 00:22:37 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 29 Mar 2019 15:33:01 +0800
Message-ID: <cover.1553844755.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] nasm: add CVE_PRODUCT
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
X-List-Received-Date: Fri, 29 Mar 2019 07:23:09 -0000
Content-Type: text/plain

*** BLURB HERE ***
The following changes since commit 35742c10f531ba451c06a4e360fecfb55f358b35:

  ref-manual: Removed DISK_DESCRIPTION variable from glossary (2019-03-26 15:38:56 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/nasm-cve
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/nasm-cve

Chen Qi (1):
  nasm: add CVE_PRODUCT

 meta/recipes-devtools/nasm/nasm_2.14.02.bb | 2 ++
 1 file changed, 2 insertions(+)

-- 
1.9.1


