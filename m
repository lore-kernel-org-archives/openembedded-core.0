Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Sh3Lt-00063e-1R
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jun 2012 20:40:33 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Jun 2012 11:29:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="155592117"
Received: from unknown (HELO helios.localnet) ([10.252.120.169])
	by orsmga001.jf.intel.com with ESMTP; 19 Jun 2012 11:29:47 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
Date: Tue, 19 Jun 2012 19:29:44 +0100
Message-ID: <2812027.e5PhAjC3T6@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.3 (Linux/3.2.0-25-generic-pae; KDE/4.8.3; i686; ; )
In-Reply-To: <4FE0A296.5090809@linux.intel.com>
References: <4FE0A296.5090809@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Buildhistory for the PACKAGE Reorder
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
X-List-Received-Date: Tue, 19 Jun 2012 18:40:33 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 19 June 2012 09:02:30 Saul Wold wrote:
> Please find attached the buildhistory_diff from 2 world builds with and
> without the PACKAGE Reorder.

Saul, would you mind pushing the buildhistory repo somewhere (e.g. to a poky-
contrib branch)? That would help me debug some of the weirdness in the output 
there.

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


