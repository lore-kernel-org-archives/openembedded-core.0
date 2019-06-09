Return-Path: <patchwork@patchwork.openembedded.org>
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 387D47C79F;
	Sun,  9 Jun 2019 13:00:45 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@patchwork.openembedded.org>
To: Adrian Freihofer <adrian.freihofer@siemens.com>
Date: Sun, 09 Jun 2019 13:00:46 -0000
Message-ID: <20190609130046.2329.24721@do>
References: <20190609120342.5475-1-adrian.freihofer@siemens.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20190609120342.5475-1-adrian.freihofer@siemens.com>
Cc: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgcnVucWVtdTogc3VwcG9ydCBub24tYm9vdGFibGUgd2ljIGltYWdlcw==?=
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
X-List-Received-Date: Sun, 09 Jun 2019 13:00:45 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: runqemu: support non-bootable wic images
Revision: 1
URL   : https://patchwork.openembedded.org/series/18057/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Patch            [meta-oe,v4,1/3] qemurunner: fix undefined variable
 Issue             Series sent to the wrong mailing list [test_target_mailing_list] 
  Suggested fix    Check the project's README (meta-oe,v4,1/3) and send the patch to the indicated list

* Issue             Series does not apply on top of target branch [test_series_merge_on_head] 
  Suggested fix    Rebase your series on top of targeted branch
  Targeted branch  master (currently at 00fa839136)

* Patch            [meta-oe,v4,1/3] qemurunner: fix undefined variable
 Issue             Patch is missing Signed-off-by [test_signed_off_by_presence] 
  Suggested fix    Sign off the patch (either manually or with "git commit --amend -s")



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


