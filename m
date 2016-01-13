Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 949C26FF7F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jan 2016 03:22:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0D3MsFC020602
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 19:22:55 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.246) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Tue, 12 Jan 2016 19:22:53 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Jan 2016 11:23:05 +0800
Message-ID: <cover.1452655299.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] cups: upgrade to 2.1.2
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
X-List-Received-Date: Wed, 13 Jan 2016 03:22:58 -0000
Content-Type: text/plain

The following changes since commit 541315d6c56df6448f64c262f99d43d5c1e9400b:

  update_font_cache: only scan system font directories (2016-01-11 23:23:18 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/cups-2.1.2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/cups-2.1.2

Chen Qi (1):
  cups: upgrade to 2.1.2

 meta/recipes-extended/cups/cups.inc                    | 18 ++++++++++++------
 .../cups/{cups_2.0.4.bb => cups_2.1.2.bb}              |  4 ++--
 2 files changed, 14 insertions(+), 8 deletions(-)
 rename meta/recipes-extended/cups/{cups_2.0.4.bb => cups_2.1.2.bb} (40%)

-- 
1.9.1


