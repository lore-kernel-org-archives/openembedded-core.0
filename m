Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3BC6571B2F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 May 2017 09:29:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v499TJvU026574
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 May 2017 02:29:19 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.201) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Tue, 9 May 2017 02:29:18 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 May 2017 17:31:35 +0800
Message-ID: <cover.1494322236.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V2 0/1] cve-check.bbclass: make warning contain CVE IDs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 May 2017 09:29:19 -0000
Content-Type: text/plain

The following changes since commit 381897c64069ea43d595380a3ae913bcc79cf7e1:

  build-appliance-image: Update to master head revision (2017-05-01 08:56:47 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/cve-check-warning
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/cve-check-warning

Chen Qi (1):
  cve-check.bbclass: make warning contain CVE IDs

 meta/classes/cve-check.bbclass | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

-- 
1.9.1


