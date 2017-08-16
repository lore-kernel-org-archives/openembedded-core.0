Return-Path: <patchwork@patchwork.openembedded.org>
Received: from do.openembedded.org (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 0AC8078355;
	Wed, 16 Aug 2017 15:32:43 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@patchwork.openembedded.org>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Wed, 16 Aug 2017 15:32:44 -0000
Message-ID: <20170816153244.2381.6153@do.openembedded.org>
References: <1502831992-47827-1-git-send-email-mark.hatle@windriver.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <1502831992-47827-1-git-send-email-mark.hatle@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgRml4IFJQTTQgcmVncmVzc2lvbnMgYmFzZWQgb24gUHlybw==?=
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
X-List-Received-Date: Wed, 16 Aug 2017 15:32:43 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix RPM4 regressions based on Pyro
Revision: 1
URL   : https://patchwork.openembedded.org/series/8245/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             Added patch file is missing Upstream-Status in the header [test_upstream_status_presence] 
  Suggested fix    Add Upstream-Status: <status> to the header of meta/recipes-devtools/rpm/files/0001-perl-disable-auto-reqs.patch (possible values: Pending, Submitted, Accepted, Backport, Denied, Inappropriate)

* Issue             Series does not apply on top of target branch [test_series_merge_on_head] 
  Suggested fix    Rebase your series on top of targeted branch
  Targeted branch  master (currently at 4d65421f38)



If you believe any of these test results are incorrect, please reply to the
mailing list (openembedded-core@lists.openembedded.org) raising your concerns.
Otherwise we would appreciate you correcting the issues and submitting a new
version of the patchset if applicable. Please ensure you add/increment the
version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
[PATCH v3] -> ...).

---
Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe


