Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9A5AA7C72A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 10:30:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x24ATffQ026660
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 4 Mar 2019 02:29:58 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.439.0; Mon, 4 Mar 2019 02:29:49 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Mar 2019 18:48:59 +0800
Message-ID: <cover.1551696484.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1] send-error-report: Add --no-ssl to use http protocol
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
X-List-Received-Date: Mon, 04 Mar 2019 10:30:38 -0000
Content-Type: text/plain

The following changes since commit 9ad19eb12c24d1ddc967215af0ebafd2cd2cb665:

  mcextend: Add helper class useful for multiconfig (2019-03-03 15:38:08 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/error
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/error

Robert Yang (1):
  send-error-report: Add --no-ssl to use http protocol

 scripts/send-error-report | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

-- 
2.7.4


