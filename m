Return-Path: <patchwork@patchwork.openembedded.org>
Received: from do.openembedded.org (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 2C4B477DCC;
	Fri,  7 Jul 2017 15:01:37 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@patchwork.openembedded.org>
To: Catalin Enache <catalin.enache@windriver.com>
Date: Fri, 07 Jul 2017 15:01:38 -0000
Message-ID: <20170707150138.2381.81304@do.openembedded.org>
References: <1499438123-10079-1-git-send-email-catalin.enache@windriver.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <1499438123-10079-1-git-send-email-catalin.enache@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgZ2xpYmM6IGZpeCBwdGhyZWFkX2NvbmRfYnJvYWRjYXN0IGlzc3VlIChhcm0pIChyZXYyKQ==?=
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
X-List-Received-Date: Fri, 07 Jul 2017 15:01:37 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: glibc: fix pthread_cond_broadcast issue (arm) (rev2)
Revision: 2
URL   : https://patchwork.openembedded.org/series/7626/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             Series cannot be parsed correctly due to malformed diff lines [test_mbox_format] 
  Suggested fix    Create the series again using git-format-patch and ensure it can be applied using git am
  Diff line         diff --git a/meta/recipes-core/glibc/glibc/0004-New-condvar-implementation-that-provides-stronger-or.patch b/meta/recipes-core/glibc/glibc/0004-New-condvar-implementation-that-provides-stronger-or.patch




If you believe any of these test results are incorrect, please reply to the
mailing list (openembedded-core@lists.openembedded.org) raising your concerns.
Otherwise we would appreciate you correcting the issues and submitting a new
version of the patchset if applicable. Please ensure you add/increment the
version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
[PATCH v3] -> ...).

---
Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe


