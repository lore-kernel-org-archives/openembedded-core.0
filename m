Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web11.2009.1592677941605372076
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jun 2020 11:32:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 7F6A660B1D;
	Sat, 20 Jun 2020 18:32:19 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgYm9vc3Q6IEFkZCB1cHN0cmVhbSBwYXRjaCB0byBmaXggYnVpbGQgb24gZGVwZW5kaW5nIHByb2plY3Rz?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: =?utf-8?q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Sat, 20 Jun 2020 18:32:21 -0000
Message-ID: <20200620183221.20810.70225@do>
References: <20200620180013.4020192-1-schnitzeltony@gmail.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20200620180013.4020192-1-schnitzeltony@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: boost: Add upstream patch to fix build on depending projects
Revision: 1
URL   : https://patchwork.openembedded.org/series/24764/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             Upstream-Status is in incorrect format [test_upstream_status_presence_format] 
  Suggested fix    Fix Upstream-Status format in 0001-Make-index-detail-rtree-visitors-insert-base-class-p.patch
  Current          Upstream-Status: Applied[https://github.com/boostorg/geometry/commit/aafbceccc76dccb75963dd4f596fd1f10ee34b03]
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

