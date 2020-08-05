Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web10.7115.1596634338577536640
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Aug 2020 06:32:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id AE6AC60F22;
	Wed,  5 Aug 2020 13:32:16 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgYWxsYXJjaDogRml4IHdyb25nIGRlcGVuZGVuY2llcw==?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Daniel Gomez <daniel@qtec.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 05 Aug 2020 13:32:18 -0000
Message-ID: <20200805133218.2264.64387@do>
References: <20200805132224.616205-1-daniel@qtec.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20200805132224.616205-1-daniel@qtec.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: allarch: Fix wrong dependencies
Revision: 1
URL   : https://patchwork.openembedded.org/series/25470/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             Series sent to the wrong mailing list or some patches from the series correspond to different mailing lists [test_target_mailing_list] 
  Suggested fix    Send the series again to the correct mailing list (ML)
  Suggested ML     openembedded-devel@lists.openembedded.org [http://git.openembedded.org/meta-openembedded/]
  Patch's path:    meta-oe/recipes-graphics/terminus-font/terminus-font_4.38.bb

* Issue             Series does not apply on top of target branch [test_series_merge_on_head] 
  Suggested fix    Rebase your series on top of targeted branch
  Targeted branch  master (currently at 10221e578f)



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

