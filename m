Return-Path: <rpjday@crashcourse.ca>
Received: from smtp485.redcondor.net (smtp485.redcondor.net [208.80.204.85])
	by mail.openembedded.org (Postfix) with ESMTP id C9A5060112
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 10:53:02 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp485.redcondor.net ({3be039ea-4351-44b0-a8af-642c38b25916})
	via TCP (outbound) with ESMTPS id 20151120105301376_0485
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 10:53:01 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
X-RC-RCPT: <openembedded-core@lists.openembedded.org>
Received: from [99.240.204.5] (port=59836 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES128-SHA:128)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1ZzjK9-0005Vh-HP for openembedded-core@lists.openembedded.org;
	Fri, 20 Nov 2015 05:53:49 -0500
Date: Fri, 20 Nov 2015 05:52:52 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Message-ID: <alpine.LFD.2.20.1511200538050.1546@localhost>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Subject: can i use qemuppc to demo an example of using UIO?
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
X-List-Received-Date: Fri, 20 Nov 2015 10:53:04 -0000
Content-Type: text/plain; charset=US-ASCII


  i'm not sure i've done enough research to even ask this question
intelligently, but can i use OE to build and demo what is described
here?

  http://nairobi-embedded.org/uio_example.html

while that article uses x86_64, i would *prefer* to use qemuppc as
that is the preferred target architecture, but i can always use x86_64
in a pinch.

  for a number of OE/embedded linux classes i'm going to be teaching
next year, i'm trying to shift a number of exercises from needing
actual hardware to using QEMU images, and this is something i'd dearly
love to be able to demo using QEMU.

  thoughts? i'm still digging into this, but can anyone point out any
obvious flaws in my plan? thanks.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================


