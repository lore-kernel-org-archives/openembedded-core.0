Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web10.83602.1597816944751224714
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2020 23:02:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 9AA6A60B70;
	Wed, 19 Aug 2020 06:02:22 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgQWRkIGRpcmVjdG9yeSAvdmFyL2VtcHR5IGluIGJhc2UtZmlsZXM=?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Lachlan Archibald <lachlan.archibald@opengear.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 19 Aug 2020 06:02:24 -0000
Message-ID: <20200819060224.2265.25413@do>
References: <20200819053439.3241164-1-lachlan.archibald@opengear.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20200819053439.3241164-1-lachlan.archibald@opengear.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add directory /var/empty in base-files
Revision: 1
URL   : https://patchwork.openembedded.org/series/25673/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Patch            Add directory /var/empty in base-files
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

