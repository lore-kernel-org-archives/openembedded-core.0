Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web11.15710.1594715539417918342
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2020 01:32:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id DA46360ADE;
	Tue, 14 Jul 2020 08:32:16 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgW3pldXNdIG5zczogRml4IENWRS0yMDIwLTEyMzk5?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Ovidiu Panait <ovidiu.panait@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jul 2020 08:32:18 -0000
Message-ID: <20200714083218.2265.46510@do>
References: <20200714081813.28574-1-ovidiu.panait@windriver.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20200714081813.28574-1-ovidiu.panait@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: [zeus] nss: Fix CVE-2020-12399
Revision: 1
URL   : https://patchwork.openembedded.org/series/25124/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Patch            [zeus,1/1] nss: Fix CVE-2020-12399
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

