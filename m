Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web10.21762.1588509163400020125
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 May 2020 05:32:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 06E3E60220;
	Sun,  3 May 2020 12:32:40 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgcGhwOiBmaXggemlwIHBhY2thZ2UgY29uZmlnIChyZXYzKQ==?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Konrad Weihmann <kweihmann@outlook.com>
Cc: openembedded-core@lists.openembedded.org
Date: Sun, 03 May 2020 12:32:42 -0000
Message-ID: <20200503123242.2277.50583@do>
References: <AM7PR05MB6881470A9DF3C88D48AE21E7A8A90@AM7PR05MB6881.eurprd05.prod.outlook.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <AM7PR05MB6881470A9DF3C88D48AE21E7A8A90@AM7PR05MB6881.eurprd05.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: php: fix zip package config (rev3)
Revision: 3
URL   : https://patchwork.openembedded.org/series/23910/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Patch            [meta-oe,v4] php: fix zip package config
 Issue             Series sent to the wrong mailing list [test_target_mailing_list] 
  Suggested fix    Check the project's README (meta-oe,v4) and send the patch to the indicated list

* Issue             Series does not apply on top of target branch [test_series_merge_on_head] 
  Suggested fix    Rebase your series on top of targeted branch
  Targeted branch  master (currently at e44ca998c2)



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

