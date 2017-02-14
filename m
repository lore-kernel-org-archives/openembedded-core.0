Return-Path: <rpjday@crashcourse.ca>
Received: from smtp685.redcondor.net (smtp685.redcondor.net [208.80.206.85])
	by mail.openembedded.org (Postfix) with ESMTP id 8667A71A91
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 15:13:08 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp685.redcondor.net ({20c8e40f-6b6c-4c9e-abff-1640ea7bf404})
	via TCP (outbound) with ESMTPS id 20170214151304103_0685;
	Tue, 14 Feb 2017 07:13:04 -0800
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [216.191.234.70] (port=48922 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1cdemo-0005H0-P9; Tue, 14 Feb 2017 10:12:58 -0500
Date: Tue, 14 Feb 2017 10:12:56 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@uk63952.mitel.com
To: Patrick Ohly <patrick.ohly@intel.com>
In-Reply-To: <1487083875.13854.331.camel@intel.com>
Message-ID: <alpine.LFD.2.20.1702141011420.29478@uk63952.mitel.com>
References: <alpine.LFD.2.20.1702140930180.28864@uk63952.mitel.com>
	<1487083875.13854.331.camel@intel.com>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: how to select for non-volatile /var/log?
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
X-List-Received-Date: Tue, 14 Feb 2017 15:13:13 -0000
Content-Type: text/plain; charset=US-ASCII

On Tue, 14 Feb 2017, Patrick Ohly wrote:

> On Tue, 2017-02-14 at 09:31 -0500, Robert P. J. Day wrote:
> >   i recall, once upon a time, a discussion of how to best support a
> > non-volatile /var/log directory:
> >
> > https://patchwork.openembedded.org/patch/90151/
>
> A more recent, but also still unmerged patch for this functionality
> is here: https://patchwork.openembedded.org/patch/90839/

  "more recent" would appear to be a relative term, since the date on
that is may of 2015. it seems that this topic comes up every so often,
then just dies. so is there any *current* discussion to add this
feature? be nice if this issue was just resolved, one way or the
other.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


