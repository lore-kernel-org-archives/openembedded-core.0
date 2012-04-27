Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1SNhpw-0000nC-R4
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Apr 2012 11:51:37 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q3R9fvZf019437
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 27 Apr 2012 02:41:57 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.1.255.0; Fri, 27 Apr 2012 02:41:56 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <saul.wold@intel.com>, <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Apr 2012 17:41:55 +0800
Message-ID: <cover.1335519550.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.164]
Subject: [PATCH 0/1] Update alsa-tools to 1.0.25
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Apr 2012 09:51:37 -0000
Content-Type: text/plain

Hi Saul,

This update alsa-tools to 1.0.25.

Regards,

The following changes since commit 492a58cabdc053b2312712681dbcffa8270d4ea4:

  self-hosted-image: Update poky revision to point at the 1.2 release branch (2012-04-24 10:21:11 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/update-alsa-tools
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/update-alsa-tools

Kang Kai (1):
  alsa-tools: update to 1.0.25

 .../autotools.patch                                |    0
 ...alsa-tools_1.0.24.1.bb => alsa-tools_1.0.25.bb} |   10 ++++++----
 2 files changed, 6 insertions(+), 4 deletions(-)
 rename meta/recipes-multimedia/alsa/{alsa-tools-1.0.24.1 => alsa-tools-1.0.25}/autotools.patch (100%)
 rename meta/recipes-multimedia/alsa/{alsa-tools_1.0.24.1.bb => alsa-tools_1.0.25.bb} (73%)

-- 
1.7.5.4



