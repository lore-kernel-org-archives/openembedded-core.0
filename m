Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S1nC8-00068h-5E
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 00:07:56 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 26 Feb 2012 14:59:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="129647974"
Received: from unknown (HELO helios.localnet) ([10.252.123.61])
	by fmsmga002.fm.intel.com with ESMTP; 26 Feb 2012 14:59:29 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 26 Feb 2012 22:59:27 +0000
Message-ID: <1770784.lEEKdoRJtu@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.0; i686; ; )
In-Reply-To: <1A634368-87AC-4206-8B0C-3729A478FF0C@dominion.thruhere.net>
References: <cover.1330294151.git.paul.eggleton@linux.intel.com>
	<b5c5d99d64381f508be653cc48e793f1e25eb2fe.1330294151.git.paul.eggleton@linux.intel.com>
	<1A634368-87AC-4206-8B0C-3729A478FF0C@dominion.thruhere.net>
MIME-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH 1/4] qt4: fix compile error in Qt 4.8.0 with gcc 4.6
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
X-List-Received-Date: Sun, 26 Feb 2012 23:07:56 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sunday 26 February 2012 23:55:25 Koen Kooi wrote:
> > +Upstream-Status: Inappropriate [configuration]
> > +
> > +Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> 
> Can I bribe you to make those proper git patches? :)

Is it useful given that it's not suitable for sending upstream?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


