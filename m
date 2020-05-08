Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web10.8343.1588935759418119377
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2020 04:02:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 07D5560AF5;
	Fri,  8 May 2020 11:02:36 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgImxpYnZhOiB1cGdyYWRlIDIuNi4xIC0+IDIuNy4xLi4uIiBhbmQgMSBtb3Jl?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Naveen Saini <naveen.kumar.saini@intel.com>
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 08 May 2020 11:02:38 -0000
Message-ID: <20200508110238.2277.99066@do>
References: <20200508110310.29937-1-naveen.kumar.saini@intel.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20200508110310.29937-1-naveen.kumar.saini@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: "libva: upgrade 2.6.1 -> 2.7.1..." and 1 more
Revision: 1
URL   : https://patchwork.openembedded.org/series/24026/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             Series does not apply on top of target branch [test_series_merge_on_head] 
  Suggested fix    Rebase your series on top of targeted branch
  Targeted branch  master (currently at e604e9d234)



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

