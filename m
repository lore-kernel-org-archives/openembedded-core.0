Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9FBB161FE4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 07:09:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s0F79ldk002199
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 23:09:47 -0800 (PST)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 14 Jan 2014 23:09:47 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 15 Jan 2014 15:09:28 +0800
Message-ID: <cover.1389769700.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH 0/1] sstate.bbclass: remove previous version's stamp
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
X-List-Received-Date: Wed, 15 Jan 2014 07:09:48 -0000
Content-Type: text/plain

The following changes since commit 12e5a3ee5ef9e6af5ab3dfcbace433888b0914aa:

  local.conf.sample.extended: update for the archiver (2014-01-14 18:01:58 +0800)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib rbt/clean_stamp
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=rbt/clean_stamp

Robert Yang (1):
  sstate.bbclass: remove previous version's stamp

 meta/classes/sstate.bbclass | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

-- 
1.8.3.1


