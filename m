Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web11.1765.1592953348742203982
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2020 16:02:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id AF3FF60B2E;
	Tue, 23 Jun 2020 23:02:26 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgcHl0aG9uMy1zZXR1cHRvb2xzOiBwYXRjaCBlbnRyeXBvaW50cyBmb3IgZmFzdGVyIGluaXRpYWxpemF0aW9u?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Trevor Gamblin <trevor.gamblin@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 23 Jun 2020 23:02:28 -0000
Message-ID: <20200623230228.20810.63231@do>
References: <20200623225846.5534-1-trevor.gamblin@windriver.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20200623225846.5534-1-trevor.gamblin@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: python3-setuptools: patch entrypoints for faster initialization
Revision: 1
URL   : https://patchwork.openembedded.org/series/24809/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             Added patch file is missing Upstream-Status in the header [test_upstream_status_presence_format] 
  Suggested fix    Add Upstream-Status: <Valid status> to the header of meta/recipes-devtools/python/python3-setuptools/0001-ScriptWriter-create-more-efficient-usr-bin-wrappers-signoff-included.patch
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

