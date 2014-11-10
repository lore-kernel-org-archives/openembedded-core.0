Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5748C6AC0D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Nov 2014 03:37:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAA3bfcr020458
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 9 Nov 2014 19:37:42 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 9 Nov 2014 19:37:41 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 9 Nov 2014 19:37:40 -0800
Message-ID: <cover.1415590624.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] apr-native: Set CONFIG_SHELL to /bin/bash
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
X-List-Received-Date: Mon, 10 Nov 2014 03:37:47 -0000
Content-Type: text/plain

The following changes since commit 33b7885ecdc8774e34ac3534ec49fed6ffdb3916:

  oprofile: 0.9.9 -> 1.0.0 (2014-11-09 10:19:58 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/apr
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rtb/apr

Robert Yang (1):
  apr-native: Set CONFIG_SHELL to /bin/bash

 meta/recipes-support/apr/apr_1.5.1.bb |    2 ++
 1 file changed, 2 insertions(+)

-- 
1.7.9.5


