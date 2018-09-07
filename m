Return-Path: <Lu.Jiang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 075D7797A6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Sep 2018 03:34:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w873Y5jp014185
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 6 Sep 2018 20:34:21 -0700
Received: from pek-ljiang0-d1.wrs.com (128.224.162.214) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Thu, 6 Sep 2018 20:34:15 -0700
From: Jiang Lu <lu.jiang@windriver.com>
To: <lu.jiang@windriver.com>, <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Sep 2018 11:32:10 +0800
Message-ID: <1536291131-24332-1-git-send-email-lu.jiang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: trini@konsulko.com
Subject: [PATCH 0/1] wic:mkefidisk:add use-uuid for all partitions
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
X-List-Received-Date: Fri, 07 Sep 2018 03:34:47 -0000
Content-Type: text/plain


Hi all, 

This patch adds use-uuid for all partitions on mkefidisk.wks.

Thanks
Jiang Lu

