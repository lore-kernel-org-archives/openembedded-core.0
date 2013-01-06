Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1TrlvE-0001zt-UD
	for openembedded-core@lists.openembedded.org;
	Sun, 06 Jan 2013 09:49:37 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r068YT0f002251
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 6 Jan 2013 00:34:29 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.131) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Sun, 6 Jan 2013 00:34:28 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 6 Jan 2013 16:34:25 +0800
Message-ID: <cover.1357354330.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/1] glib-2.0-native:add option march to BUILD_CFLAGS
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
X-List-Received-Date: Sun, 06 Jan 2013 08:49:37 -0000
Content-Type: text/plain

The following changes since commit 09359e6ec00901abfe49157f1f9730117b4d284b:

  freetype: update to 2.4.11 which includes fixes for CVE-2012-{5668, 5669, 5670} (2012-12-31 09:43:27 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/glib-2.0-native
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/glib-2.0-native

Hongxu Jia (1):
  glib-2.0-native:add option march to BUILD_CFLAGS

 meta/recipes-core/glib-2.0/glib-2.0_2.34.3.bb |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

-- 
1.7.10.4



