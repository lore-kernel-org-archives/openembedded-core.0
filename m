Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joe.slater@windriver.com>) id 1UI17H-0003gG-En
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Mar 2013 19:18:36 +0100
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2JI1dq7002179
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2013 11:01:39 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 19 Mar 2013 11:01:40 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Mar 2013 11:01:38 -0700
Message-ID: <1363716099-21136-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH [v4] 0/1] tzcode & tzdata: update to 2013b versions
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
X-List-Received-Date: Tue, 19 Mar 2013 18:19:09 -0000
Content-Type: text/plain

Now with PR-b-gone.

Joe Slater (1):
  tzcode & tzdata:  update to 2013b versions

 ...code-native_2012j.bb => tzcode-native_2013b.bb} |   14 ++++++++------
 .../tzdata/{tzdata_2012j.bb => tzdata_2013b.bb}    |    5 ++---
 2 files changed, 10 insertions(+), 9 deletions(-)
 rename meta/recipes-extended/tzcode/{tzcode-native_2012j.bb => tzcode-native_2013b.bb} (51%)
 rename meta/recipes-extended/tzdata/{tzdata_2012j.bb => tzdata_2013b.bb} (98%)

-- 
1.7.3.4



