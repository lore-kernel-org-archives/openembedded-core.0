Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 805B76FEFE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 09:39:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9C9cIf8025023
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 02:38:58 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Fri, 12 Oct 2018 02:38:07 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 12 Oct 2018 16:57:10 +0800
Message-ID: <cover.1539334497.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Subject: [PATCH 0/1] image_types_wic: set consistent staging dirs
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
X-List-Received-Date: Fri, 12 Oct 2018 09:39:07 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>


The following changes since commit 793a82c2da639088884c93595e6a3f28e5e3d747:

  oeqa/manual/oe-core: Drop image build during taskexp test (2018-10-11 23:06:35 +0100)

are available in the Git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/wic
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/wic

Kai Kang (1):
  image_types_wic: set consistent staging dirs

 meta/classes/image_types_wic.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

-- 
2.18.0


