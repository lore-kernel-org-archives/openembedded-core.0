Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5C72977F7D
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 May 2017 07:49:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v4R7nwXC015322
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 May 2017 00:49:58 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Sat, 27 May 2017 00:49:57 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 27 May 2017 15:45:02 +0800
Message-ID: <cover.1495871042.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
MIME-Version: 1.0
Subject: [PATCH 0/1] lsof: clear setuid
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
X-List-Received-Date: Sat, 27 May 2017 07:49:58 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The following changes since commit 5eed6c644f715783edb0d05926373e719442dd6a:

  libpcap: add native package (2017-05-25 23:59:32 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/lsof
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/lsof

Kai Kang (1):
  lsof: clear setuid

 meta/recipes-extended/lsof/lsof_4.89.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.10.1


