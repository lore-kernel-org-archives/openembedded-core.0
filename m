Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 876C2787B4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jan 2018 03:48:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w0I3mTsf013995
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 17 Jan 2018 19:48:29 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 17 Jan 2018 19:48:29 -0800
From: Dengke Du <dengke.du@windriver.com>
To: <juro.bystricky@intel.com>, <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Jan 2018 22:48:27 -0500
Message-ID: <cover.1516247117.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 0/1] python2-dev: improve reproducibility
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
X-List-Received-Date: Thu, 18 Jan 2018 03:48:29 -0000
Content-Type: text/plain

The following changes since commit b9dcab772fd37ed8376a87d3194195e13ff52d10:

  qemu: CVE-2017-17381 (2018-01-14 09:11:58 +0000)

are available in the git repository at:

  https://github.com/DengkeDu/openembedded-core.git dengke/python2-dev
  https://github.com//tree/dengke/python2-dev

Dengke Du (1):
  python2-dev: improve reproducibility

 meta/recipes-devtools/python/python_2.7.13.bb | 4 ++++
 1 file changed, 4 insertions(+)

-- 
2.8.1


