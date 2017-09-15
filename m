Return-Path: <patchwork@patchwork.openembedded.org>
Received: from do.openembedded.org (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 42F6078621;
	Fri, 15 Sep 2017 12:30:29 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@patchwork.openembedded.org>
To: Jussi Laako <jussi.laako@linux.intel.com>
Date: Fri, 15 Sep 2017 12:30:31 -0000
Message-ID: <20170915123031.2785.50774@do.openembedded.org>
References: <20170915120300.35572-1-jussi.laako@linux.intel.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20170915120300.35572-1-jussi.laako@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgIlttZXRhLW9lLHYzXSBsaWJnY3J5cHQ6IHVwZGF0ZS4uLiIgYW5kIDEgbW9yZQ==?=
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
X-List-Received-Date: Fri, 15 Sep 2017 12:30:29 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: "[meta-oe,v3] libgcrypt: update..." and 1 more
Revision: 1
URL   : https://patchwork.openembedded.org/series/8931/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             Added patch file is missing Upstream-Status in the header [test_upstream_status_presence] 
  Suggested fix    Add Upstream-Status: <status> to the header of meta/recipes-support/libgcrypt/files/libgcrypt-config-wrapper.patch (possible values: Pending, Submitted, Accepted, Backport, Denied, Inappropriate)

* Issue             A patch file has been added, but does not have a Signed-off-by tag [test_signed_off_by_presence] 
  Suggested fix    Sign off the added patch file (meta/recipes-support/libgcrypt/files/libgcrypt-config-wrapper.patch)



If you believe any of these test results are incorrect, please reply to the
mailing list (openembedded-core@lists.openembedded.org) raising your concerns.
Otherwise we would appreciate you correcting the issues and submitting a new
version of the patchset if applicable. Please ensure you add/increment the
version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
[PATCH v3] -> ...).

---
Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe


