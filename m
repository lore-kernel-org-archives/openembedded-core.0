Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2D5607CE81
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Mar 2019 08:31:43 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x278ViAh018365
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Mar 2019 00:31:44 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Thu, 7 Mar 2019 00:31:43 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Mar 2019 16:41:32 +0800
Message-ID: <cover.1551948039.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] metadata.py: return info after fallback methods
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
X-List-Received-Date: Thu, 07 Mar 2019 08:31:44 -0000
Content-Type: text/plain

*** BLURB HERE ***
The following changes since commit 525c5e516323ff584f65bed3320626b1d056260d:

  README.poky: Add pointers to key contributions wiki guides (2019-03-06 23:12:27 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/return-info
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/return-info

Chen Qi (1):
  metadata.py: return info after fallback methods

 meta/lib/oeqa/utils/metadata.py | 1 +
 1 file changed, 1 insertion(+)

-- 
1.9.1


