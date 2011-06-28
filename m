Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <edwin.zhai@intel.com>) id 1QbXpg-0004u1-VD
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 14:56:01 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 28 Jun 2011 05:42:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,437,1304319600"; d="scan'208";a="21024271"
Received: from shxpwgzhai1a.ccr.corp.intel.com (HELO [10.239.48.130])
	([10.239.48.130])
	by orsmga001.jf.intel.com with ESMTP; 28 Jun 2011 05:42:11 -0700
Message-ID: <4E09CC24.4010703@intel.com>
Date: Tue, 28 Jun 2011 20:42:12 +0800
From: "Zhai, Edwin" <edwin.zhai@intel.com>
User-Agent: Thunderbird 2.0.0.17 (Windows/20080914)
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1309246787.git.edwin.zhai@intel.com>	<7bf8a7025dddd0b251ff9c37a55f28b7e099fad7.1309246787.git.edwin.zhai@intel.com>	<E91A85C8-4484-4C15-A75D-3A87EB475B4F@dominion.thruhere.net>	<4E098D41.4060808@intel.com>	<D552A863-6204-4F54-9B5A-07DC755B830E@dominion.thruhere.net>
	<4E09C426.1020904@intel.com>
In-Reply-To: <4E09C426.1020904@intel.com>
Subject: Re: [PATCH 2/3] webkit-gtk: recommends glib-networking to	access https web page
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
X-List-Received-Date: Tue, 28 Jun 2011 12:56:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Done. Commits @ same contrib tree.
  git://git.pokylinux.org/poky-contrib gzhai/master
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=gzhai/master


Thanks,
edwin


Zhai, Edwin wrote:
>
>
> Koen Kooi wrote:
> >
> > Op 28 jun 2011, om 10:13 heeft Zhai, Edwin het volgende geschreven:
> >
> > >
> > > In future, other recipes besides webkit-gtk may ask for
> > glib-networking, maybe we can change it that time?
> > > What's your opinion?
> >
> > I'd either put it in the lib that uses it (soup) or the app that needs
> > it (web-webkit), something in between is just confusing.
> >
>
> Reasonable. I'd like to put it in libsoup.
> Thanks,
> edwin
>
> > regards,
> >
> > Koen
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> >
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


