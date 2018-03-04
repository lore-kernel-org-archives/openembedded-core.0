Return-Path: <patchwork@patchwork.openembedded.org>
Received: from do.openembedded.org (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id C1E1E78A86;
	Sun,  4 Mar 2018 21:34:23 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@patchwork.openembedded.org>
To: Matt Madison <matt@madison.systems>
Date: Sun, 04 Mar 2018 21:34:25 -0000
Message-ID: <20180304213425.15537.22917@do.openembedded.org>
References: <20180304210937.29727-1-matt@madison.systems>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20180304210937.29727-1-matt@madison.systems>
Cc: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgZ28xLjEwIHVwZGF0ZSBhbmQgbWlzYyBpbXByb3ZlbWVudHMgKHJldjUp?=
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
X-List-Received-Date: Sun, 04 Mar 2018 21:34:23 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: go1.10 update and misc improvements (rev5)
Revision: 5
URL   : https://patchwork.openembedded.org/series/11102/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             Patches not removed from tree [test_src_uri_left_files] 
  Suggested fix    Amend the patch containing the software patch file removal
  Patch            0002-cmd-go-fix-CC-and-CXX-environment-variable-construct.patch
  Patch            0001-make.bash-quote-CC_FOR_TARGET.patch
  Patch            0003-make.bash-better-separate-host-and-target-builds.patch
  Patch            0005-cmd-go-make-GOROOT-precious-by-default.patch
  Patch            0009-cmd-go-buildmode-pie-forces-external-linking-mode-on.patch
  Patch            0008-make.bash-add-GOHOSTxx-indirection-for-cross-canadia.patch
  Patch            0007-ld-add-soname-to-shareable-objects.patch
  Patch            0004-cmd-go-allow-GOTOOLDIR-to-be-overridden-in-the-envir.patch
  Patch            0006-make.bash-add-GOTOOLDIR_BOOTSTRAP-environment-variab.patch
  Patch            0010-make.bash-override-CC-when-building-dist-and-go_boot.patch



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


