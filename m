Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2BF0274775
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2018 04:52:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w9N4qENo006200
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 21:52:14 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Mon, 22 Oct 2018 21:52:13 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Oct 2018 12:58:21 +0800
Message-ID: <cover.1540270676.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] libaio: extend to nativesdk
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
X-List-Received-Date: Tue, 23 Oct 2018 04:52:14 -0000
Content-Type: text/plain

*** BLURB HERE ***
The following changes since commit 8e4c03744cfa8cc559682ebf7074643216dd2b9d:

  oe-selftest: devtool: Support meta being a symbolic link (2018-10-21 21:30:35 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/libaio-nativesdk
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/libaio-nativesdk

Chen Qi (1):
  libaio: extend to nativesdk

 meta/recipes-extended/libaio/libaio_0.3.111.bb | 2 ++
 1 file changed, 2 insertions(+)

-- 
1.9.1


