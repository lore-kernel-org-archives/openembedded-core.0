Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SAetT-0006GP-Fk
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 11:05:19 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q2M9uNjR020372
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2012 02:56:23 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Thu, 22 Mar 2012 02:56:24 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Mar 2012 17:55:33 +0800
Message-ID: <cover.1332409894.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH 0/1] insane.bbclass: maybe no log.do_compile or log.do_install
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
X-List-Received-Date: Thu, 22 Mar 2012 10:05:19 -0000
Content-Type: text/plain

The following changes since commit 047ce547edd61b0d3b15c22b3492f7595ce2bc66:

  xserver-kdrive: Fix packaging warnings (2012-03-21 23:17:32 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib robert/insane
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/insane

Robert Yang (1):
  insane.bbclass: maybe no log.do_compile or log.do_install

 meta/classes/insane.bbclass |   19 ++++++++++---------
 1 files changed, 10 insertions(+), 9 deletions(-)



