Return-Path: <patchwork@patchwork.openembedded.org>
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 2F1817FA44;
	Mon, 20 Jan 2020 12:02:06 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@patchwork.openembedded.org>
To: Ross Burton <ross.burton@intel.com>
Date: Mon, 20 Jan 2020 12:02:07 -0000
Message-ID: <20200120120207.2274.27622@do>
References: <20200120115132.3618-1-ross.burton@intel.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20200120115132.3618-1-ross.burton@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgcHl0aG9uOiBhZGQgMi43LjE3IGZyb20gb2UtY29yZQ==?=
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
X-List-Received-Date: Mon, 20 Jan 2020 12:02:06 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: python: add 2.7.17 from oe-core
Revision: 1
URL   : https://patchwork.openembedded.org/series/22155/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             A patch file has been added, but does not have a Signed-off-by tag [test_signed_off_by_presence] 
  Suggested fix    Sign off the added patch file (recipes-devtools/python/python-native/10-distutils-fix-swig-parameter.patch)

* Issue             Upstream-Status is Inappropriate, but no reason was provided [test_upstream_status_presence_format] 
  Suggested fix    Include a brief reason why 0001-python-Resolve-intermediate-staging-issues.patch is inappropriate
  Current          Upstream-Status: Inappropriate
  Standard format  Upstream-Status: Inappropriate [reason]

* Issue             Errors in your Python code were encountered [test_pylint] 
  Suggested fix    Correct the lines introduced by your patch
  Output           Please, fix the listed issues:
                   recipes-devtools/python/python/create_manifest2.py does not exist



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


