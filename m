Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UeTlU-0002qy-Dh
	for openembedded-core@lists.openembedded.org;
	Mon, 20 May 2013 19:21:23 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 20 May 2013 10:02:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,709,1363158000"; d="scan'208";a="305242175"
Received: from unknown (HELO helios.localnet) ([10.255.12.168])
	by azsmga001.ch.intel.com with ESMTP; 20 May 2013 10:02:28 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2013 18:02:27 +0100
Message-ID: <2007052.kOyn5X0lFt@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.2 (Linux/3.8.0-21-generic; KDE/4.10.2; i686; ; )
In-Reply-To: <1532244.5E4K0xnHso@helios>
References: <cover.1369063930.git.paul.eggleton@linux.intel.com>
	<CAP9ODKpjkaACp937RtWqsP02Ama=HLDSPAG_KDaAMe-8nPi1Ag@mail.gmail.com>
	<1532244.5E4K0xnHso@helios>
MIME-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [dylan][PATCH 00/41] Stable branch cherry-picks (cover letter only)
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
X-List-Received-Date: Mon, 20 May 2013 17:21:32 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 20 May 2013 17:54:21 Paul Eggleton wrote:
> On Monday 20 May 2013 13:21:29 Otavio Salvador wrote:
> > On Mon, May 20, 2013 at 12:58 PM, Paul Eggleton <
> > 
> > paul.eggleton@linux.intel.com> wrote:
> > > ...
> > > 
> > > Bruce Ashfield (4):
> > >   linux-yocto/3.4: iwlwifi, ext4, brtfs warning and -rt fixes
> > >   kern-tools: anchor and delimit regexs
> > >   linux-yocto/3.4: update to v3.4.43, ltsi-65311d8 and v3.4.42-rt56
> > >   linux-yocto/3.8: udpate to v3.8.11
> > 
> > Does this includes the dash kernel-tools fix?
> 
> I don't think it does. Bruce is that suitable to be pulled into dylan?

Scratch that - it is, I just missed including it.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


