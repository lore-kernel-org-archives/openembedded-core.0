Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 9B8676AFED
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2013 21:53:35 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 02 Jul 2013 14:53:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,983,1363158000"; d="scan'208";a="263298387"
Received: from unknown (HELO helios.localnet) ([10.252.121.242])
	by AZSMGA002.ch.intel.com with ESMTP; 02 Jul 2013 14:53:35 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Tue, 02 Jul 2013 22:53:34 +0100
Message-ID: <1543512.IOqlhupRf5@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.4 (Linux/3.8.0-25-generic; KDE/4.10.4; i686; ; )
In-Reply-To: <1372800607.25291.43.camel@ted>
References: <cover.1372777132.git.sgw@linux.intel.com>
	<1372800607.25291.43.camel@ted>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/44] Pre-M2 Patches and Updates
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
X-List-Received-Date: Tue, 02 Jul 2013 21:53:35 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 02 July 2013 22:30:07 Richard Purdie wrote:
> On Tue, 2013-07-02 at 08:09 -0700, Saul Wold wrote:
> > We have reviewed and built and done some testing on the following
> > patch set.  Paul worked on fixing a number of the Autobuilder
> > failures from MUT.
> 
> Thanks, I merged these.
> 
> > Paul has a bitbake patch for M2 also
> 
> Ok, but where do I find it? Can't see a patch from him on the bitbake
> mailing list?

It was Cristiana's hob patch. I have pushed this to the paule/bitbake branch 
on poky-contrib, sorry for not sending you this previously.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

