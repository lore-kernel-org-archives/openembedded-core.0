Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1TijLq-0002ZG-99
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Dec 2012 11:15:45 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qBCA17WJ003516
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Dec 2012 02:01:07 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Wed, 12 Dec 2012 02:01:07 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Dec 2012 18:01:01 +0800
Message-ID: <cover.1354862051.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/1] native tools set packagegroup
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 12 Dec 2012 10:15:45 -0000
Content-Type: text/plain

The following changes since commit d3154aa9f8b111066a4e2f5287f8d49075ed6253:

  sstate: fix typo (2012-12-06 22:59:10 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/nativetoolset
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/nativetoolset

Hongxu Jia (1):
  native tools set packagegroup

 .../packagegroups/packagegroup-toolset-native.bb   |  236 ++++++++++++++++++++
 1 file changed, 236 insertions(+)
 create mode 100644 meta/recipes-gnome/packagegroups/packagegroup-toolset-native.bb

-- 
1.7.10.4



