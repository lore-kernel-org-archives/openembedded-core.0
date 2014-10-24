Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0445E65E94
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 09:23:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9O9NPFE010143
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 02:23:26 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Fri, 24 Oct 2014 02:23:25 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Oct 2014 17:20:35 +0800
Message-ID: <cover.1414142394.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] curl: Security Advisory - curl - CVE-2014-3613
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
X-List-Received-Date: Fri, 24 Oct 2014 09:23:28 -0000
Content-Type: text/plain

The following changes since commit ad065f94acb0bfb81e33935890a1db251d6e2979:

  ref-manual: Minor edits to variables. (2014-10-23 15:20:20 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/curl
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/curl

Chong Lu (1):
  curl: Security Advisory - curl - CVE-2014-3613

 meta/recipes-support/curl/curl/CVE-2014-3613.patch | 269 +++++++++++++++++++++
 meta/recipes-support/curl/curl_7.37.1.bb           |   1 +
 2 files changed, 270 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2014-3613.patch

-- 
1.9.1


