Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 06B9E7825C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jan 2018 10:33:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w0FAXiTW010972
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jan 2018 02:33:44 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Mon, 15 Jan 2018 02:33:44 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 15 Jan 2018 18:34:03 +0800
Message-ID: <cover.1516012306.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1] scripts/oe-depends-dot: add it to handle dot files
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
X-List-Received-Date: Mon, 15 Jan 2018 10:33:44 -0000
Content-Type: text/plain

The following changes since commit 92a0513837182e2e9aa6c7d4958e495f4b5b4c47:

  qemu: CVE-2017-17381 (2018-01-14 09:11:28 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/oe-dot
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/oe-dot

Robert Yang (1):
  scripts/oe-depends-dot: add it to handle dot files

 scripts/oe-depends-dot | 121 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 121 insertions(+)
 create mode 100755 scripts/oe-depends-dot

-- 
2.7.4


