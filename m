Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web10.12793.1594996354129293288
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2020 07:32:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 32D7760B5D;
	Fri, 17 Jul 2020 14:32:32 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3Iga2VybmVsLWZpdGltYWdlOiBidWlsZCBjb25maWd1cmF0aW9uIGZvciBpbWFnZSB0cmVlIHdoZW4gZHRiIGlzIG5vdCBwcmVzZW50?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Usama Arif <usama.arif@arm.com>
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jul 2020 14:32:33 -0000
Message-ID: <20200717143233.2265.38478@do>
References: <20200717140848.55937-1-usama.arif@arm.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20200717140848.55937-1-usama.arif@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: kernel-fitimage: build configuration for image tree when dtb is not present
Revision: 1
URL   : https://patchwork.openembedded.org/series/25171/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             Series does not apply on top of target branch [test_series_merge_on_head] 
  Suggested fix    Rebase your series on top of targeted branch
  Targeted branch  master (currently at 15b2c666cb)



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

