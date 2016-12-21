Return-Path: <rpjday@crashcourse.ca>
Received: from smtp484.redcondor.net (smtp484.redcondor.net [208.80.204.84])
	by mail.openembedded.org (Postfix) with ESMTP id 9535A71BFE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2016 10:33:05 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp484.redcondor.net ({c48374e7-08df-40d9-a0de-96cc9883a037})
	via TCP (outbound) with ESMTPS id 20161221103304064_0484;
	Wed, 21 Dec 2016 10:33:04 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [174.118.92.171] (port=46888 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cJeCe-0005YE-CJ; Wed, 21 Dec 2016 05:32:56 -0500
Date: Wed, 21 Dec 2016 05:31:32 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: "Burton, Ross" <ross.burton@intel.com>
In-Reply-To: <CAJTo0LbWx_xHVAL9O9xVRybW8tZY9a0uDVVArOMzfB1s5R0qwg@mail.gmail.com>
Message-ID: <alpine.LFD.2.20.1612210529550.13691@localhost.localdomain>
References: <alpine.LFD.2.20.1612201321490.5281@localhost.localdomain>
	<CAJTo0LbWx_xHVAL9O9xVRybW8tZY9a0uDVVArOMzfB1s5R0qwg@mail.gmail.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: $50 bounty for an OE recipe for libfilesys-smbclient-perl. seriously.
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
X-List-Received-Date: Wed, 21 Dec 2016 10:33:07 -0000
Content-Type: multipart/mixed; BOUNDARY="8323328-829467069-1482316296=:13691"

--8323328-829467069-1482316296=:13691
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 20 Dec 2016, Burton, Ross wrote:

> On 20 December 2016 at 18:32, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>         really, i just don't have time to mess with this anymore and
>       i'm more than happy to pay someone $50 CAD (interac transfer)
>       to provide me with a proper recipe and essential patches for
>       the perl module Filesys-SmbClient-3.2 here:
>
>
> FWIW I had a quick look at this.  I'm certainly no perl guru and can
> barely understand it, but it does *so much* wrong that if you really
> need this then it would be easier to just rewrite the makefile.pl
> from scratch.  Once you remove the hunting for the headers in the
> wrong place, it then invokes an autoconf script...  which needs to
> be passed the right options.
>
> Do you really need this module?  It's not been updated for many
> years, so surely there's something better.

  i have been *told* that this module is necessary, i don't know
enough about the context to know what for. if there is something more
recent that has the same capability, then i'd love to see it.

  until then, $50 is still up for grabs.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

--8323328-829467069-1482316296=:13691--
