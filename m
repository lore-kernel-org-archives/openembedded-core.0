Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T8pud-0002wh-DW
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 11:59:15 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 04 Sep 2012 02:46:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,366,1344236400"; d="scan'208";a="217827587"
Received: from unknown (HELO helios.localnet) ([10.252.121.161])
	by fmsmga001.fm.intel.com with ESMTP; 04 Sep 2012 02:46:52 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 04 Sep 2012 10:46:51 +0100
Message-ID: <4146608.D13hUTYxE0@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-29-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <cover.1346668109.git.paul.eggleton@linux.intel.com>
References: <cover.1346668109.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH 00/28] Package group fixes
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
X-List-Received-Date: Tue, 04 Sep 2012 09:59:15 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 03 September 2012 11:30:20 Paul Eggleton wrote:
> This rather large set of changes renames "task" to "packagegroup" and
> attempts to clean up a number of package group related issues [1]. It
> doesn't go quite as far as I had hoped - I wanted to tidy up the base,
> core-lsb and core-basic recipes even further, but unfortunately I ran
> out of time for this cycle.
> 
> [1] http://www.openembedded.org/wiki/OE-Core_Task_Rework

Branch re-pushed with (somewhat unnecessary) PR bumps.

Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


