Return-Path: <B40290@freescale.com>
Received: from co1outboundpool.messaging.microsoft.com
	(co1ehsobe004.messaging.microsoft.com [216.32.180.187])
	by mail.openembedded.org (Postfix) with ESMTP id BDA9D6A59E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2013 07:47:21 +0000 (UTC)
Received: from mail199-co1-R.bigfish.com (10.243.78.251) by
	CO1EHSOBE032.bigfish.com (10.243.66.97) with Microsoft SMTP Server id
	14.1.225.22; Tue, 9 Jul 2013 07:47:22 +0000
Received: from mail199-co1 (localhost [127.0.0.1])	by
	mail199-co1-R.bigfish.com (Postfix) with ESMTP id 054773801C4	for
	<openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2013 07:47:22 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz8275bhz2dh2a8h668h839he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1155h)
Received: from mail199-co1 (localhost.localdomain [127.0.0.1]) by mail199-co1
	(MessageSwitch) id 1373356040470277_22157;
	Tue,  9 Jul 2013 07:47:20 +0000 (UTC)
Received: from CO1EHSMHS014.bigfish.com (unknown [10.243.78.242])	by
	mail199-co1.bigfish.com (Postfix) with ESMTP id 64B0AD80059	for
	<openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2013 07:47:20 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO1EHSMHS014.bigfish.com
	(10.243.66.24) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Tue, 9 Jul 2013 07:47:20 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.3.136.1; Tue, 9 Jul 2013 07:49:29 +0000
Received: from sbuilder136.ap.freescale.net (sun.ap.freescale.net
	[10.192.208.136])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id r697l1wF012320;	Tue, 9 Jul 2013 00:47:17 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Jul 2013 15:46:43 +0800
Message-ID: <1373356003-20356-1-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: [PATCH] common-licenses: Adding netperf
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
X-List-Received-Date: Tue, 09 Jul 2013 07:47:22 -0000
Content-Type: text/plain

       *netperf requires it's own specific license when
       add meta-openembedded layer

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta/files/common-licenses/netperf |   43 ++++++++++++++++++++++++++++++++++++
 1 files changed, 43 insertions(+), 0 deletions(-)
 create mode 100644 meta/files/common-licenses/netperf

diff --git a/meta/files/common-licenses/netperf b/meta/files/common-licenses/netperf
new file mode 100644
index 0000000..3f3ceb2
--- /dev/null
+++ b/meta/files/common-licenses/netperf
@@ -0,0 +1,43 @@
+
+ 
+              Copyright (C) 1993 Hewlett-Packard Company
+                         ALL RIGHTS RESERVED.
+ 
+  The enclosed software and documentation includes copyrighted works
+  of Hewlett-Packard Co. For as long as you comply with the following
+  limitations, you are hereby authorized to (i) use, reproduce, and
+  modify the software and documentation, and to (ii) distribute the
+  software and documentation, including modifications, for
+  non-commercial purposes only.
+      
+  1.  The enclosed software and documentation is made available at no
+      charge in order to advance the general development of
+      high-performance networking products.
+ 
+  2.  You may not delete any copyright notices contained in the
+      software or documentation. All hard copies, and copies in
+      source code or object code form, of the software or
+      documentation (including modifications) must contain at least
+      one of the copyright notices.
+ 
+  3.  The enclosed software and documentation has not been subjected
+      to testing and quality control and is not a Hewlett-Packard Co.
+      product. At a future time, Hewlett-Packard Co. may or may not
+      offer a version of the software and documentation as a product.
+  
+  4.  THE SOFTWARE AND DOCUMENTATION IS PROVIDED "AS IS".
+      HEWLETT-PACKARD COMPANY DOES NOT WARRANT THAT THE USE,
+      REPRODUCTION, MODIFICATION OR DISTRIBUTION OF THE SOFTWARE OR
+      DOCUMENTATION WILL NOT INFRINGE A THIRD PARTY'S INTELLECTUAL
+      PROPERTY RIGHTS. HP DOES NOT WARRANT THAT THE SOFTWARE OR
+      DOCUMENTATION IS ERROR FREE. HP DISCLAIMS ALL WARRANTIES,
+      EXPRESS AND IMPLIED, WITH REGARD TO THE SOFTWARE AND THE
+      DOCUMENTATION. HP SPECIFICALLY DISCLAIMS ALL WARRANTIES OF
+      MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
+  
+  5.  HEWLETT-PACKARD COMPANY WILL NOT IN ANY EVENT BE LIABLE FOR ANY
+      DIRECT, INDIRECT, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES
+      (INCLUDING LOST PROFITS) RELATED TO ANY USE, REPRODUCTION,
+      MODIFICATION, OR DISTRIBUTION OF THE SOFTWARE OR DOCUMENTATION.
+ 
+
-- 
1.7.5.4



