Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web12.3800.1588797147568133680
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 May 2020 13:32:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 0BD6360C18;
	Wed,  6 May 2020 20:32:25 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgTmV3ZXIgTGludXgga2VybmVscyBhcmUgcHJvZHVjaW5nIGJ1aWx0LWluLmEgZmlsZXMu?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Jan Vermaete <Jan.Vermaete@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 06 May 2020 20:32:26 -0000
Message-ID: <20200506203226.2275.23632@do>
References: <20200506202649.23638-1-jan.vermaete@gmail.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20200506202649.23638-1-jan.vermaete@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Newer Linux kernels are producing built-in.a files.
Revision: 1
URL   : https://patchwork.openembedded.org/series/23987/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Patch            [scripts] Newer Linux kernels are producing built-in.a files.
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

