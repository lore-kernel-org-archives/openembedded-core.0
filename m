Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id 89AF260438
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Aug 2014 04:37:09 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20140809043709024
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Aug 2014 04:37:09 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [99.240.204.5] (port=57515 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1XFyOu-0004PN-Bw; Sat, 09 Aug 2014 00:37:04 -0400
Date: Sat, 9 Aug 2014 00:37:00 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: Saul Wold <sgw@linux.intel.com>
In-Reply-To: <53E54245.4070704@linux.intel.com>
Message-ID: <alpine.LFD.2.11.1408090036400.30229@localhost>
References: <alpine.LFD.2.11.1408081529290.23581@localhost>
	<53E54245.4070704@linux.intel.com>
User-Agent: Alpine 2.11 (LFD 23 2013-08-11)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Remove "SRC_URI_OVERRIDES_PACKAGE_ARCH = 0" from tslib.bb
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
X-List-Received-Date: Sat, 09 Aug 2014 04:37:10 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Fri, 8 Aug 2014, Saul Wold wrote:

> On 08/08/2014 12:31 PM, Robert P. J. Day wrote:
> >
> > Given that there are no machine-specific files for the tslib recipe
> > anymore, might as well remove this line.
> >
>
> Robert,
>
> Can you please review the commit guidelines
>
> http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines
>
> The summary line should be in the form of
> tslib: Remove ...
>
> I know it's a trivial patch, but it would good to have the commit message
> correct.

  quite so, i'll resubmit properly.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


