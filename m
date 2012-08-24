Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1T4zfF-0004RA-E7
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Aug 2012 21:35:29 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7OJNKkn018972
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Aug 2012 12:23:20 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.309.2;
	Fri, 24 Aug 2012 12:23:20 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Aug 2012 14:23:41 -0500
Message-ID: <cover.1345836133.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 0/1] Add unique identifier to screen calls
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
X-List-Received-Date: Fri, 24 Aug 2012 19:35:29 -0000
Content-Type: text/plain

The following changes since commit 968cfc0b630fb409430a46b1512d6bf0de225ad1:

  build-appliance-image: Add vmx* files and build zip file (2012-08-24 17:32:34 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib mhatle/devshell
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mhatle/devshell

Jason Wessel (1):
  terminal.py: use unique ids for screen sessions

 meta/lib/oe/terminal.py |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

-- 
1.7.3.4



