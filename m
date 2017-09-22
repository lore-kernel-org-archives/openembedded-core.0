Return-Path: <patchwork@patchwork.openembedded.org>
Received: from do.openembedded.org (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 901337808C;
	Fri, 22 Sep 2017 07:00:33 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@patchwork.openembedded.org>
To: Kang Kai <kai.kang@windriver.com>
Date: Fri, 22 Sep 2017 07:00:35 -0000
Message-ID: <20170922070035.2785.4701@do.openembedded.org>
References: <cover.1506061623.git.kai.kang@windriver.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <cover.1506061623.git.kai.kang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgbGFtZTogYmFja3BvcnQgcGF0Y2ggdG8gZml4IENWRS0yMDE3LTEzNzEy?=
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
X-List-Received-Date: Fri, 22 Sep 2017 07:00:33 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: lame: backport patch to fix CVE-2017-13712
Revision: 1
URL   : https://patchwork.openembedded.org/series/9069/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Patch            [1/1] lame: fix CVE-2017-13712
 Issue             Missing or incorrectly formatted CVE tag in included patch file [test_cve_tag_format] 
  Suggested fix    Correct or include the CVE tag on cve patch with format: "CVE: CVE-YYYY-XXXX"



If you believe any of these test results are incorrect, please reply to the
mailing list (openembedded-core@lists.openembedded.org) raising your concerns.
Otherwise we would appreciate you correcting the issues and submitting a new
version of the patchset if applicable. Please ensure you add/increment the
version number when sending the new version (i.e. [PATCH] -> [PATCH v2] ->
[PATCH v3] -> ...).

---
Test framework: http://git.yoctoproject.org/cgit/cgit.cgi/patchtest
Test suite:     http://git.yoctoproject.org/cgit/cgit.cgi/patchtest-oe


