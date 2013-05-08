Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1Ua0cG-0000Os-Li
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 11:24:53 +0200
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r4896n1V005458
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 May 2013 02:06:49 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Wed, 8 May 2013 02:06:48 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 May 2013 05:06:45 -0400
Message-ID: <cover.1368002042.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/1] bbclass: bb.fatal() clean up
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 May 2013 09:24:56 -0000
Content-Type: text/plain

The following changes since commit 9895d2c074156fee338d91aed7cfb0800477c622:

  maintainers.inc: update sbc pkg maintainer (2013-05-07 13:58:26 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib robert/fatal
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/fatal

Robert Yang (1):
  bbclass: bb.fatal() clean up

 meta/classes/insane.bbclass      |    1 -
 meta/classes/package.bbclass     |    1 -
 meta/classes/package_rpm.bbclass |    2 --
 3 files changed, 4 deletions(-)

-- 
1.7.10.4



