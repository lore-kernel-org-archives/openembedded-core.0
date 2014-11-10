Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 542FB7029A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Nov 2014 08:56:50 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sAA8unjf025344
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Nov 2014 00:56:50 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 10 Nov 2014 00:56:49 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 10 Nov 2014 16:58:43 +0800
Message-ID: <cover.1415609871.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] systemd: add PACKAGECONFIG for 'audit'
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
X-List-Received-Date: Mon, 10 Nov 2014 08:56:54 -0000
Content-Type: text/plain

The following changes since commit 33b7885ecdc8774e34ac3534ec49fed6ffdb3916:

  oprofile: 0.9.9 -> 1.0.0 (2014-11-09 10:19:58 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/systemd-audit
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/systemd-audit

Chen Qi (1):
  systemd: add PACKAGECONFIG for 'audit'

 meta/recipes-core/systemd/systemd_216.bb | 1 +
 1 file changed, 1 insertion(+)

-- 
1.9.1


