Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F251173F5C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 08:12:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4E8CBZA022257
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 01:12:11 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 14 May 2015 01:12:11 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 14 May 2015 01:12:10 -0700
Message-ID: <cover.1431591106.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] kernelshark: fix for rebuild
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
X-List-Received-Date: Thu, 14 May 2015 08:12:10 -0000
Content-Type: text/plain

The following changes since commit 1702f52b5860336d36fb912fbe2851437e74a7d5:

  gcc5: Add PR65779 patch to fix powerpc compile issues (2015-05-12 13:09:44 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/kernelshark
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/kernelshark

Robert Yang (1):
  kernelshark: fix for rebuild

 meta/recipes-kernel/trace-cmd/kernelshark_git.bb |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

-- 
1.7.9.5


