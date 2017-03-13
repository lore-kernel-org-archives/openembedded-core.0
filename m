Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 20A23776D2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 07:46:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v2D7klW4026381
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 00:46:47 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 13 Mar 2017 00:46:46 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Mar 2017 00:46:44 -0700
Message-ID: <cover.1489391139.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
MIME-Version: 1.0
Subject: [PATCH 0/2] add tools for terminal and devshell
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
X-List-Received-Date: Mon, 13 Mar 2017 07:46:49 -0000
Content-Type: text/plain

The following changes since commit a47e64d985a610535449730806651f5bfd75d9ec:

  libcomps: add a recipe (2017-03-11 16:08:50 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/tools
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/tools

Robert Yang (2):
  terminal.bbclass: add tools for terminal
  devshell.bbclass: add editors for devshell

 meta/classes/devshell.bbclass | 6 ++++++
 meta/classes/terminal.bbclass | 5 +++++
 2 files changed, 11 insertions(+)

-- 
2.11.0.rc2.dirty


