Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1UZfOK-0007cM-RR
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 12:45:05 +0200
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r47AR3nT007875
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 7 May 2013 03:27:03 -0700 (PDT)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 7 May 2013 03:27:02 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 7 May 2013 18:26:58 +0800
Message-ID: <cover.1367921762.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/1] image_types.bbclass: remove the obsolete images
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
X-List-Received-Date: Tue, 07 May 2013 10:45:05 -0000
Content-Type: text/plain

The following changes since commit 3472c1f7ab409cd91c1d4782d9e00880b84e3ae8:

  grub-efi-native: Cleanup whitespace (2013-05-03 16:37:05 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib robert/rm_old
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/rm_old

Robert Yang (1):
  image_types.bbclass: remove the obsolete images

 meta/classes/image_types.bbclass     | 6 +++++-
 meta/conf/local.conf.sample.extended | 3 +++
 2 files changed, 8 insertions(+), 1 deletion(-)

-- 
1.8.1.2



