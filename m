Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Sz83n-0005so-Fr
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Aug 2012 17:20:35 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 08 Aug 2012 08:07:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.77,733,1336374000"; d="scan'208";a="183186096"
Received: from unknown (HELO helios.localnet) ([10.252.121.56])
	by orsmga002.jf.intel.com with ESMTP; 08 Aug 2012 08:07:48 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Samuel Stirtzel <s.stirtzel@googlemail.com>
Date: Wed, 08 Aug 2012 16:07:47 +0100
Message-ID: <5490077.atXKzM8mhJ@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9 (Linux/3.2.0-27-generic-pae; KDE/4.9.0; i686; ; )
In-Reply-To: <CAGiJk9f3fL8gC4RpEweeyFrZU0oPsth_Rh_SEhtK+L66PgJinA@mail.gmail.com>
References: <CAJTo0LZn3md_x3a9-+LV67FYopkXaPgFv8-+U4JEj7UzwSYd9Q@mail.gmail.com>
	<1503062.H9kskseNSt@helios>
	<CAGiJk9f3fL8gC4RpEweeyFrZU0oPsth_Rh_SEhtK+L66PgJinA@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Replacing Web in Sato with Midori
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
X-List-Received-Date: Wed, 08 Aug 2012 15:20:35 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 08 August 2012 17:04:16 Samuel Stirtzel wrote:
> > On Wednesday 08 August 2012 16:47:05 Koen Kooi wrote:
> >> Op 8 aug. 2012, om 16:03 heeft Paul Eggleton
> >> <paul.eggleton@linux.intel.com>> 
> > het volgende geschreven:
>
> > And? KDE is far more demanding upon Qt than most Qt-based applications. We
> > had to make specific changes to our Qt recipes just to accommodate it.
>
> If you're talking about adding accessibility and session management to
> configure -> these are set by default by Qt.
> Don't know why they where unset in oe-core though.

Not specifically, I was mainly referring to changes such as providing qt4-
native; we did not need to do that before.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


