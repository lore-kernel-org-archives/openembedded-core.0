Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web12.5486.1588597367479612123
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 06:02:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 1CE9B60C6B;
	Mon,  4 May 2020 13:02:45 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgbGliL2JzNC90ZXN0aW5nLnB5OiBmaXggYnM0IHRlc3Rpbmc=?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Frazer Leslie Clews <frazer.clews@codethink.co.uk>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 04 May 2020 13:02:46 -0000
Message-ID: <20200504130246.2275.73024@do>
References: <20200504123217.150728-1-frazer.clews@codethink.co.uk>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20200504123217.150728-1-frazer.clews@codethink.co.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lib/bs4/testing.py: fix bs4 testing
Revision: 1
URL   : https://patchwork.openembedded.org/series/23933/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             Series does not apply on top of target branch [test_series_merge_on_head] 
  Suggested fix    Rebase your series on top of targeted branch
  Targeted branch  master (currently at 26eb22191f)



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

