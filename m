Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web12.32679.1597618945864046916
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2020 16:02:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id C7DE460F18;
	Sun, 16 Aug 2020 23:02:23 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgImxpbnV4LXlvY3RvLzUuNDogdXBkYXRlIHRvIHY1Li4uLiIgYW5kIDEgbW9yZSAocmV2Mik=?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Sun, 16 Aug 2020 23:02:25 -0000
Message-ID: <20200816230225.2264.2026@do>
References: <20200816225113.6741-1-bruce.ashfield@gmail.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20200816225113.6741-1-bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: "linux-yocto/5.4: update to v5...." and 1 more (rev2)
Revision: 2
URL   : https://patchwork.openembedded.org/series/25018/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Patch            [2/2] linux-yocto/5.4: perf cs-etm: Move definition of 'traceid_list' global variable from header file
 Issue             Commit shortlog is too long [test_shortlog_length] 
  Suggested fix    Edit shortlog so that it is 90 characters or less (currently 96 characters)



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

