Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1UFhjI-0002vd-CF
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Mar 2013 10:12:23 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2D8tVgO022937
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Mar 2013 01:55:31 -0700 (PDT)
Received: from pek-usp-3.wrs.com (128.224.163.124) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 13 Mar 2013 01:55:30 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Mar 2013 16:58:20 +0800
Message-ID: <cover.1363154328.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH 0/1] cairo: add libpng to EXTRA_libcairo_la_DEPENDENCIES
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
X-List-Received-Date: Wed, 13 Mar 2013 09:12:26 -0000
Content-Type: text/plain

The following changes since commit 4da406cd50cf02a63ed76810a670aba1eb561c79:

  gst-plugins-gl: allow empty packages (2013-03-12 18:33:30 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib robert/cairo
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/cairo

Robert Yang (1):
  cairo: add libpng to EXTRA_libcairo_la_DEPENDENCIES

 meta/recipes-graphics/cairo/cairo_1.12.14.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)

-- 
1.7.11.2



