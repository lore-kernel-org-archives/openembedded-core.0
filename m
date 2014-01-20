Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5C6F46CBD7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 12:24:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0KCOXmi000907
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 04:24:34 -0800 (PST)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Mon, 20 Jan 2014 04:24:33 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 20 Jan 2014 20:24:42 +0800
Message-ID: <cover.1390220655.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH 0/1] e2fsprogs/populate-extfs.sh: fix a problem on dash
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
X-List-Received-Date: Mon, 20 Jan 2014 12:24:34 -0000
Content-Type: text/plain

The following changes since commit 9f7465db614c664c49904033aa70170278972932:

  siggen.py: fix the SignatureGenerator() (2014-01-20 19:43:03 +0800)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib rbt/dash
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=rbt/dash

Robert Yang (1):
  e2fsprogs/populate-extfs.sh: fix a problem on dash

 meta/recipes-devtools/e2fsprogs/e2fsprogs/populate-extfs.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.8.3.1


