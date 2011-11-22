Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RSxw2-0007q0-N3
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Nov 2011 22:31:23 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 22 Nov 2011 13:24:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="78968209"
Received: from unknown (HELO helios.localnet) ([10.252.121.176])
	by orsmga002.jf.intel.com with ESMTP; 22 Nov 2011 13:24:47 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
Date: Tue, 22 Nov 2011 21:24:46 +0000
Message-ID: <2011246.ri3oVFrxpJ@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-13-generic-pae; KDE/4.7.3; i686; ; )
In-Reply-To: <4ECC09EA.2050103@linux.intel.com>
References: <cover.1321628513.git.paul.eggleton@linux.intel.com>
	<dee6ab006094693ede5ec6669fa5616a3a00b067.1321628513.git.paul.eggleton@linux.intel.com>
	<4ECC09EA.2050103@linux.intel.com>
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 1/1] qt4: disable pulseaudio
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
X-List-Received-Date: Tue, 22 Nov 2011 21:31:23 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 22 November 2011 12:45:30 Saul Wold wrote:
> On 11/18/2011 07:03 AM, Paul Eggleton wrote:
> > +# Upstream-status: pending
> > +#
> 
> Small nit-pick here, status start with Caps, so this should be Pending

OK, when I rework this as a DISTRO_FEATURE I will fix this up as well.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


