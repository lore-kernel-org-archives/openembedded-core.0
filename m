Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web12.3892.1591902142635330092
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2020 12:02:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 64D9460EB7
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2020 19:02:20 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3Igc3lzdGVtZDogZml4IENWRS0yMDIwLTEzNzc2?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Slater, Joseph <joe.slater@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 11 Jun 2020 19:02:21 -0000
Message-ID: <20200611190221.20779.53966@do>
References: <20200611183616.48687-1-joe.slater@windriver.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20200611183616.48687-1-joe.slater@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: systemd: fix CVE-2020-13776
Revision: 1
URL   : https://patchwork.openembedded.org/series/24594/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Patch            [1/1] systemd: fix CVE-2020-13776
 Issue             Missing or incorrectly formatted CVE tag in included patch file [test_cve_tag_format] 
  Suggested fix    Correct or include the CVE tag on cve patch with format: "CVE: CVE-YYYY-XXXX"



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

