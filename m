Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <joe.slater@windriver.com>) id 1UGInb-0007Fh-HH
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Mar 2013 01:47:13 +0100
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2F0UOW7004098
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Mar 2013 17:30:24 -0700 (PDT)
Received: from ala-jslater-lx3.wrs.com (147.11.152.42) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Thu, 14 Mar 2013 17:30:23 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Mar 2013 17:30:21 -0700
Message-ID: <1363307422-24753-1-git-send-email-jslater@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
Subject: [PATCH 0/1] [v2] tzcode-native & tzdata: update to 2013b versions
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
X-List-Received-Date: Fri, 15 Mar 2013 00:47:25 -0000
Content-Type: text/plain

No content changes from previous 2013b patch.  Patch format shows
differences instead of delete/create

Joe Slater (1):
  tzcode-native & tzdata: update to 2013b versions

 ...code-native_2012j.bb => tzcode-native_2013b.bb} |   12 +++--
 .../tzdata/{tzdata_2012j.bb => tzdata_2013b.bb}    |   54 +++++++++++++-------
 2 files changed, 43 insertions(+), 23 deletions(-)
 rename meta/recipes-extended/tzcode/{tzcode-native_2012j.bb => tzcode-native_2013b.bb} (52%)
 rename meta/recipes-extended/tzdata/{tzdata_2012j.bb => tzdata_2013b.bb} (88%)

-- 
1.7.3.4



