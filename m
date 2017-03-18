Return-Path: <cshored@cshore.thecshore.com>
Received: from s2.neomailbox.net (s2.neomailbox.net [5.148.176.60])
	by mail.openembedded.org (Postfix) with ESMTP id 10A6573043
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Mar 2017 17:17:42 +0000 (UTC)
Date: Sat, 18 Mar 2017 13:17:04 -0400
From: Daniel Dickinson <cshored@cshore.thecshore.com>
To: akuster808 <akuster808@gmail.com>
Message-ID: <20170318131514.2d1aab15@danielf.thecshore.com>
In-Reply-To: <bdebc471-dded-69fb-1ae1-d27e1ec751ed@gmail.com>
References: <20170317195515.35729bb7@danielf.thecshore.com>
	<3a6a7bd6-a5e5-b139-bc2a-53d3b6b41da5@mlbassoc.com>
	<bdebc471-dded-69fb-1ae1-d27e1ec751ed@gmail.com>
MIME-Version: 1.0
Cc: Gary Thomas <gary@mlbassoc.com>, openembedded-core@lists.openembedded.org
Subject: Re: Hints on submitting to OE-Core
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
X-List-Received-Date: Sat, 18 Mar 2017 17:17:43 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 18 Mar 2017 01:42:06 -0700
akuster808 <akuster808@gmail.com> wrote:

> On 03/17/2017 06:21 PM, Gary Thomas wrote:
> > On 2017-03-18 00:55, Daniel Dickinson wrote:  
> >> Hi all,
> >>
> >> I've got a pre-alpha 'distro' and some layers I think that could
> >> get to an interesting state.  The intent is to work them up to
> >> where they are suitable to be submitted as patches to oe-core
> >> rather than the current .bbappend and related files.
> >>
> >> There's rather a lot of reading (which is good in the sense that I
> >> like actually have documentation, although that's definitely an
> >> area I need to improve on for the layers I've got in the works),
> >> and I haven't nearly got through it all yet, but I was hoping for
> >> pointers on the most important bits to read for prepping patches
> >> submission.  
> >
> > Have you read this?
> > http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded  
> 
> To be honest, OE-core does not even comply to the basic standard of a 
> README. It missing patch submission info like many other layers do
> nor does in include the Maintainer.
> 

I guess I was so glad of the Yocto manuals that I didn't notice the
per-layer bits; that's kind of ironic, and a good place to create some
patches for practice, I think!

Regards,

Daniel

