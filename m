Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 59685718FB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Nov 2014 07:50:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAO7oC4f014434
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Nov 2014 23:50:12 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sun, 23 Nov 2014 23:50:11 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Nov 2014 15:49:33 +0800
Message-ID: <e28574329b83d3b7e9d405469b477a2457ead572.1416815305.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1416815305.git.Chong.Lu@windriver.com>
References: <cover.1416815305.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] dbus-test: Upgrade to 1.8.10
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
X-List-Received-Date: Mon, 24 Nov 2014 07:50:12 -0000
Content-Type: text/plain

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-core/dbus/{dbus-test_1.8.2.bb => dbus-test_1.8.10.bb} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta/recipes-core/dbus/{dbus-test_1.8.2.bb => dbus-test_1.8.10.bb} (100%)

diff --git a/meta/recipes-core/dbus/dbus-test_1.8.2.bb b/meta/recipes-core/dbus/dbus-test_1.8.10.bb
similarity index 100%
rename from meta/recipes-core/dbus/dbus-test_1.8.2.bb
rename to meta/recipes-core/dbus/dbus-test_1.8.10.bb
-- 
1.9.1


