Return-Path: <patchwork@patchwork.openembedded.org>
Received: from do.openembedded.org (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 1D18F77FF6;
	Wed, 21 Jun 2017 07:01:25 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@patchwork.openembedded.org>
To: yin.thong.choong@intel.com
Date: Wed, 21 Jun 2017 07:01:26 -0000
Message-ID: <20170621070126.1043.6922@do.openembedded.org>
References: <1498002073-168422-1-git-send-email-yin.thong.choong@intel.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <1498002073-168422-1-git-send-email-yin.thong.choong@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3Igc2NyaXB0L3lvY3RvLWJzcDogRmFpbCB0byBhZGQga2VybmVsIGZlYXR1cmUgaW4gY3VzdG9tIGxpbnV4IGtlcm5lbA==?=
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
X-List-Received-Date: Wed, 21 Jun 2017 07:01:26 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: script/yocto-bsp: Fail to add kernel feature in custom linux kernel
Revision: 1
URL   : https://patchwork.openembedded.org/series/7393/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             Series does not apply on top of target branch [test_series_merge_on_head] 
  Suggested fix    Rebase your series on top of targeted branch
  Targeted branch  master (currently at 1d9a88f635)

* Issue             Series sent to the wrong mailing list or some patches from the series correspond to different mailing lists [test_target_mailing_list] 
  Suggested fix    Send the series again to the correct mailing list (ML)
  Suggested ML     poky@yoctoproject.org [http://git.yoctoproject.org/cgit/cgit.cgi/poky/]
  Patch's path:    scripts/lib/bsp/substrate/target/arch/common/recipes-kernel/linux/linux-yocto-custom.bb



If you believe any of these test results are incorrect, please reply to the
mailing list (openembedded-core@lists.openembedded.org) raising your concerns.
Otherwise we would appreciate you correcting the issues and submitting a new
version of the patchset if applicable. Please ensure you add/increment the
version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
[PATCH v3] -> ...).

---
Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe


