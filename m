Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web11.20224.1591293746529821333
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2020 11:02:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 7B81360F9F;
	Thu,  4 Jun 2020 18:02:24 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgdHJlbW9yOiB1cGRhdGUgU1JDX1VSSSBhcyBwcm9qZWN0IG1vdmVkIHRvIGdpdGxhYg==?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Rahul Chauhan <rahulk@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 04 Jun 2020 18:02:25 -0000
Message-ID: <20200604180225.20810.3876@do>
References: <1591292828-25442-1-git-send-email-rahulk@mvista.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <1591292828-25442-1-git-send-email-rahulk@mvista.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: tremor: update SRC_URI as project moved to gitlab
Revision: 1
URL   : https://patchwork.openembedded.org/series/24487/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Patch            [meta-oe,zeus] tremor: update SRC_URI as project moved to gitlab
 Issue             Series sent to the wrong mailing list [test_target_mailing_list] 
  Suggested fix    Check the project's README (meta-oe,zeus) and send the patch to the indicated list

* Issue             Series does not apply on top of target branch [test_series_merge_on_head] 
  Suggested fix    Rebase your series on top of targeted branch
  Targeted branch  zeus (currently at ee95a39928)



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

