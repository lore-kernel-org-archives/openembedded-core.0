Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 172636AC24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Apr 2015 07:49:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3G7nBfn006499
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Apr 2015 00:49:11 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.236) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Thu, 16 Apr 2015 00:49:19 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Apr 2015 15:49:18 +0800
Message-ID: <cover.1429170493.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] layer_extra_sanity.bbclass: add new bbclass
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
X-List-Received-Date: Thu, 16 Apr 2015 07:49:11 -0000
Content-Type: text/plain

The following changes since commit cfc43743b0e41cf168cad9cbd4e9d870b8f01f03:

  toolchain-scripts: Allow the CONFIGSITE_CACHE variable to be overridden (2015-04-15 14:29:54 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/layer_extra_sanity
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/layer_extra_sanity

Chen Qi (1):
  layer_extra_sanity.bbclass: add new bbclass

 meta/classes/layer_extra_sanity.bbclass | 91 +++++++++++++++++++++++++++++++++
 1 file changed, 91 insertions(+)
 create mode 100644 meta/classes/layer_extra_sanity.bbclass

-- 
1.9.1


