Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web12.7931.1591711317772839625
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2020 07:01:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id B7C2E60A5A;
	Tue,  9 Jun 2020 14:01:55 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgZ2xpYi1uZXR3b3JraW5nL2J0cmZzLXRvb2xzL2Rvc2ZzdG9vbHMvcGFydGVkL2JtYXAtdG9vbHMvbGlic291cC0yLjQ6IGFkZCBuYXRpdmVzZGsgc3VwcG9ydCAocmV2Mik=?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 09 Jun 2020 14:01:57 -0000
Message-ID: <20200609140157.20804.47982@do>
References: <20200609135210.11110-1-hongxu.jia@windriver.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20200609135210.11110-1-hongxu.jia@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: glib-networking/btrfs-tools/dosfstools/parted/bmap-tools/libsoup-2.4: add nativesdk support (rev2)
Revision: 2
URL   : https://patchwork.openembedded.org/series/24546/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Patch            [V2] glib-networking/btrfs-tools/dosfstools/parted/bmap-tools/libsoup-2.4: add nativesdk support
 Issue             Commit shortlog is too long [test_shortlog_length] 
  Suggested fix    Edit shortlog so that it is 90 characters or less (currently 91 characters)



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

