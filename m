Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id D542F6FF80
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2016 10:34:47 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u2IAYmtE004784 for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2016 05:34:48 -0500
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016031805344881-1540049 ;
	Fri, 18 Mar 2016 05:34:48 -0500 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Mar 2016 12:34:19 +0200
Message-Id: <1458297259-25664-1-git-send-email-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.7.3
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 03/18/2016 05:34:49 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 03/18/2016 05:34:49 AM,
	Serialize complete at 03/18/2016 05:34:49 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-03-18_06:, , signatures=0
Subject: [PATCH] ParaTypeFFL-1.3: Add license file
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
X-List-Received-Date: Fri, 18 Mar 2016 10:34:51 -0000

The ParaType Free Font License is used by various fonts, out of which a
recipe will be added to meta-openembedded for ttf-pt-sans.

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta/files/common-licenses/ParaTypeFFL-1.3 | 44 ++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 meta/files/common-licenses/ParaTypeFFL-1.3

diff --git a/meta/files/common-licenses/ParaTypeFFL-1.3 b/meta/files/common-licenses/ParaTypeFFL-1.3
new file mode 100644
index 0000000..8357965
--- /dev/null
+++ b/meta/files/common-licenses/ParaTypeFFL-1.3
@@ -0,0 +1,44 @@
+ParaType Free Font Licensing Agreement
+
+Copyright (c) 2009, ParaType Ltd. All Rights Reserved.
+
+LICENSING AGREEMENT
+for the fonts with Original Name: PT Sans, PT Serif, PT Mono
+Version 1.3 - January 20, 2012
+
+GRANT OF LICENSE
+ParaType Ltd grants you the right to use, copy, modify the fonts and
+distribute modified and unmodified copies of the fonts by any means,
+including placing on Web servers for free downloading, embedding in
+documents and Web pages, bundling with commercial and non commercial
+products, if it does not conflict with the conditions listed below:
+
+- You may bundle the fonts with commercial software, but you may not
+sell the fonts by themselves. They are free.
+
+- You may distribute the fonts in modified or unmodified versions only
+together with this Licensing Agreement and with above copyright notice.
+You have no right to modify the text of Licensing Agreement. It can be
+placed in a separate text file or inserted into the font file, but it
+must be easily viewed by users.
+
+- You may not distribute modified version of the font under the Original
+name or a combination of Original name with any other words without
+explicit written permission from ParaType.
+
+TERMINATION & TERRITORY
+This license has no limits on time and territory, but it becomes null
+and void if any of the above conditions are not met.
+
+DISCLAIMER
+THE FONT SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OF
+MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT
+OF COPYRIGHT, PATENT, TRADEMARK, OR OTHER RIGHT. IN NO EVENT SHALL
+PARATYPE BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, INCLUDING
+ANY GENERAL, SPECIAL, INDIRECT, INCIDENTAL, OR CONSEQUENTIAL DAMAGES,
+WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT
+OF THE USE OR INABILITY TO USE THE FONT SOFTWARE OR FROM OTHER DEALINGS
+IN THE FONT SOFTWARE.
+
+ParaType Ltd
-- 
2.7.3


