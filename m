Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1TlbRJ-00070A-Gr
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Dec 2012 09:25:13 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qBK8ATNC019816
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2012 00:10:29 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.131) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Thu, 20 Dec 2012 00:10:27 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Dec 2012 16:10:24 +0800
Message-ID: <cover.1355990839.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/1]glib-2.0-native:add option march to BUILD_CFLAGS
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
X-List-Received-Date: Thu, 20 Dec 2012 08:25:13 -0000
Content-Type: text/plain

The following changes since commit 90c0eb29f0b41e4ac2d3d17ebad7295c2ebdc02a:

  rootfs_rpm.bbclass: remove debug code (2012-12-19 21:43:55 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/glib-2.0-native
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/glib-2.0-native

Hongxu Jia (1):
  glib-2.0-native:add option march to BUILD_CFLAGS

 meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

-- 
1.7.10.4



