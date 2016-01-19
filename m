Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 33FCD6FFCE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 09:36:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0J9a5Gj012838
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 01:36:05 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 19 Jan 2016 01:36:04 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Jan 2016 01:36:03 -0800
Message-ID: <cover.1453196137.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] insane.bbclass: ignore ipkg/dpkg's CONTROL dir
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
X-List-Received-Date: Tue, 19 Jan 2016 09:36:05 -0000
Content-Type: text/plain

The following changes since commit aafe22fb5f2f58e1e7206a34f410e9cae0d3cfe3:

  e2fsprogs: fix PV (2016-01-19 08:53:02 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/ipk
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/ipk

Robert Yang (1):
  insane.bbclass: ignore ipkg/dpkg's CONTROL dir

 meta/classes/insane.bbclass |    4 ++++
 1 file changed, 4 insertions(+)

-- 
1.7.9.5


