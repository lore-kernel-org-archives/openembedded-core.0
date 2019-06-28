Return-Path: <patchwork@patchwork.openembedded.org>
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 0CA457C86A;
	Fri, 28 Jun 2019 23:30:45 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@patchwork.openembedded.org>
To: Joseph Reynolds <jrey@linux.ibm.com>
Date: Fri, 28 Jun 2019 23:30:46 -0000
Message-ID: <20190628233046.2329.75867@do>
References: <5add2d28-a846-e555-b2a3-bae8835125b0@linux.ibm.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <5add2d28-a846-e555-b2a3-bae8835125b0@linux.ibm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgZHJvcGJlYXI6IG5ldyBmZWF0dXJlOiBkaXNhYmxlLXdlYWstY2lwaGVycyAocmV2Mik=?=
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
X-List-Received-Date: Fri, 28 Jun 2019 23:30:45 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: dropbear: new feature: disable-weak-ciphers (rev2)
Revision: 2
URL   : https://patchwork.openembedded.org/series/18278/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             Series cannot be parsed correctly due to malformed diff lines [test_mbox_format] 
  Suggested fix    Create the series again using git-format-patch and ensure it can be applied using git am
  Diff line        @@ -46,8 +47,9 @@ SBINCOMMANDS = "dropbear dropbearkey dropbearconvert"


* Issue             Series does not apply on top of target branch [test_series_merge_on_head] 
  Suggested fix    Rebase your series on top of targeted branch
  Targeted branch  master (currently at 148d54f91f)



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


