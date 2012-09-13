Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TC7Oc-00027G-FO
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Sep 2012 13:15:46 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 13 Sep 2012 04:03:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,416,1344236400"; d="scan'208";a="144615142"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.214])
	by AZSMGA002.ch.intel.com with ESMTP; 13 Sep 2012 04:03:08 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Sep 2012 12:03:00 +0100
Message-Id: <cover.1347534093.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/2] A couple of minor fixes
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
X-List-Received-Date: Thu, 13 Sep 2012 11:15:46 -0000

The following changes since commit 835654994574c158d6324218ebe000bd2ef9a792:

  rt: Add hwlatdetect to rt images (2012-09-12 15:11:12 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/fixes1
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/fixes1

Paul Eggleton (2):
  gst-ffmpeg: add LICENSE_FLAGS
  gst-fluendo-mpegdemux: add LICENSE_FLAGS

 .../gstreamer/gst-ffmpeg_0.10.13.bb                |    1 +
 .../gstreamer/gst-fluendo-mpegdemux_0.10.71.bb     |    1 +
 2 files changed, 2 insertions(+)

-- 
1.7.9.5



