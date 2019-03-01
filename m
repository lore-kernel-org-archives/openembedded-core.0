Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0B07E7CD45
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Mar 2019 08:42:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x218gviY012614
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Mar 2019 00:42:57 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.435.0; Fri, 1 Mar 2019 00:42:57 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Mar 2019 16:52:13 +0800
Message-ID: <599bae1011260c105e5fbc27e4d51a0d8bed7d6b.1551430235.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1551430235.git.Qi.Chen@windriver.com>
References: <cover.1551430235.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] systemd-conf: add version info in recipe name
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
X-List-Received-Date: Fri, 01 Mar 2019 08:42:57 -0000
Content-Type: text/plain

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/systemd/{systemd-conf.bb => systemd-conf_241.bb} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-core/systemd/{systemd-conf.bb => systemd-conf_241.bb} (100%)

diff --git a/meta/recipes-core/systemd/systemd-conf.bb b/meta/recipes-core/systemd/systemd-conf_241.bb
similarity index 100%
rename from meta/recipes-core/systemd/systemd-conf.bb
rename to meta/recipes-core/systemd/systemd-conf_241.bb
-- 
1.9.1


