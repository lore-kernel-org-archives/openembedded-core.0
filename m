Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web12.33837.1595235749878723231
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2020 02:02:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id E00EB60AC2;
	Mon, 20 Jul 2020 09:02:27 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgSGFuZGxlIE9GRCBsb2NrIGZsYWdzIChyZXYyKQ==?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Stefan Agner <stefan@agner.ch>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jul 2020 09:02:29 -0000
Message-ID: <20200720090229.2264.54478@do>
References: <20200720083743.12097-1-stefan@agner.ch>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20200720083743.12097-1-stefan@agner.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Handle OFD lock flags (rev2)
Revision: 2
URL   : https://patchwork.openembedded.org/series/15665/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             Series does not apply on top of target branch [test_series_merge_on_head] 
  Suggested fix    Rebase your series on top of targeted branch
  Targeted branch  master (currently at 532ae127c5)

* Patch            [v2] Handle OFD lock flags
 Issue             Shortlog does not follow expected format [test_shortlog_format] 
  Suggested fix    Commit shortlog (first line of commit message) should follow the format "<target>: <summary>"



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

