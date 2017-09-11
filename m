Return-Path: <patchwork@patchwork.openembedded.org>
Received: from do.openembedded.org (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id A75E972F42;
	Mon, 11 Sep 2017 13:00:33 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@patchwork.openembedded.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Mon, 11 Sep 2017 13:00:35 -0000
Message-ID: <20170911130035.2784.38128@do.openembedded.org>
References: <20170911124558.2863-1-otavio@ossystems.com.br>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20170911124558.2863-1-otavio@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgUmV2YW1wIHRoZSBHbyBzdXBwb3J0IChyZXY2KQ==?=
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
X-List-Received-Date: Mon, 11 Sep 2017 13:00:33 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Revamp the Go support (rev6)
Revision: 6
URL   : https://patchwork.openembedded.org/series/8697/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             Added patch file is missing Upstream-Status in the header [test_upstream_status_presence] 
  Suggested fix    Add Upstream-Status: <status> to the header of meta/recipes-devtools/go/go-1.8/make-goroot-precious.patch (possible values: Pending, Submitted, Accepted, Backport, Denied, Inappropriate)

* Issue             A patch file has been added, but does not have a Signed-off-by tag [test_signed_off_by_presence] 
  Suggested fix    Sign off the added patch file (meta/recipes-devtools/go/go-1.8/set-gotooldir-during-bootstrap.patch)



If you believe any of these test results are incorrect, please reply to the
mailing list (openembedded-core@lists.openembedded.org) raising your concerns.
Otherwise we would appreciate you correcting the issues and submitting a new
version of the patchset if applicable. Please ensure you add/increment the
version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
[PATCH v3] -> ...).

---
Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe


