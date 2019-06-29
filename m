Return-Path: <patchwork@patchwork.openembedded.org>
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id B7BCD7E9EC;
	Sat, 29 Jun 2019 19:00:51 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@patchwork.openembedded.org>
To: anatol.oe@belski.net
Date: Sat, 29 Jun 2019 19:00:53 -0000
Message-ID: <20190629190053.2331.50462@do>
References: <20190629185802.98456-1-anatol.oe@belski.net>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20190629185802.98456-1-anatol.oe@belski.net>
Cc: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgYnppcDI6IEZpeCBDVkUtMjAxOS0xMjkwMCAocmV2Mik=?=
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
X-List-Received-Date: Sat, 29 Jun 2019 19:00:52 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: bzip2: Fix CVE-2019-12900 (rev2)
Revision: 2
URL   : https://patchwork.openembedded.org/series/18434/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             Series does not apply on top of target branch [test_series_merge_on_head] 
  Suggested fix    Rebase your series on top of targeted branch
  Targeted branch  master (currently at 148d54f91f)

* Patch            bzip2: Fix CVE-2019-12900
 Issue             Missing or incorrectly formatted CVE tag in included patch file [test_cve_tag_format] 
  Suggested fix    Correct or include the CVE tag on cve patch with format: "CVE: CVE-YYYY-XXXX"

* Issue             A patch file has been added, but does not have a Signed-off-by tag [test_signed_off_by_presence] 
  Suggested fix    Sign off the added patch file (meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch)

* Issue             Added patch file is missing Upstream-Status in the header [test_upstream_status_presence_format] 
  Suggested fix    Add Upstream-Status: <Valid status> to the header of meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch
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


