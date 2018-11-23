Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 94D816BC7E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2018 10:06:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wANA5tCh027949
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 23 Nov 2018 02:06:05 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Fri, 23 Nov 2018 02:05:44 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 23 Nov 2018 18:22:59 +0800
Message-ID: <cover.1542968556.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1] bugzilla.bbclass: Remove it since obsoleted
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
X-List-Received-Date: Fri, 23 Nov 2018 10:06:31 -0000
Content-Type: text/plain

The following changes since commit c80972be1f3592d797da9eb0845b739420c6da4a:

  maintainers: Add entry for new recipe libdazzle (2018-11-22 10:00:12 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/rm
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/rm

Robert Yang (1):
  bugzilla.bbclass: Remove it since obsoleted

 meta/classes/bugzilla.bbclass | 187 ------------------------------------------
 1 file changed, 187 deletions(-)
 delete mode 100644 meta/classes/bugzilla.bbclass

-- 
2.7.4


