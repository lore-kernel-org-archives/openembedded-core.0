Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 311DE77E4E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 May 2017 09:38:49 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v4O9cpPo010078
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 May 2017 02:38:51 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Wed, 24 May 2017 02:38:50 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 24 May 2017 17:33:57 +0800
Message-ID: <cover.1495618375.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
MIME-Version: 1.0
Subject: [PATCH 0/1] libpcap: add native package
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
X-List-Received-Date: Wed, 24 May 2017 09:38:50 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The following changes since commit a3d160f9e5826140cc8d6b2ed1b38bf022443b08:

  linux-yocto: Update genericx86* SRCREVs for linux-yocto 4.10 (2017-05-23 17:46:14 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/daq
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/daq

Kai Kang (1):
  libpcap: add native package

 meta/recipes-connectivity/libpcap/libpcap.inc | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.10.1


