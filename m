Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 67D36731A5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 08:11:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0L8BIHB018628
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 00:11:18 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 21 Jan 2016 00:11:17 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Jan 2016 00:11:16 -0800
Message-ID: <cover.1453363852.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] insane.bbclass: do_package_qa depends on WARN_QA and ERROR_QA
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
X-List-Received-Date: Thu, 21 Jan 2016 08:11:20 -0000
Content-Type: text/plain

The following changes since commit 8084c185c43cb7e7f5e29d31939dfd308f8a0f93:

  udev: Add 2 patches to support 4.4 kernel (2016-01-20 09:20:06 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/rerun
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/rerun

Robert Yang (1):
  insane.bbclass: do_package_qa depends on WARN_QA and ERROR_QA

 meta/classes/insane.bbclass |    1 +
 1 file changed, 1 insertion(+)

-- 
1.7.9.5


