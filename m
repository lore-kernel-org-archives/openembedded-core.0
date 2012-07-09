Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SoFdJ-0005Y9-II
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 17:12:17 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q69F17XV001976
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Jul 2012 08:01:07 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 9 Jul 2012 08:01:06 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 9 Jul 2012 10:11:37 -0500
Message-ID: <cover.1341846614.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 0/1] Image/SDK multilib fixes [resend]
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
X-List-Received-Date: Mon, 09 Jul 2012 15:12:18 -0000
Content-Type: text/plain

This is a rebased/resend of the "multilib: Enable multilib remapping for
SDK generation fix"

There have been no changes other then a rebase or current origin/master.

--Mark

The following changes since commit 68ea7d827710ae7c5cf402887d4c12319038e064:

  package_rpm: Avoid duplicate package generation failures (2012-07-09 11:37:29 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib mhatle/sdk
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/sdk

Mark Hatle (1):
  multilib: Enable multilib remapping for SDK generation

 meta/classes/multilib.bbclass |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

-- 
1.7.3.4



