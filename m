Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RcQPC-000767-Rw
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 00:44:34 +0100
Received: from localhost (c-76-115-40-64.hsd1.or.comcast.net [76.115.40.64])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 74CC52FE8C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Dec 2011 18:37:25 -0500 (EST)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 Dec 2011 15:37:27 -0800
Message-Id: <cover.1324251354.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 74CC52FE8C.9F5FE
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 0/1] mktemp: mark patch as upstreamed
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
X-List-Received-Date: Sun, 18 Dec 2011 23:44:35 -0000

Hello,

I submitted a parallel make patch upstream to the mktemp maintainer,
who has accepted it. This just updates our patch's Upstream-Status
field accordingly.

Scot


The following changes since commit 3e05acab1c119a3b2a4703ea8729cc768935d36e:

  license.bbclass: remove bashism (2011-12-16 16:50:39 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib sgarman/upstreamed
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/upstreamed

Scott Garman (1):
  mktemp: mark patch as upstreamed

 .../mktemp/files/fix-parallel-make.patch           |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

-- 
1.7.5.4



