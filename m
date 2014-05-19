Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (unknown [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id CCB7665F69
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 09:09:32 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 19 May 2014 02:09:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,865,1392192000"; d="scan'208";a="534060193"
Received: from akagikob-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.55])
	by fmsmga001.fm.intel.com with ESMTP; 19 May 2014 02:09:04 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Phil Blundell <pb@pbcl.net>
Date: Mon, 19 May 2014 10:09:02 +0100
Message-ID: <33349238.TiGAmUYbOr@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.5 (Linux/3.14.3-200.fc20.x86_64; KDE/4.12.5; x86_64; ; )
In-Reply-To: <20140518190117.GA20035@pbcl.net>
References: <1874660.NNkBdmWv1O@peggleto-mobl5.ger.corp.intel.com>
	<21882547.zdJQee8rlR@peggleto-mobl5.ger.corp.intel.com>
	<20140518190117.GA20035@pbcl.net>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: OE Github repositories
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
X-List-Received-Date: Mon, 19 May 2014 09:09:35 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Sunday 18 May 2014 21:01:18 Phil Blundell wrote:
> On Fri, May 16, 2014 at 11:51:06AM +0100, Paul Eggleton wrote:
> > On Monday 28 April 2014 14:45:26 Koen Kooi wrote:
> > > Paul Eggleton schreef op 28-04-14 13:08:
> > > > OK then, how about this instead:
> > > > 
> > > > 1) Ensure the "openembedded-core" repository is kept up-to-date
> > > > 
> > > > 2) Add a "meta-openembedded" repository and ensure it is kept
> > > > up-to-date
> > > > 
> > > > 3) Add a warning to the description for the contracted name
> > > > repositories
> > > > that the fully-named repositories should be used instead, so we can
> > > > eventually drop them
> > > > 
> > > > 4) Change documentation / scripts to match #3
> > > 
> > > Sounds like a good plan to me!
> > 
> > OK, so who will do this then (whoever has access)?
> 
> [Cc list trimmed due to non-member posting constraints on oe-devel.]
> 
> I've done #1, #2 and #3.  I didn't know what scripts you were referring to
> in #4 so I haven't taken any action on that.

OK, they're spread around a bit so I think others can take care of #4. Thanks!

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

