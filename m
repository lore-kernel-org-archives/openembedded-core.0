Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4AA8E6057A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Sep 2016 22:00:17 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga105.fm.intel.com with ESMTP; 15 Sep 2016 15:00:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,341,1470726000"; d="scan'208";a="879558847"
Received: from ananthna-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.179.76])
	by orsmga003.jf.intel.com with ESMTP; 15 Sep 2016 15:00:14 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Fri, 16 Sep 2016 10:00:12 +1200
Message-ID: <1517439.eAOeRX8ZQL@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.7.3-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <1473976307.7207.151.camel@linuxfoundation.org>
References: <72492146-b352-1f59-1d23-26f71773d689@mlbassoc.com>
	<6144111.OaLyj9AJNZ@peggleto-mobl.ger.corp.intel.com>
	<1473976307.7207.151.camel@linuxfoundation.org>
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Gary Thomas <gary@mlbassoc.com>
Subject: Re: Crazy display
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Sep 2016 22:00:18 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thu, 15 Sep 2016 22:51:47 Richard Purdie wrote:
> On Fri, 2016-09-16 at 08:41 +1200, Paul Eggleton wrote:
> > On Thu, 15 Sep 2016 22:26:09 Gary Thomas wrote:
> > > On 2016-09-15 22:12, Burton, Ross wrote:
> > > > On 15 September 2016 at 21:03, Paul Eggleton 
> > 
> > <paul.eggleton@linux.intel.com <mailto:paul.eggleton@linux.intel.com>
> > 
> > > wrote:
> > > >     Are you guys perhaps using the same terminal application?
> > > > Using screen
> > > >     / tmux / anything similar? (I'm using screen here and haven't
> > > >     experienced problems though.)
> > > > 
> > > > I'm using iTerm2 on a Mac to run normal SSH to my Linux box. No
> > > > screen/tmux/etc.
> > > 
> > > Pretty much the same for me - just SSH in an xterm window.
> > 
> > Hmm, I'm still no closer then.
> > 
> > Does it just start happening at some point in the middle of a build?
> > Or right 
> > from the start?
> 
> Seems to happen at various points during the build. Looks like bad
> timing of console updates so can happen at any point, I'd see evidence
> its happened multiple times in a given build.

This is bizarre. Clearly something is different between your systems and mine 
:/

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

