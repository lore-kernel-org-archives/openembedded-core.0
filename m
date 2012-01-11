Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1Rl3Pj-0005AC-EM
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Jan 2012 20:00:47 +0100
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(yow-bashfiel-d3.ottawa.windriver.com [128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q0BIqk2j020538;
	Wed, 11 Jan 2012 10:52:48 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 11 Jan 2012 13:52:20 -0500
Message-Id: <3b76565dc7424b1edc12f1fae80c8d68f805416e.1326307011.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1326307011.git.bruce.ashfield@windriver.com>
References: <cover.1326307011.git.bruce.ashfield@windriver.com>
In-Reply-To: <cover.1326307011.git.bruce.ashfield@windriver.com>
References: <cover.1326307011.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 2/5] qemuppc: add pointercal file
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Jan 2012 19:00:47 -0000

From: Liming Wang <liming.wang@windriver.com>

This file is for tslib.

Signed-off-by: Liming Wang <liming.wang@windriver.com>
---
 .../pointercal/files/qemuppc/pointercal            |  Bin 0 -> 36 bytes
 1 files changed, 0 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-bsp/pointercal/files/qemuppc/pointercal

diff --git a/meta/recipes-bsp/pointercal/files/qemuppc/pointercal b/meta/recipes-bsp/pointercal/files/qemuppc/pointercal
new file mode 100644
index 0000000000000000000000000000000000000000..c2d6e37bf0c0d956ba17ba9955613c4cee5a147a
GIT binary patch
literal 36
mcmXpsFt#*Q&;=n=3lPgl!O+0i%uK=9!qiZ~%+%D_i~#_8+XjmO

literal 0
HcmV?d00001

-- 
1.7.4.1



