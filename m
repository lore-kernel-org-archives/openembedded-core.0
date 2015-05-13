Return-Path: <mario.goulart@gmail.com>
Received: from mail-qc0-f169.google.com (mail-qc0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id 8AE0673D16
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 May 2015 14:22:13 +0000 (UTC)
Received: by qcyk17 with SMTP id k17so23123669qcy.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 May 2015 07:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=TqWF14t46E5nx7HMwKFRWrHdGfVpOatXPOXVV/3Jw0w=;
	b=tBqA8i+5bH/Yu/K98tovod4D4uXSB9Fsn7ucYw12zF0JPCTDMAT55/9Xnukzn8wThk
	atFH1TFVwy0PpcwG9R1tAaUHsuQn3l0YqMS0+/WqI7JI2bCSLsXcXtlTUR8bEAVu60bq
	/h6wKtLi7LGC29hdQsxx8UvWMdedbjlTfCBTDcPirNSJJIwW2SNdfGmfSKDED/OdjRiE
	QWyKhCtrBEb4IA2ifZWLYqM2o27qXXWnSacMLIoi6uzFfHGd3SnuxnuBl/QWWA6K57uN
	PUoHM4d68Zshr18ZhPhDf6yvA+IPk8oPV0MJ+uJ58Bse7h0Xh3Kbi/IsdupAIq0/9Oxv
	yonw==
X-Received: by 10.140.237.68 with SMTP id i65mr28251393qhc.42.1431526933446;
	Wed, 13 May 2015 07:22:13 -0700 (PDT)
Received: from mario.lab.ossystems.com.br ([177.100.224.72])
	by mx.google.com with ESMTPSA id 20sm15641844qhf.14.2015.05.13.07.22.11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 May 2015 07:22:12 -0700 (PDT)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 May 2015 11:21:46 -0300
Message-Id: <1431526907-8336-1-git-send-email-mario@ossystems.com.br>
X-Mailer: git-send-email 1.7.10.4
Organization: O.S. Systems Software LTDA.
Cc: Mario Domenech Goulart <mario@ossystems.com.br>
Subject: [PATCH v2] README: add "Contributing" section
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
X-List-Received-Date: Wed, 13 May 2015 14:22:18 -0000

Tips on how to submit patches and links to source code and mailing
list.

Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
---
 README |   14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/README b/README
index 665c98f..521916c 100644
--- a/README
+++ b/README
@@ -13,3 +13,17 @@ which can be found at:
     http://yoctoproject.org/documentation
 
 
+Contributing
+------------
+
+Please refer to
+http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
+for guidelines on how to submit patches.
+
+Mailing list:
+
+    http://lists.openembedded.org/mailman/listinfo/openembedded-core
+
+Source code:
+
+    http://git.openembedded.org/openembedded-core/
-- 
1.7.10.4


