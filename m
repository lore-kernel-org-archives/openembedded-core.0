Return-Path: <patchwork@patchwork.openembedded.org>
Received: from do.openembedded.org (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 7293C79607;
	Fri, 24 Aug 2018 15:34:26 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@patchwork.openembedded.org>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Date: Fri, 24 Aug 2018 15:34:27 -0000
Message-ID: <20180824153427.13843.18337@do.openembedded.org>
References: <cover.1535118570.git.bruce.ashfield@windriver.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <cover.1535118570.git.bruce.ashfield@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3Iga2VybmVsOiBjb25zb2xpZGF0ZWQgcHVsbCByZXF1ZXN0IChyZXYyKQ==?=
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
X-List-Received-Date: Fri, 24 Aug 2018 15:34:26 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: kernel: consolidated pull request (rev2)
Revision: 2
URL   : https://patchwork.openembedded.org/series/11131/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             LIC_FILES_CHKSUM changed on target linux-yocto but there is no "License-Update" tag in commit message [test_lic_files_chksum_modified_not_mentioned] 
  Suggested fix    Include "License-Update: <description>" into the commit message with a brief description
  Current checksum file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7
  New checksum     file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814

* Issue             Patches not removed from tree [test_src_uri_left_files] 
  Suggested fix    Amend the patch containing the software patch file removal
  Patch            0001-Fix-btrfs-Remove-unnecessary-fs_info-parameter.patch



If you believe any of these test results are incorrect, please reply to the
mailing list (openembedded-core@lists.openembedded.org) raising your concerns.
Otherwise we would appreciate you correcting the issues and submitting a new
version of the patchset if applicable. Please ensure you add/increment the
version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
[PATCH v3] -> ...).

---
Guidelines:     https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe


