Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QKv86-0001EN-5O
	for openembedded-core@lists.openembedded.org;
	Fri, 13 May 2011 18:22:18 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 13 May 2011 09:19:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,365,1301900400"; 
   d="scan'208";a="1869501"
Received: from unknown (HELO helios.localnet) ([10.255.16.107])
	by fmsmga001.fm.intel.com with ESMTP; 13 May 2011 09:19:11 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
Organization: Intel Corporation (UK)
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 May 2011 17:19:10 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-8-generic-pae; KDE/4.6.2; i686; ; )
MIME-Version: 1.0
Message-Id: <201105131719.10997.paul.eggleton@linux.intel.com>
Subject: RFC: Qt4 - removal of 4.6.3
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 13 May 2011 16:22:18 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi all,

Saul has suggested that we remove Qt 4.6.3 from oe-core in line with our 
policy of only having one version of a package that doesn't have GPLv2/v3 
versions. Is this going to be OK?

FWIW 4.7.x should be binary compatible with 4.6.3, although there may of 
course still be some vendor support concerns.

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


