Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SLMRI-0004oa-R0
	for openembedded-core@lists.openembedded.org;
	Sat, 21 Apr 2012 00:36:28 +0200
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id CD4DF2FF40
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Apr 2012 18:26:53 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Apr 2012 15:27:02 -0700
Message-Id: <cover.1334960759.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: CD4DF2FF40.67674
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 0/1] distro tracking manual checks
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
X-List-Received-Date: Fri, 20 Apr 2012 22:36:29 -0000

You know the drill - distro tracking updates for recipes that require
manual checking.

Scott

The following changes since commit 00256125873ff6f1630743a712e882e5f473a9d2:

  self-hosted-image: Update poky revision to point at the 1.2 release branch (2012-04-18 15:59:20 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib sgarman/manual-checks-oe
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/manual-checks-oe

Scott Garman (1):
  distro_tracking: manual check updates

 .../conf/distro/include/distro_tracking_fields.inc |   24 ++++++++++----------
 1 files changed, 12 insertions(+), 12 deletions(-)

-- 
1.7.5.4



