Return-Path: <emilia.maria.silvia.ciobanu@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0978C6A5A1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jul 2013 14:59:34 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 10 Jul 2013 07:59:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,1036,1363158000"; d="scan'208";a="368075104"
Received: from ema-vostro-460.rb.intel.com ([10.237.105.147])
	by fmsmga002.fm.intel.com with ESMTP; 10 Jul 2013 07:59:33 -0700
From: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Jul 2013 18:07:03 +0300
Message-Id: <cover.1373468672.git.emilia.maria.silvia.ciobanu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/3] Add docbook-sgml-dtd-*-native real PV
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
X-List-Received-Date: Wed, 10 Jul 2013 14:59:34 -0000

This changes are needed for a proper version reporting by the
Package Reporting System.

The following changes since commit a63229917a5708de2d161aba0d67168ce0da6365:

  meta-yocto-bsp: update reference board SRCREVs (2013-07-10 09:45:51 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib emac/docbook-sgml-dtd-native_pv
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=emac/docbook-sgml-dtd-native_pv

Emilia Ciobanu (3):
  docbook-sgml-dtd-4.5-native.bb: Add real PV inside the recipe
  docbook-sgml-dtd-4.1-native.bb: Add real PV inside the recipe
  docbook-sgml-dtd-3.1-native.bb: Add real PV inside the recipe

 .../docbook-sgml-dtd-3.1-native.bb                 |    1 +
 .../docbook-sgml-dtd-4.1-native.bb                 |    1 +
 .../docbook-sgml-dtd-4.5-native.bb                 |    1 +
 3 files changed, 3 insertions(+)

-- 
1.7.9.5


