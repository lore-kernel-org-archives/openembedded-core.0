Return-Path: <patchwork@patchwork.openembedded.org>
Received: from do.openembedded.org (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id 0898774750;
	Fri, 30 Mar 2018 20:32:57 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@patchwork.openembedded.org>
To: Brad Bishop <bradleyb@fuzziesquirrel.com>
Date: Fri, 30 Mar 2018 20:32:58 -0000
Message-ID: <20180330203258.2391.37969@do.openembedded.org>
References: <20180330200646.12047-1-bradleyb@fuzziesquirrel.com>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20180330200646.12047-1-bradleyb@fuzziesquirrel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgYXV0b2NvbmYtYXJjaGl2ZTogdXBkYXRlIHRvIHZlcnNpb24gdG8gMjAxOC4wMy4xMw==?=
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
X-List-Received-Date: Fri, 30 Mar 2018 20:32:57 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: autoconf-archive: update to version to 2018.03.13
Revision: 1
URL   : https://patchwork.openembedded.org/series/11625/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             LIC_FILES_CHKSUM changed on target autoconf-archive but there is no "License-Update" tag in commit message [test_lic_files_chksum_modified_not_mentioned] 
  Suggested fix    Include "License-Update: <description>" into the commit message with a brief description
  Current checksum file://COPYING;md5=d32239bcb673463ab874e80d47fae504     file://COPYING.EXCEPTION;md5=fdef168ebff3bc2f13664c365a5fb515
  New checksum     file://COPYING;md5=11cc2d3ee574f9d6b7ee797bdce4d423     file://COPYING.EXCEPTION;md5=fdef168ebff3bc2f13664c365a5fb515



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


