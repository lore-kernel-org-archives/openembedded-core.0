Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web12.9378.1593088343468331144
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2020 05:32:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 6F70860CC0;
	Thu, 25 Jun 2020 12:32:21 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgdHRmLWZvbnRzOiBVcGRhdGUgdHRmLXVidW50dS1mb250LWZhbWlseSByZWNpcGU=?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Daniel Gomez <daniel@qtec.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 25 Jun 2020 12:32:22 -0000
Message-ID: <20200625123222.20801.66309@do>
References: <20200625122222.38961-1-daniel@qtec.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20200625122222.38961-1-daniel@qtec.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: ttf-fonts: Update ttf-ubuntu-font-family recipe
Revision: 1
URL   : https://patchwork.openembedded.org/series/24835/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             Series sent to the wrong mailing list or some patches from the series correspond to different mailing lists [test_target_mailing_list] 
  Suggested fix    Send the series again to the correct mailing list (ML)
  Suggested ML     openembedded-devel@lists.openembedded.org [http://git.openembedded.org/meta-openembedded/]
  Patch's path:    meta-oe/recipes-graphics/ttf-fonts/ttf-ubuntu-font-family_0.80.bb

* Issue             Series does not apply on top of target branch [test_series_merge_on_head] 
  Suggested fix    Rebase your series on top of targeted branch
  Targeted branch  master (currently at 9ff7c2f4a4)



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

