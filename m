Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E9EB26CBAB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Oct 2013 09:57:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r999vBfS020066
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 Oct 2013 02:57:11 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Wed, 9 Oct 2013 02:57:10 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 9 Oct 2013 17:57:34 +0800
Message-ID: <cover.1381312594.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] device_table-minimal.txt: change group of /dev/hda back to disk
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
X-List-Received-Date: Wed, 09 Oct 2013 09:57:09 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The following changes since commit 5445f71fc812a5fcf9bd67a26a500284af16ad39:

  bitbake: hob: change tooltip for live images (2013-10-07 16:25:02 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/device_table-typo
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/device_table-typo

Chen Qi (1):
  device_table-minimal.txt: change group of /dev/hda back to disk

 meta/files/device_table-minimal.txt |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
1.7.9.5


