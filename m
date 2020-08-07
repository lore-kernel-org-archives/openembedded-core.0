Received: from mail.openembedded.org (mail.openembedded.org [140.211.169.62])
 by mx.groups.io with SMTP id smtpd.web10.7932.1596812543543009301
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Aug 2020 08:02:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: patchwork.openembedded.org, ip: 140.211.169.62, mailfrom: patchwork@patchwork.openembedded.org)
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 6833E60C24;
	Fri,  7 Aug 2020 15:02:21 +0000 (UTC)
MIME-Version: 1.0
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3Igc3lzdGVtZDogRml4IGNvZGVzb25hciB3YXJuaW5ncyAocmV2NCk=?=
From: "Patchwork" <patchwork@patchwork.openembedded.org>
To: Amitanand N Chikorde <Amitanand.Chikorde@kpit.com>
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 07 Aug 2020 15:02:22 -0000
Message-ID: <20200807150222.2265.75668@do>
References: <1596810707-16909-1-git-send-email-Amitanand.Chikorde@kpit.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <1596810707-16909-1-git-send-email-Amitanand.Chikorde@kpit.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: systemd: Fix codesonar warnings (rev4)
Revision: 4
URL   : https://patchwork.openembedded.org/series/25093/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Patch            [meta-oe,sumo] systemd: fix codesonar warnings
 Issue             Series sent to the wrong mailing list [test_target_mailing_list] 
  Suggested fix    Check the project's README (meta-oe,sumo) and send the patch to the indicated list

* Issue             Series does not apply on top of target branch [test_series_merge_on_head] 
  Suggested fix    Rebase your series on top of targeted branch
  Targeted branch  sumo (currently at 84f19e78d9)



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

