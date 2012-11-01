Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xin.Ouyang@windriver.com>) id 1TTqjt-0007hx-0U
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Nov 2012 10:07:01 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qA18rNE6023027
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 1 Nov 2012 01:53:23 -0700 (PDT)
Received: from Xouyang-Ubuntu.corp.ad.wrs.com (128.224.162.239) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Thu, 1 Nov 2012 01:53:21 -0700
From: Xin Ouyang <Xin.Ouyang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 1 Nov 2012 16:53:09 +0800
Message-ID: <cover.1351759577.git.Xin.Ouyang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/1] glib-2.0: inherit pythonnative
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
X-List-Received-Date: Thu, 01 Nov 2012 09:07:01 -0000
Content-Type: text/plain

The following changes since commit e9e3285e1397cfd2d34f4eb7b5aa59311eea861d:

  openssl: Use ${CFLAGS} not ${FULL_OPTIMIZATION} (2012-10-30 11:06:38 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib xouyang/2843
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xouyang/2843

Xin Ouyang (1):
  glib-2.0: inherit pythonnative

 meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
1.7.10.4



