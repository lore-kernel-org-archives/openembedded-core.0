Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7C1906FE2A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 09:44:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7S9iHP7000095
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 02:44:17 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 28 Aug 2014 02:44:16 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Aug 2014 17:39:11 +0800
Message-ID: <cover.1409195325.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] lttng-tools: fix ptest execution failure
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
X-List-Received-Date: Thu, 28 Aug 2014 09:44:25 -0000
Content-Type: text/plain

The following changes since commit c16795477ea7e2159b5d3808268912b572887e2d:

  qemu: add PACKAGECONFIG for numa (2014-08-27 12:13:38 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/lttng
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/lttng

Chong Lu (1):
  lttng-tools: fix ptest execution failure

 meta/recipes-kernel/lttng/lttng-tools_2.5.0.bb | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

-- 
1.9.1


