Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6615C78CF4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 08:29:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w5C8TeCq020422
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 01:29:41 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.399.0; Tue, 12 Jun 2018 01:29:39 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Jun 2018 16:39:16 +0800
Message-ID: <cover.1528792722.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1] send-error-report: decode response from server
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
X-List-Received-Date: Tue, 12 Jun 2018 08:29:40 -0000
Content-Type: text/plain

The following changes since commit 23f15c63777020f5d43b070a1eb2bcf246c19ff8:

  rpm: Fix patch to ensure variables aren't used uninitialised (2018-06-07 08:52:13 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/error_report
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/error_report

Robert Yang (1):
  send-error-report: decode response from server

 scripts/send-error-report | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.7.4


