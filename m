Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1R8bRe-0003EI-1t
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Sep 2011 19:27:50 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 27 Sep 2011 10:22:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,450,1312182000"; d="scan'208";a="67971249"
Received: from unknown (HELO helios.localnet) ([10.252.120.163])
	by fmsmga001.fm.intel.com with ESMTP; 27 Sep 2011 10:22:22 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Tue, 27 Sep 2011 18:00:53 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-10-generic-pae; KDE/4.6.2; i686; ; )
References: <cover.1317131040.git.edwin.zhai@intel.com>
	<1317140351.26109.166.camel@ted>
	<CAP9ODKrRk81paUpo5pxY_ZxH_ee8cCCvkHbQJ5_607czGNeMZA@mail.gmail.com>
In-Reply-To: <CAP9ODKrRk81paUpo5pxY_ZxH_ee8cCCvkHbQJ5_607czGNeMZA@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201109271800.53350.paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] remove gnome-vfs completely
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
X-List-Received-Date: Tue, 27 Sep 2011 17:27:50 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday 27 September 2011 17:56:02 Otavio Salvador wrote:
> On Tue, Sep 27, 2011 at 13:19, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> ...
> 
> > First step would be to move it whole to its own layer repo.
> 
> I think we can just remove them all and let the necessity tell us what
> is really required.

I think that's what Richard is suggesting, as far as OE-core is concerned.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


