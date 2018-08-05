Return-Path: <patchwork@patchwork.openembedded.org>
Received: from do.openembedded.org (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 542BE78BEA;
	Sun,  5 Aug 2018 02:34:19 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@patchwork.openembedded.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Sun, 05 Aug 2018 02:34:20 -0000
Message-ID: <20180805023420.13843.25198@do.openembedded.org>
References: <cover.1533434674.git.raj.khem@gmail.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <cover.1533434674.git.raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgVXBkYXRlIHRvIGdsaWJjIDIuMjg=?=
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
X-List-Received-Date: Sun, 05 Aug 2018 02:34:19 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Update to glibc 2.28
Revision: 1
URL   : https://patchwork.openembedded.org/series/13386/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             Patches not removed from tree [test_src_uri_left_files] 
  Suggested fix    Amend the patch containing the software patch file removal
  Patch            0014-yes-within-the-path-sets-wrong-config-variables.patch
  Patch            0016-Remove-bash-dependency-for-nscd-init-script.patch
  Patch            0005-fsl-e500-e5500-e6500-603e-fsqrt-implementation.patch
  Patch            0020-eglibc-Resolve-__fpscr_values-on-SH4.patch
  Patch            0013-Add-unused-attribute.patch
  Patch            0015-timezone-re-written-tzselect-as-posix-sh.patch
  Patch            0017-eglibc-Cross-building-and-testing-instructions.patch
  Patch            0007-ppc-sqrt-Fix-undefined-reference-to-__sqrt_finite.patch
  Patch            0030-plural_c_no_preprocessor_lines.patch
  Patch            0009-Quote-from-bug-1443-which-explains-what-the-patch-do.patch
  Patch            0006-readlib-Add-OECORE_KNOWN_INTERPRETER_NAMES-to-known-.patch
  Patch            0019-eglibc-Clear-cache-lines-on-ppc8xx.patch
  Patch            0008-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
  Patch            0011-__ieee754_sqrt-f-are-now-inline-functions-and-call-o.patch
  Patch            0010-eglibc-run-libm-err-tab.pl-with-specific-dirs-in-S.patch
  Patch            0018-eglibc-Help-bootstrap-cross-toolchain.patch
  Patch            0012-sysdeps-gnu-configure.ac-handle-correctly-libc_cv_ro.patch



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


