Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 00FA2797E9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 09:58:01 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8A9vgWV010625
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 02:57:53 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Mon, 10 Sep 2018 02:57:19 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 10 Sep 2018 18:02:20 +0800
Message-ID: <cover.1536573689.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] autotools: do more cleanup when in do_configure
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
X-List-Received-Date: Mon, 10 Sep 2018 09:58:02 -0000
Content-Type: text/plain

*** BLURB HERE ***
The following changes since commit c710430aa1a5a30d3087c3102485d4621e8d179e:

  Revert "prelink: Fix SRC_URI and branch" (2018-09-06 14:49:28 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/autotools-clean
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/autotools-clean

Chen Qi (1):
  autotools: do more cleanup when in do_configure

 meta/classes/autotools.bbclass | 2 ++
 1 file changed, 2 insertions(+)

-- 
1.9.1


