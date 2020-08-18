Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web12.66888.1597761166351950500
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2020 07:32:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 3B66160F31;
	Tue, 18 Aug 2020 14:32:43 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgIltkdW5mZWxsXSBnaG9zdHNjcmlwdDogdXBkYXRlIC4uLiIgYW5kIDEgbW9yZQ==?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: chee.yang.lee@intel.com
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 18 Aug 2020 14:32:45 -0000
Message-ID: <20200818143245.2265.44578@do>
References: <20200818140637.64777-1-chee.yang.lee@intel.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20200818140637.64777-1-chee.yang.lee@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: "[dunfell] ghostscript: update ..." and 1 more
Revision: 1
URL   : https://patchwork.openembedded.org/series/25664/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Patch            [dunfell,1/2] ghostscript: update to 9.52
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

