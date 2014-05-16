Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (unknown [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 43F9E6028A;
	Fri, 16 May 2014 10:51:07 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 16 May 2014 03:51:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1066,1389772800"; d="scan'208";a="532984221"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.123.87])
	by fmsmga001.fm.intel.com with ESMTP; 16 May 2014 03:51:07 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Date: Fri, 16 May 2014 11:51:06 +0100
Message-ID: <21882547.zdJQee8rlR@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.5 (Linux/3.14.3-200.fc20.x86_64; KDE/4.12.5; x86_64; ; )
In-Reply-To: <ljlih4$rvg$1@ger.gmane.org>
References: <1874660.NNkBdmWv1O@peggleto-mobl5.ger.corp.intel.com>
	<3327056.Df3VZKvVg7@peggleto-mobl5.ger.corp.intel.com>
	<ljlih4$rvg$1@ger.gmane.org>
MIME-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>
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
X-List-Received-Date: Fri, 16 May 2014 10:51:08 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 28 April 2014 14:45:26 Koen Kooi wrote:
> Paul Eggleton schreef op 28-04-14 13:08:
> > OK then, how about this instead:
> > 
> > 1) Ensure the "openembedded-core" repository is kept up-to-date
> > 
> > 2) Add a "meta-openembedded" repository and ensure it is kept up-to-date
> > 
> > 3) Add a warning to the description for the contracted name repositories
> > that the fully-named repositories should be used instead, so we can
> > eventually drop them
> > 
> > 4) Change documentation / scripts to match #3
> 
> Sounds like a good plan to me!

OK, so who will do this then (whoever has access)?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

