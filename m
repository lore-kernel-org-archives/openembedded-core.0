Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web10.12986.1592209920836880539
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2020 01:32:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id BFBBB60B06;
	Mon, 15 Jun 2020 08:31:58 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgZ251dGxzOiBmaXhlZCBDVkUtMjAyMC0xMzc3Nw==?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Haiqing Bai <Haiqing.Bai@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 15 Jun 2020 08:32:00 -0000
Message-ID: <20200615083200.20779.84284@do>
References: <1592208925-200345-1-git-send-email-Haiqing.Bai@windriver.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <1592208925-200345-1-git-send-email-Haiqing.Bai@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: gnutls: fixed CVE-2020-13777
Revision: 1
URL   : https://patchwork.openembedded.org/series/24657/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Patch            [zeus] gnutls: fixed CVE-2020-13777
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

