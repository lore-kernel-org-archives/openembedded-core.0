Return-Path: <patchwork@patchwork.openembedded.org>
Received: from do (do.openembedded.org [107.170.225.144])
	by mail.openembedded.org (Postfix) with ESMTP id B8A9E79C9B;
	Fri, 14 Dec 2018 10:03:23 +0000 (UTC)
MIME-Version: 1.0
From: Patchwork <patchwork@patchwork.openembedded.org>
To: Jens Rehsack <sno@netbsd.org>
Date: Fri, 14 Dec 2018 10:03:25 -0000
Message-ID: <20181214100325.2330.29791@do>
References: <20181214094319.2935-1-sno@netbsd.org>
Reply-To: openembedded-core@lists.openembedded.org
X-Patchwork-Hint: ignore
In-Reply-To: <20181214094319.2935-1-sno@netbsd.org>
Cc: openembedded-core@lists.openembedded.org
Subject: =?UTF-8?B?4pyXIHBhdGNodGVzdDogZmFpbHVyZSBmb3IgcGVybHssLW5hdGl2ZX06IFVwZGF0ZSA1LjI0LjQgLT4gNS4yOC4x?=
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
X-List-Received-Date: Fri, 14 Dec 2018 10:03:24 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: perl{,-native}: Update 5.24.4 -> 5.28.1
Revision: 1
URL   : https://patchwork.openembedded.org/series/15340/
State : failure

== Summary ==


Thank you for submitting this patch series to OpenEmbedded Core. This is
an automated response. Several tests have been executed on the proposed
series by patchtest resulting in the following failures:



* Issue             LIC_FILES_CHKSUM changed on target perl-native but there is no "License-Update" tag in commit message [test_lic_files_chksum_modified_not_mentioned] 
  Suggested fix    Include "License-Update: <description>" into the commit message with a brief description
  Current checksum file://Copying;md5=5b122a36d0f6dc55279a0ebc69f3c60b 		    file://Artistic;md5=2e6fd2475335af892494fe1f7327baf3
  New checksum     file://Copying;md5=5b122a36d0f6dc55279a0ebc69f3c60b 		    file://Artistic;md5=71a4d5d9acc18c0952a6df2218bb68da

* Patch            perl{,-native}: Update 5.24.4 -> 5.28.1
 Issue             Missing or incorrectly formatted CVE tag in included patch file [test_cve_tag_format] 
  Suggested fix    Correct or include the CVE tag on cve patch with format: "CVE: CVE-YYYY-XXXX"



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


