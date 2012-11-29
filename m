Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1Te5DW-0001gM-QM
	for Openembedded-core@lists.openembedded.org;
	Thu, 29 Nov 2012 15:35:55 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 29 Nov 2012 06:21:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,184,1355126400"; d="scan'208";a="173995034"
Received: from unknown (HELO [10.255.13.102]) ([10.255.13.102])
	by AZSMGA002.ch.intel.com with ESMTP; 29 Nov 2012 06:21:37 -0800
Message-ID: <1354198897.1530.0.camel@empanada>
From: Tom Zanussi <tom.zanussi@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 29 Nov 2012 08:21:37 -0600
In-Reply-To: <CAJTo0LbshbjjaDKaj63BABuF0mkLfgo7mnhEwwqiUOw2UHV7nQ@mail.gmail.com>
References: <cover.1354126748.git.nitin.a.kamble@intel.com>
	<1354133261.28084.102.camel@empanada>
	<CAJTo0LbshbjjaDKaj63BABuF0mkLfgo7mnhEwwqiUOw2UHV7nQ@mail.gmail.com>
X-Mailer: Evolution 3.4.1 (3.4.1-2.fc17) 
Mime-Version: 1.0
Cc: meta-intel@yoctoproject.org, darren.hart@intel.com,
	Openembedded-core@lists.openembedded.org
Subject: Re: [meta-intel patch 0/3] Fixes for rescent X breakages in meta-intel layer
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
X-List-Received-Date: Thu, 29 Nov 2012 14:35:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-11-29 at 11:27 +0000, Burton, Ross wrote:
> On 28 November 2012 20:07, Tom Zanussi <tom.zanussi@intel.com> wrote:
> > So does this conflict with Ross's patch, which seems simpler...
> 
> I do prefer my patch as the same breakage will occur for anyone else
> using oe-core master but also building their own older X server.
> Whilst the delta is so minimal, I don't see the problem in supporting
> both in oe-core.
> 

I'll second that...

Tom

> Ross




