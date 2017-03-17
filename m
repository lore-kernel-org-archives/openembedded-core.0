Return-Path: <cshored@cshore.thecshore.com>
X-Greylist: delayed 2584 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 18 Mar 2017 00:38:24 UTC
Received: from s2.neomailbox.net (s2.neomailbox.net [5.148.176.60])
	by mail.openembedded.org (Postfix) with ESMTP id 4A02377B2B
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Mar 2017 00:38:24 +0000 (UTC)
Date: Fri, 17 Mar 2017 19:55:15 -0400
From: Daniel Dickinson <cshored@cshore.thecshore.com>
To: openembedded-core@lists.openembedded.org
Message-ID: <20170317195515.35729bb7@danielf.thecshore.com>
MIME-Version: 1.0
Subject: Hints on submitting to OE-Core
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
X-List-Received-Date: Sat, 18 Mar 2017 00:38:25 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi all,

I've got a pre-alpha 'distro' and some layers I think that could get to
an interesting state.  The intent is to work them up to where they are
suitable to be submitted as patches to oe-core rather than the
current .bbappend and related files.

There's rather a lot of reading (which is good in the sense that I like
actually have documentation, although that's definitely an area I need
to improve on for the layers I've got in the works), and I haven't
nearly got through it all yet, but I was hoping for pointers on the
most important bits to read for prepping patches submission.

Also, in the layers list I'll be asking about some build issues that I
don't see with a manual bitbake, that look like missing preqs on a build
server, unless the layer should be requesting installation of host files
somewhere.

Regards,

Daniel

