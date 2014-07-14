Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 01C9F6FE5C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 08:33:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6E8XgL5010910
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 01:33:42 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Mon, 14 Jul 2014 01:33:41 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 14 Jul 2014 16:31:49 +0800
Message-ID: <cover.1405326490.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1][V2] classes/insane: Show QA check name
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
X-List-Received-Date: Mon, 14 Jul 2014 08:33:48 -0000
Content-Type: text/plain

Change since V1:
change output format.

The following changes since commit a5531a2b8983318b99c119a87b78a92cf84160b8:

  bitbake: fetch2/svn: Add transportuser parameter (2014-07-04 09:28:36 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/qacheck
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/qacheck

Chong Lu (1):
  classes/insane: Show QA check name

 meta/classes/insane.bbclass | 66 ++++++++++++++++++++++-----------------------
 1 file changed, 32 insertions(+), 34 deletions(-)

-- 
1.9.1


