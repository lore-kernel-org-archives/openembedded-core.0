Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AA3ED71C88
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Nov 2016 06:44:32 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uA46iWth004004
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 Nov 2016 23:44:32 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.209) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Thu, 3 Nov 2016 23:44:31 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 4 Nov 2016 14:44:56 +0800
Message-ID: <cover.1478241842.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] tcf-agent: fix systemd service file
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
X-List-Received-Date: Fri, 04 Nov 2016 06:44:34 -0000
Content-Type: text/plain

The following changes since commit 98c6ebf1e05158c689e01b785d32757847cdb10c:

  oeqa/selftest/kernel.py: Add new file destined for kernel related tests (2016-11-01 10:05:40 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/tcf-agent
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/tcf-agent

Chen Qi (1):
  tcf-agent: fix systemd service file

 meta/recipes-devtools/tcf-agent/tcf-agent/tcf-agent.service | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

-- 
1.9.1


