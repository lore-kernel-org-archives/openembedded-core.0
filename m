Return-Path: <Hongxu.Jia@windriver.com>
X-Greylist: delayed 2826 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 02 Nov 2015 08:00:03 UTC
Received: from mail5.wrs.com (unknown [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2D34475D4A
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Nov 2015 08:00:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tA27Cth9004478
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Sun, 1 Nov 2015 23:12:56 -0800
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Sun, 1 Nov 2015 23:12:55 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Mon, 2 Nov 2015 15:12:49 +0800
Message-ID: <cover.1446448302.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] default-distrovars: remove less from WHITELIST_GPL-3.0
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
X-List-Received-Date: Mon, 02 Nov 2015 08:00:04 -0000
Content-Type: text/plain

The following changes since commit 370a2916c4559c17952392b872322e8e490b124c:

  build-appliance-image: Update to jethro head revision (2015-10-29 22:20:40 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/less
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/less

Hongxu Jia (1):
  default-distrovars: remove less from WHITELIST_GPL-3.0

 meta/conf/distro/include/default-distrovars.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.9.1


