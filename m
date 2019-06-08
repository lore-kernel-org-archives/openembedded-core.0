Return-Path: <patchwork@patchwork.openembedded.org>
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id DC4317E577;
	Sat,  8 Jun 2019 04:09:54 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@patchwork.openembedded.org>
To: Andrii Bordunov via Openembedded-core
	<openembedded-core@lists.openembedded.org>
Cc: openembedded-core@lists.openembedded.org
Date: Sat, 08 Jun 2019 04:09:56 -0000
Message-ID: <20190608040956.2332.82832@do>
References: <20190606151357.21453-1-matthias.schoepfer@ithinx.io>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20190606151357.21453-1-matthias.schoepfer@ithinx.io>
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgZml4aW5nIHB5dGhvbjMgYnVpbGQgZm9yIG1pcHMgc29mdGZsb2F0IHRhcmdldHM=?=
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
X-List-Received-Date: Sat, 08 Jun 2019 04:09:55 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: fixing python3 build for mips softfloat targets
Revision: 1
URL   : https://patchwork.openembedded.org/series/18024/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Patch            fixing python3 build for mips softfloat targets
 Issue             Shortlog does not follow expected format [test_shortlog_format] 
  Suggested fix    Commit shortlog (first line of commit message) should follow the format "<target>: <summary>"

* Issue             A patch file has been added, but does not have a Signed-off-by tag [test_signed_off_by_presence] 
  Suggested fix    Sign off the added patch file (meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch)

* Issue             Added patch file is missing Upstream-Status in the header [test_upstream_status_presence_format] 
  Suggested fix    Add Upstream-Status: <Valid status> to the header of meta/recipes-devtools/python/python3/0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch
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


