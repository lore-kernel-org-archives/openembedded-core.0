Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 40E907949B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 08:07:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7N87D9I020996
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Aug 2018 01:07:13 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Thu, 23 Aug 2018 01:07:12 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 23 Aug 2018 16:11:45 +0800
Message-ID: <cover.1535011880.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] util-linux: upgrade 2.32 -> 2.32.1
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
X-List-Received-Date: Thu, 23 Aug 2018 08:07:12 -0000
Content-Type: text/plain

*** BLURB HERE ***
The following changes since commit cbe2d3cb0af6c7a5cd368e7dc489960a13648bd0:

  bitbake: daemonize: Flush stdio on exit (2018-08-23 08:50:23 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/util-linux-2.32.1
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/util-linux-2.32.1

Chen Qi (1):
  util-linux: upgrade 2.32 -> 2.32.1

 .../util-linux/{util-linux_2.32.bb => util-linux_2.32.1.bb}           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/util-linux/{util-linux_2.32.bb => util-linux_2.32.1.bb} (84%)

-- 
1.9.1


