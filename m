Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DE75B60110
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Mar 2016 02:36:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u2G2aHGu003576
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2016 19:36:18 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.210) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 15 Mar 2016 19:36:16 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Mar 2016 10:36:26 +0800
Message-ID: <cover.1458095727.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V2 0/1] sysstat: add configuration file in tmpfiles.d
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
X-List-Received-Date: Wed, 16 Mar 2016 02:36:19 -0000
Content-Type: text/plain

Changes since V1:
Rebased against latest master.

The following changes since commit 300f858ba07c938427ccd05a3d7220027a03d461:

  local.conf.sample: Disable prelink by default (2016-03-13 22:08:55 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/sysstat-tmpfiles
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/sysstat-tmpfiles

Chen Qi (1):
  sysstat: add configuration file in tmpfiles.d

 meta/recipes-extended/sysstat/sysstat.inc | 6 ++++++
 1 file changed, 6 insertions(+)

-- 
1.9.1


