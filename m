Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TYbRm-0002GL-Er
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 12:47:58 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 14 Nov 2012 03:34:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,250,1352102400"; d="scan'208";a="168220608"
Received: from unknown (HELO helios.localnet) ([10.252.122.165])
	by AZSMGA002.ch.intel.com with ESMTP; 14 Nov 2012 03:34:01 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Wed, 14 Nov 2012 11:33:59 +0000
Message-ID: <3022446.WMq39sgvYG@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.2 (Linux/3.2.0-32-generic-pae; KDE/4.9.2; i686; ; )
In-Reply-To: <CAP9ODKpOi5tf6Tgdwv7sm=YeXL21Q9i=7ATiDLjVtvvZ-UddVw@mail.gmail.com>
References: <cover.1352871028.git.sgw@linux.intel.com>
	<0c604e38ddcd6597371775a9c51625bf71c9f359.1352871028.git.sgw@linux.intel.com>
	<CAP9ODKpOi5tf6Tgdwv7sm=YeXL21Q9i=7ATiDLjVtvvZ-UddVw@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/9] less: Update to 451
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
X-List-Received-Date: Wed, 14 Nov 2012 11:47:58 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 14 November 2012 09:26:53 Otavio Salvador wrote:
> > -PR = "r3"
> > +PR = "r0"
> 
> Please drop PR as r0 is the default.

We don't do that in OE-Core.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


