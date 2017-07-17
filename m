Return-Path: <patchwork@patchwork.openembedded.org>
Received: from do.openembedded.org (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id DB9D76025F;
	Mon, 17 Jul 2017 22:01:14 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@patchwork.openembedded.org>
To: =?utf-8?b?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Date: Mon, 17 Jul 2017 22:01:16 -0000
Message-ID: <20170717220116.2381.17071@do.openembedded.org>
References: <cover.1500327589.git.anibal.limon@linux.intel.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <cover.1500327589.git.anibal.limon@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3Igb2VxYSBjb3JlIGFuZCBvZS1zZWxmdGVzdCB0aHJlYWRlZCBlbmFibGVtZW50IChyZXYzKQ==?=
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
X-List-Received-Date: Mon, 17 Jul 2017 22:01:15 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: oeqa core and oe-selftest threaded enablement (rev3)
Revision: 3
URL   : https://patchwork.openembedded.org/series/7694/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Patch            [v3, 18/30] oeqa/selftest/cases: Use wrapper methods from OESelfTestCase class and enable threaded runs
 Issue             Commit shortlog is too long [test_shortlog_length] 
  Suggested fix    Edit shortlog so that it is 90 characters or less (currently 91 characters)

* Issue             Series does not apply on top of target branch [test_series_merge_on_head] 
  Suggested fix    Rebase your series on top of targeted branch
  Targeted branch  master (currently at ef68005a8c)

* Issue             Series sent to the wrong mailing list or some patches from the series correspond to different mailing lists [test_target_mailing_list] 
  Suggested fix    Send the series again to the correct mailing list (ML)
  Suggested ML     poky@yoctoproject.org [http://git.yoctoproject.org/cgit/cgit.cgi/poky/]
  Patch's path:    meta-yocto-bsp/lib/oeqa/selftest/cases/systemd_boot.py



If you believe any of these test results are incorrect, please reply to the
mailing list (openembedded-core@lists.openembedded.org) raising your concerns.
Otherwise we would appreciate you correcting the issues and submitting a new
version of the patchset if applicable. Please ensure you add/increment the
version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
[PATCH v3] -> ...).

---
Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe


