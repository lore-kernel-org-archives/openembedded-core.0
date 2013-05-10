Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1UadPO-0000YW-AD
	for openembedded-core@lists.openembedded.org;
	Fri, 10 May 2013 04:50:11 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r4A2VxSF018884
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 May 2013 19:32:00 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Thu, 9 May 2013 19:32:00 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 May 2013 10:31:44 +0800
Message-ID: <cover.1368153038.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [RFC PATCH 0/1] bbclass: remove more nostamps for image generation
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
X-List-Received-Date: Fri, 10 May 2013 02:50:21 -0000
Content-Type: text/plain

The following changes since commit 486650fd3819d83d51e9ab84c7c5d11e44dccaf8:

  python: remove the default optimization (2013-05-10 10:25:24 +0800)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib robert/nostamp
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/python

Robert Yang (1):
  bbclass: remove more nostamps for image generation

 meta/classes/boot-directdisk.bbclass | 1 -
 meta/classes/bootimg.bbclass         | 1 -
 meta/classes/image-vmdk.bbclass      | 1 -
 3 files changed, 3 deletions(-)

-- 
1.8.1.2



