Return-Path: <patchwork@patchwork.openembedded.org>
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id D50CF7E265;
	Fri, 25 Oct 2019 22:02:14 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@patchwork.openembedded.org>
To: shuagr97@gmail.com
Date: Fri, 25 Oct 2019 22:02:16 -0000
Message-ID: <20191025220216.2331.2682@do>
References: <1572039126-63536-1-git-send-email-shuagr@microsoft.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <1572039126-63536-1-git-send-email-shuagr@microsoft.com>
Cc: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgbGliZ2NyeXB0OiBDVkUtMjAxOS0xMjkwNCBmaXg=?=
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
X-List-Received-Date: Fri, 25 Oct 2019 22:02:15 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: libgcrypt: CVE-2019-12904 fix
Revision: 1
URL   : https://patchwork.openembedded.org/series/20686/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Patch            [thud,v2] libgcrypt: CVE-2019-12904 fix
 Issue             Patch is missing Signed-off-by [test_signed_off_by_presence] 
  Suggested fix    Sign off the patch (either manually or with "git commit --amend -s")

* Patch            [thud,v2] libgcrypt: CVE-2019-12904 fix
 Issue             Missing or incorrectly formatted CVE tag in included patch file [test_cve_tag_format] 
  Suggested fix    Correct or include the CVE tag on cve patch with format: "CVE: CVE-YYYY-XXXX"

* Issue             Added patch file is missing Upstream-Status in the header [test_upstream_status_presence_format] 
  Suggested fix    Add Upstream-Status: <Valid status> to the header of meta/recipes-support/libgcrypt/files/CVE-2019-12904.patch
  Standard format  Upstream-Status: <Valid status>
  Valid status     Pending, Accepted, Backport, Denied, Inappropriate [reason], Submitted [where]



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


