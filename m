Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SCyAl-0000Jv-H6
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Mar 2012 21:04:43 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 28 Mar 2012 11:55:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="122773140"
Received: from unknown (HELO helios.localnet) ([10.252.123.243])
	by orsmga001.jf.intel.com with ESMTP; 28 Mar 2012 11:55:39 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 28 Mar 2012 19:55:37 +0100
Message-ID: <10509160.Vt3KZmcQrf@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.1; i686; ; )
In-Reply-To: <CAAQYJAvw=HXoF0jPCsLwRkmJgdLx41sYzveOrY6qyvdwJ+8MCA@mail.gmail.com>
References: <alpine.DEB.2.02.1203270815010.3125@oneiric>
	<12232640.MdqDDZk2lY@helios>
	<CAAQYJAvw=HXoF0jPCsLwRkmJgdLx41sYzveOrY6qyvdwJ+8MCA@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: adding a single package to an image -- what's the proper way?
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
X-List-Received-Date: Wed, 28 Mar 2012 19:04:43 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 28 March 2012 15:19:20 Andrea Adami wrote:
> Robert, core-image-base is much better for testing (is a bit like
> Angstrom console-image)
> 
> Paul,
> maybe core-image-base (and core-image-core) should be listed in the
> output of oe-init-build-env & co.?

Possibly. In the next development cycle though I would like to do a rework of 
the images and tasks so that they are better named and particularly in the 
case of tasks, more effective.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


