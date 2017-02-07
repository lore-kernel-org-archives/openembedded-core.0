Return-Path: <patchwork@patchwork.openembedded.org>
Received: from do.openembedded.org (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 8C8ED71A3A;
	Tue,  7 Feb 2017 10:00:03 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@patchwork.openembedded.org>
To: Alexandru Moise <alexandru.moise@windriver.com>
Date: Tue, 07 Feb 2017 10:00:04 -0000
Message-ID: <20170207100004.9308.45940@do.openembedded.org>
References: <1486461522-11437-1-git-send-email-alexandru.moise@windriver.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <1486461522-11437-1-git-send-email-alexandru.moise@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3Igb3BlbnNzbDogQ1ZFLTIwMTctMzczMQ==?=
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Feb 2017 10:00:03 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: openssl: CVE-2017-3731
Revision: 1
URL   : https://patchwork.openembedded.org/series/5180/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Patch            [morty] openssl: CVE-2017-3731
 Issue             Missing or incorrectly formatted CVE tag in commit message [test_cve_presence_in_commit_message] 
  Suggested fix    Include a "CVE-xxxx-xxxx" tag in the commit message

* Patch            [morty] openssl: CVE-2017-3731
 Issue             Missing or incorrectly formatted CVE tag in included patch file [test_cve_tag_format] 
  Suggested fix    Correct or include the CVE tag on cve patch with format: "CVE: CVE-YYYY-XXXX"

* Issue             Added patch file is missing Upstream-Status in the header [test_upstream_status_presence] 
  Suggested fix    Add Upstream-Status: <status> to the header of meta/recipes-connectivity/openssl/openssl/0001-CVE-2017-3731.patch (possible values: Pending, Submitted, Accepted, Backport, Denied, Inappropriate)



If you believe any of these test results are incorrect, please reply to the
mailing list (openembedded-core@lists.openembedded.org) raising your concerns.
Otherwise we would appreciate you correcting the issues and submitting a new
version of the patchset if applicable. Please ensure you add/increment the
version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
[PATCH v3] -> ...).

---
Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe


