Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id F276D77166
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 07:50:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u137oDMN023796
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Feb 2016 23:50:14 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 2 Feb 2016 23:50:12 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 3 Feb 2016 15:50:20 +0800
Message-ID: <cover.1454485614.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] copy_buildsystem: add ability to exclude layers
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
X-List-Received-Date: Wed, 03 Feb 2016 07:50:15 -0000
Content-Type: text/plain

The following changes since commit 2218490b075b077683f17b643ab211c7716d0dfc:

  documentation.conf: align the documentation for DEBUG_OPTIMIZATION and FULL_OPTIMIZATION with bitbake.conf (2016-02-02 17:48:00 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/sdk-exclude-layers
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/sdk-exclude-layers

Chen Qi (1):
  copy_buildsystem: add ability to exclude layers

 meta/lib/oe/copy_buildsystem.py | 6 ++++++
 1 file changed, 6 insertions(+)

-- 
1.9.1


