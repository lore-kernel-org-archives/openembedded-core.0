Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web12.3454.1598472165363694968
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Aug 2020 13:02:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 3854C60C18;
	Wed, 26 Aug 2020 20:02:43 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgYXBhY2hlMjogdXBncmFkZSB2Mi40LjQzIC0+IHYyLjQuNDY=?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Sakib Sajal <sakib.sajal@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 26 Aug 2020 20:02:44 -0000
Message-ID: <20200826200244.2264.27313@do>
References: <20200826193722.33720-1-sakib.sajal@windriver.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20200826193722.33720-1-sakib.sajal@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: apache2: upgrade v2.4.43 -> v2.4.46
Revision: 1
URL   : https://patchwork.openembedded.org/series/25801/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Patch            [meta-webserver] apache2: upgrade v2.4.43 -> v2.4.46
 Issue             Series sent to the wrong mailing list [test_target_mailing_list] 
  Suggested fix    Check the project's README (meta-webserver) and send the patch to the indicated list

* Issue             Series does not apply on top of target branch [test_series_merge_on_head] 
  Suggested fix    Rebase your series on top of targeted branch
  Targeted branch  master (currently at 377a6ffbcb)



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

