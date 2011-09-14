Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1R3ucZ-0000Z0-6Y
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 20:55:45 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 14 Sep 2011 11:50:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,382,1312182000"; d="scan'208";a="51389878"
Received: from unknown (HELO [10.255.14.200]) ([10.255.14.200])
	by fmsmga001.fm.intel.com with ESMTP; 14 Sep 2011 11:50:31 -0700
From: Tom Zanussi <tom.zanussi@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
In-Reply-To: <CAP9ODKopgP0rzqJPYYn9hvFX1wE_xJQFWd6ZfdGv7kjU8Endyw@mail.gmail.com>
References: <1316025864.26879.2583.camel@elmorro>
	<CAP9ODKopgP0rzqJPYYn9hvFX1wE_xJQFWd6ZfdGv7kjU8Endyw@mail.gmail.com>
Date: Wed, 14 Sep 2011 13:50:22 -0500
Message-ID: <1316026222.26879.2586.camel@elmorro>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Add new recipes for grub2 [v4]
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
X-List-Received-Date: Wed, 14 Sep 2011 18:55:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-09-14 at 11:49 -0700, Otavio Salvador wrote:
> On Wed, Sep 14, 2011 at 15:44, Tom Zanussi <tom.zanussi@intel.com> wrote:
> > This patchset adds a new recipe for grub2 and an accompanying
> > changes to initramfs-live-install.
> >
> > It's been preliminarily boot-tested with the meta-intel BSPs emenlow,
> > and the legacy version (grub-0.97) was also tested with emenlow.
> ...
> 
> Acked-by: Otavio Salvador <otavio@ossystems.com.br>
> 

Thanks for taking the time to review and ack these...

Tom



