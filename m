Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8FDBC738B3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Mar 2015 09:23:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t249NTKg002012
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Mar 2015 01:23:29 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 4 Mar 2015 01:23:28 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 4 Mar 2015 01:23:27 -0800
Message-ID: <cover.1425460972.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] bash 3.2.48: disable parallel build
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
X-List-Received-Date: Wed, 04 Mar 2015 09:23:29 -0000
Content-Type: text/plain

The following changes since commit 3c78468f12296abd02abce6eeac0f69bc7509958:

  build-appliance-image: Update to master head revision (2015-03-03 13:12:50 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/bash
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/bash

Robert Yang (1):
  bash 3.2.48: disable parallel build

 meta/recipes-extended/bash/bash_3.2.48.bb |    2 ++
 1 file changed, 2 insertions(+)

-- 
1.7.9.5


