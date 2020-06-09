Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web12.8634.1591713117835971690
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2020 07:31:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id EB05D60A5A;
	Tue,  9 Jun 2020 14:31:55 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgIltSRkNdIGZlYXR1cmVzX2NoZWNrOiBXYXJuIGlmIC4uLiIgYW5kIDEgbW9yZQ==?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Jacob Kroon <jacob.kroon@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 09 Jun 2020 14:31:57 -0000
Message-ID: <20200609143157.20810.26040@do>
References: <20200609141114.1751767-1-jacob.kroon@gmail.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20200609141114.1751767-1-jacob.kroon@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: "[RFC] features_check: Warn if ..." and 1 more
Revision: 1
URL   : https://patchwork.openembedded.org/series/24558/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Patch            [RFC, 2/2] Don't inherit 'features_check' in recipes that don't utilize it
 Issue             Shortlog does not follow expected format [test_shortlog_format] 
  Suggested fix    Commit shortlog (first line of commit message) should follow the format "<target>: <summary>"



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

