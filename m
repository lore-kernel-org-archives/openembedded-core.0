Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web10.114208.1597939370664150605
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2020 09:02:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 50ED360B70;
	Thu, 20 Aug 2020 16:02:48 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgYXNpbzogZXh0ZW5kIHJlY2lwZSB0byBhZGQgbmF0aXZlIHN1cHBvcnQ=?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Bjarne Michelsen via lists.openembedded.org
 <bjarne_michelsen=hotmail.com@lists.openembedded.org>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 20 Aug 2020 16:02:49 -0000
Message-ID: <20200820160249.2264.41858@do>
References: <20200820155130.8397-1-bjarne_michelsen@hotmail.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20200820155130.8397-1-bjarne_michelsen@hotmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: asio: extend recipe to add native support
Revision: 1
URL   : https://patchwork.openembedded.org/series/25701/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             Series sent to the wrong mailing list or some patches from the series correspond to different mailing lists [test_target_mailing_list] 
  Suggested fix    Send the series again to the correct mailing list (ML)
  Suggested ML     openembedded-devel@lists.openembedded.org [http://git.openembedded.org/meta-openembedded/]
  Patch's path:    meta-oe/recipes-support/asio/asio_1.16.1.bb

* Issue             Series does not apply on top of target branch [test_series_merge_on_head] 
  Suggested fix    Rebase your series on top of targeted branch
  Targeted branch  master (currently at 1a2d05b504)



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

